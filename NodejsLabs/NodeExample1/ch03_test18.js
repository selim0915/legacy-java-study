var person1 = {name:'소녀시대', age:20};
var person2 = {name:'걸스데이', age:21};

function person(name, age){
    this.name = name;
    this.age = age;
}

person.prototype.walk = function(speed){
    console.log(speed + 'km 속도');  
};

var person3 = new person('소녀시대', 20);
var person4 = new person('걸스데이', 22);

person3.walk(10);