// SPDX-License-Identifier: MIT

//  Off-chain signature gathering multisig that streams funds - @austingriffith
//
// started from 🏗 scaffold-eth - meta-multi-sig-wallet example https://github.com/austintgriffith/scaffold-eth/tree/meta-multi-sig
//    (off-chain signature based multi-sig)
//  added a very simple streaming mechanism where `onlySelf` can open a withdraw-based stream
//

pragma solidity >=0.8.0 <0.9.0;
// Not needed to be explicitly imported in Solidity 0.8.x
// pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract MetaMultiSigWallet {
    using ECDSA for bytes32; // Using the ECDSA library for the bytes32 type

    event Deposit(address indexed sender, uint amount, uint balance);
    event ExecuteTransaction(
        address indexed owner,
        address payable to,
        uint256 value,
        bytes data,
        uint256 nonce,
        bytes32 hash,
        bytes result
    );
    event Owner(address indexed owner, bool added);
    mapping(address => bool) public isOwner;
    uint public signaturesRequired;
    uint public nonce;
    uint public chainId;

    constructor(
        uint256 _chainId,
        address[] memory _owners,
        uint _signaturesRequired
    ) {
        require(
            _signaturesRequired > 0,
            "constructor: must be non-zero sigs required"
        );
        signaturesRequired = _signaturesRequired; // This is a uint value. Holding the total number of Signers
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i]; // This is the address of the Signer
            require(owner != address(0), "constructor: zero address"); // Checking if the address is not 0x0
            require(!isOwner[owner], "constructor: owner not unique"); // Checking if the address is unique or not
            isOwner[owner] = true; // Setting the address as a Signer
            emit Owner(owner, isOwner[owner]); // Emitting the event
        }
        chainId = _chainId; // This is the Chain ID
    }

    modifier onlySelf() {
        require(msg.sender == address(this), "Not Self"); // Checking if the sender is the contract itself
        _;
    }

    function addSigner(
        address newSigner,
        uint256 newSignaturesRequired
    ) public onlySelf {
        require(newSigner != address(0), "addSigner: zero address"); // Checking if the address is not 0x0
        require(!isOwner[newSigner], "addSigner: owner not unique"); // Checking if the address is unique or not
        require(
            newSignaturesRequired > 0,
            "addSigner: must be non-zero sigs required"
        ); // Checking if the number of Signers is greater than 0
        isOwner[newSigner] = true; // Setting the address as a Signer
        signaturesRequired = newSignaturesRequired; // Setting the number of Signers
        emit Owner(newSigner, isOwner[newSigner]); // Emitting the event
    }

    function removeSigner(
        address oldSigner,
        uint256 newSignaturesRequired
    ) public onlySelf {
        require(isOwner[oldSigner], "removeSigner: not owner"); // Checking if the address is a Signer
        require(
            newSignaturesRequired > 0,
            "removeSigner: must be non-zero sigs required"
        ); // Checking if the number of Signers is greater than 0
        isOwner[oldSigner] = false; // Removing the address from the Signers
        signaturesRequired = newSignaturesRequired; // Setting the number of Signers
        emit Owner(oldSigner, isOwner[oldSigner]); // Emitting the event
    }

    function updateSignaturesRequired(
        uint256 newSignaturesRequired
    ) public onlySelf {
        require(
            newSignaturesRequired > 0,
            "updateSignaturesRequired: must be non-zero sigs required"
        );
        signaturesRequired = newSignaturesRequired;
    }

    function getTransactionHash(
        uint256 _nonce,
        address to,
        uint256 value,
        bytes memory data
    ) public view returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    address(this),
                    chainId,
                    _nonce,
                    to,
                    value,
                    data
                )
            ); // This is the hash of the transaction
    }

    function executeTransaction(
        address payable to,
        uint256 value,
        bytes memory data,
        bytes[] memory signatures
    ) public returns (bytes memory) {
        require(
            isOwner[msg.sender],
            "executeTransaction: only owners can execute"
        );
        bytes32 _hash = getTransactionHash(nonce, to, value, data);
        nonce++;
        uint256 validSignatures;
        address duplicateGuard;
        for (uint i = 0; i < signatures.length; i++) {
            address recovered = recover(_hash, signatures[i]);
            require(
                recovered > duplicateGuard,
                "executeTransaction: duplicate or unordered signatures"
            );
            duplicateGuard = recovered;
            if (isOwner[recovered]) {
                validSignatures++;
            }
        }

        require(
            validSignatures >= signaturesRequired,
            "executeTransaction: not enough valid signatures"
        );

        (bool success, bytes memory result) = to.call{value: value}(data);
        require(success, "executeTransaction: tx failed");

        emit ExecuteTransaction(
            msg.sender,
            to,
            value,
            data,
            nonce - 1,
            _hash,
            result
        );
        return result;
    }

    function recover(
        bytes32 _hash,
        bytes memory _signature
    ) public pure returns (address) {
        return _hash.toEthSignedMessageHash().recover(_signature);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    //
    //  new streaming stuff
    //

    event OpenStream(address indexed to, uint256 amount, uint256 frequency);
    event CloseStream(address indexed to);
    event Withdraw(address indexed to, uint256 amount, string reason);

    struct Stream {
        uint256 amount;
        uint256 frequency;
        uint256 last;
    }
    mapping(address => Stream) public streams;

    function streamWithdraw(uint256 amount, string memory reason) public {
        require(streams[msg.sender].amount > 0, "withdraw: no open stream");
        _streamWithdraw(payable(msg.sender), amount, reason);
    }

    function _streamWithdraw(
        address payable to,
        uint256 amount,
        string memory reason
    ) private {
        uint256 totalAmountCanWithdraw = streamBalance(to);
        require(totalAmountCanWithdraw >= amount, "withdraw: not enough");
        streams[to].last =
            streams[to].last +
            (((block.timestamp - streams[to].last) * amount) /
                totalAmountCanWithdraw);
        emit Withdraw(to, amount, reason);
        to.transfer(amount);
    }

    function streamBalance(address to) public view returns (uint256) {
        return
            (streams[to].amount * (block.timestamp - streams[to].last)) /
            streams[to].frequency;
    }

    function openStream(
        address to,
        uint256 amount,
        uint256 frequency
    ) public onlySelf {
        require(streams[to].amount == 0, "openStream: stream already open");
        require(amount > 0, "openStream: no amount");
        require(frequency > 0, "openStream: no frequency");

        streams[to].amount = amount;
        streams[to].frequency = frequency;
        streams[to].last = block.timestamp;

        emit OpenStream(to, amount, frequency);
    }

    function closeStream(address payable to) public onlySelf {
        require(streams[to].amount > 0, "closeStream: stream already closed");
        _streamWithdraw(to, streams[to].amount, "stream closed");
        delete streams[to];
        emit CloseStream(to);
    }
}
