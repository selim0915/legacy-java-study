var users = [{name:'소녀시대', age:20}, {name:'걸스데이', age:22}];
console.log('배열갯수: '+users.length);

users.push({name:'aa', age:10});
console.log('배열갯수: '+users.length);

var elem = users.pop();
console.log('배열갯수: '+users.length);

console.log('pop꺼낸 원소');
console.dir(elem);