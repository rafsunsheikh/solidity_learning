// // __dirname Global Variable
// console.log(__dirname);

// // __filename Global Variable
// console.log(__filename);

// // Define a global variable in NodeJS
// global.myVariable = 'Hello World';

// Access the global variable
// console.log(myVariable);

const sayingHello = require('./hello');

sayingHello.sayHello('John Doe');
sayingHello.sayHello('Jane Doe');
sayingHello.sayHello('James Doe');

console.log(sayingHello.foo);
sayingHello.myFunction2();

