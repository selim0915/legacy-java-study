function add(a,b,callback){
    var result = a+b;
    callback(result);
    
    var count =0;
    var history = function(){
        count +=1;
        return count + ':' +a+ '+'+b+'='+result;
    };
    
    return history;
}

var add_history = add(20,20, function(result){
   console.log('sum: '+ result); 
});

console.log('add_history: '+ typeof(add_history));

console.log('결과값으로 함수 실행: '+ add_history());