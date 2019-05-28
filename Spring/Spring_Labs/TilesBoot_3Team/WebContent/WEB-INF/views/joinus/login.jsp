<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
				<div class="container" style="background-color: #fff; width: 550px; min-height: 820px;"  >
		  			<h1 style="text-align: center;">로그인</h1>
				  <form class="form-horizontal" action="loginok.db" id="submits" name="submits" >
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="id" ><b>ID:</b></label>
				      <div class="col-sm-10">
				        <input type="text" class="form-control" value="id" id="id" name="id" placeholder="아이디를 입력해주세요">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="pwd"><b>PASSWORD:</b></label>
				      <div class="col-sm-10">          
				        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요">
				      </div>
				    </div>
				    
				    <div class="form-group">        
				      <div class="col-sm-offset-2 col-sm-10">
				        <div class="checkbox">
				          <label><input type="checkbox" name="remember"> 아이디 저장하기</label>
				        </div>
				      </div>
				    </div>
				 
				    <div class="form-group text-right">        
				      <div class="col-sm-offset-2 col-sm-10">
				        <button type="submit" class="btn btn-md background text" style="margin-left: 120px;" id="button">확인</button>
				        <button type="reset" class="btn btn-md background text" id="return" >메인페이지로</button>
				      </div>
				    </div>
				    
				  </form>
				</div>