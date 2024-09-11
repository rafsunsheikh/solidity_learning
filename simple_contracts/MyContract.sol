// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // State Variables
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;
    int256 myInt = 1;

    string public myString = "Hello, world";
    bytes32 public myBytes32 = "Hello, world";


    address public myAddress = 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99;

    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World");

    // local Variables
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }

    // Arrays
    uint[] public uintArray = [1,2,3,4];
    string[] public stringArray = ["Apple", "banana", "carrot"];
    string[] public values;

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint) {
        return values.length;
    }

    // Two-dimentional array
    uint256[][]public array2D = [[1,2,3], [4,5,6]];

    // Mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    // Nested Mapping
    mapping(address => mapping(uint => Book)) public myBooks;


    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }



}