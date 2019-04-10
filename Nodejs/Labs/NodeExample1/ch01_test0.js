console.log('안녕');

/*console.log('방가');

console.log('감사');*/

console.log('숫자 %d 입니다',10);
console.log('문자열 %s 입니다','안녕');

var person ={
    name:'소녀시대',
    age:20
};
console.log('JSON객체입니다. %j',person);

console.dir(person);

console.time('duration_time');
var result=0;
for (var i = 0; i<10000; i++){
    result +=i;
}
console.timeEnd('duration_time');

console.log('파일 이름:%s',__filename);
console.log('패스:%s', __dirname);






















