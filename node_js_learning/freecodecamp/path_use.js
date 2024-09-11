// import 'path' modeule using the require() method:
const path = require('path');

// Assign a path to the myPath variable
const myPath = '/home/mdrafsunsheikh/Desktop/solidity_learning/node_js_learning/freecodecamp/path_use.js'

const pathInfo = {
    filename: path.basename(myPath),
    folderName: path.dirname(myPath),   
    filesExtension: path.extname(myPath),
    absoluteOrNot: path.isAbsolute(myPath),
    detailInfo: path.parse(myPath),
};

console.log(pathInfo);
console.log(path.join('firstPath', 'secondPath', 'path_use.js'));
console.log(path.resolve('firstPath', 'secondPath', 'path_use.js'));