// import { useState } from 'react';
// import { ethers } from 'ethers';
// import Lock from "./artifacts/contracts/Lock.sol/Lock.json";

// import logo from './logo.svg';
// import './App.css';

// // The Lock Address
// const LockAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

// function App() {
//   return (
//     <div className="App">
//       <header className="App-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p>
//           Edit <code>src/App.js</code> and save to reload.
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }

// export default App;


import { useState } from 'react';
import { ethers } from 'ethers';
import Lock from "./artifacts/contracts/Lock.sol/Lock.json";

import './App.css';

// The Lock Contract Address (Replace with the deployed contract address)
const LockAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

function App() {
  // State to store contract data
  const [unlockTime, setUnlockTime] = useState(null);
  const [owner, setOwner] = useState(null);
  const [error, setError] = useState(null);
  const [account, setAccount] = useState(null);

  // Function to request access to user's Metamask account
  async function requestAccount() {
    await window.ethereum.request({ method: 'eth_requestAccounts' });
  }

  // Function to connect to the smart contract and fetch data
  async function getContractData() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const contract = new ethers.Contract(LockAddress, Lock.abi, provider);

      try {
        const unlockTime = await contract.unlockTime();
        const owner = await contract.owner();

        setUnlockTime(new Date(unlockTime.toNumber() * 1000).toLocaleString());
        setOwner(owner);
      } catch (err) {
        setError("Error: " + err.message);
      }
    }
  }

  // Function to withdraw funds
  async function withdrawFunds() {
    if (typeof window.ethereum !== 'undefined') {
      await requestAccount();

      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(LockAddress, Lock.abi, signer);

      try {
        const transaction = await contract.withdraw();
        await transaction.wait();
        alert("Funds withdrawn!");
      } catch (err) {
        setError("Error: " + err.message);
      }
    }
  }

  return (
    <div className="App">
      <header className="App-header">
        <h1>Lock Contract</h1>
        {account ? (
          <div>
            <p><strong>Owner:</strong> {owner}</p>
            <p><strong>Unlock Time:</strong> {unlockTime}</p>
            <button onClick={withdrawFunds}>Withdraw Funds</button>
            {error && <p style={{ color: 'red' }}>{error}</p>}
          </div>
        ) : (
          <button onClick={requestAccount}>Connect Wallet</button>
        )}
        <button onClick={getContractData}>Get Contract Data</button>
      </header>
    </div>
  );
}

export default App;
