function sayHello(name){
    console.log(`Hello ${name}`);
}

function myFunction2() {
    console.log('Hello from myFunction2!');
  }

module.exports = {
    foo: 'bar',
    sayHello: sayHello,
    myFunction2: myFunction2

};