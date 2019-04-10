var person = {};

person.name = '소녀시대';
person['age'] = 20;
person.add = function(a,b){
    return a+b;
};

console.log('sum: '+person.add(10,20));