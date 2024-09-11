const os = require('os');

// Platform
const platform = os.platform();

// CPU Arch
const cpuArch = os.arch();

// CPU Core Info
const cpuCoreInfo = os.cpus();

// os.uptime() method returns the system uptime in seconds.
const uptime = os.uptime();

// os.userInfo() method returns information about the currently effective user.
const userInfo = os.userInfo();

// other info
const otherInfo = {
    name: os.type(),
    osRelease: os.release(),
    totalMem: os.totalmem(),
    freeMem: os.freemem(),
};

// Let's check the result

console.log('Platform: ', platform);
console.log('CPU Arch: ', cpuArch);
console.log('CPU Core Info: ', cpuCoreInfo);
console.log('Uptime: ', uptime);
console.log('User Info: ', userInfo);
console.log('Other Info: ', otherInfo);