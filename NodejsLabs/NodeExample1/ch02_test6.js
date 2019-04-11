var calc2 = require('./calc2');

console.log('모듈로 분리한 후 - calc2.add: '+ calc2.add(30,30));

var nconf = require('nconf');
var value = nconf.get('os');
console.log('os 환경변수의 값: '+value);
