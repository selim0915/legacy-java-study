let isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true
	}else{
		return false
	}
};

$(function(){
	$("#newMember").click(function(){
		if(isEmpty($('#empnoN').val())||isEmpty($('#enameN').val())||isEmpty($('#jobN').val())||isEmpty($('#mgrN').val())||isEmpty($('#hiredateN').val())||isEmpty($('#salN').val())||isEmpty($('#commN').val())||isEmpty($('#deptnoN').val())){
			alert("모든 값을 입력해 주세요.");
		}else{
			$.ajax({
				url:"addemp.do",
				data:{
					empno:$('#empnoN').val(),
					ename:$('#enameN').val(),
					job:$('#jobN').val(),
					mgr:$('#mgrN').val(),
					hiredate:$('#hiredateN').val(),
					sal:$('#salN').val(),
					comm:$('#commN').val(),
					deptno:$('#deptnoN').val(),
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType:"html",
				type:"POST",
				success:function(data){
					console.log(data);
					$('#empnoN').val("");$('#enameN').val("");job:$('#jobN').val("");comm:$('#commN').val("");
					$('#mgrN').val("");$('#hiredateN').val("");sal:$('#salN').val("");deptno:$('#deptnoN').val("");
					$("#empAddList").append(data);
				}
				
			})//ajax 끝
		} //else 끝
	}); // #newMember 끝 
	
	let word =0;
	$("#empListSearch").on("keyup", ()=>{
		
		word = $("#empListSearch").val();
		if(word.length==1||word.length==2||word.length==3||word.length==4){
			$.ajax({
				url:"emplistajax.do",
				data:{
					wordInt:word
				},
				dataType:"html",
				type:"POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					console.log(data);
					$("#empAddList").empty();
					$("#empAddList").append(data);
				}
				
			})//ajax 끝
		}else{
			console.log("실행할 이벤트가 없습니다." + typeof word);
			
			$.ajax({
				url:"emplistajax.do",
				data:{
					wordInt:word
				},
				dataType:"html",
				type:"POST",
				success:function(data){
					console.log(data);
					$("#empAddList").empty();
					$("#empAddList").append(data);
				}
				
			})//ajax 끝
		}
	}); //search end
	
	$("#backList").on("click", ()=>{
		$("#backList").attr('href','emplist.do');
	}); //back 이벤트 끝
	
	
	$('#empnoN').on('keyup',()=>{
		let empnoN =$('#empnoN').val();
		console.log
		if(!$.isNumeric(empnoN)||empnoN.length>4){
			$('#empnoN').val("");
			$('#hasEmpno').attr('class','form-group has-danger');
			$('#empnoN').attr('class','form-control form-control-danger');
			$("#newMember").attr("class","btn btn-default disabled");
			alert("숫자만 입력 가능합니다.");	
		}else{
			$.ajax({
				url:"checkEmpnoAjax.do",
				data:{
					empno:$('#empnoN').val()
				},
				dataType:"html",
				type:"POST",
				success:(data)=>{
					if(data=="true"){
						console.log(data);
						$('#hasEmpno').attr('class','form-group has-danger');
						$('#empnoN').attr('class','form-control form-control-danger');
						$("#newMember").attr("class","btn btn-default disabled");
					}else{
						console.log(data);
						$('#hasEmpno').attr('class','form-group has-success');
						$('#empnoN').attr('class','form-control form-control-success');
						$("#newMember").attr("class","btn btn-primary animation-on-hover");
					}
				},
				error:(xhr, textStatus, errorThrown)=>{
					console.log(textStatus);
					$('#hasEmpno').attr('class','form-group has-danger');
					$('#empnoN').attr('class','form-control form-control-danger');
					$("#newMember").attr("class","btn btn-default disabled");
				}
			})
		}

	})
	
});//	function() 끝

