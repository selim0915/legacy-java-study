<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="container" style="background-color: #ffffff; width: 550px; min-height: 820px;;">
		<h1 style="text-align: center;">회원가입</h1>
		<form class="form" action="" id="submits" name="submits">
			<div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>ID</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="id" id="id" type="text" placeholder="아이디를 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn" id="btn">ID중복체크</button>
			      </div>
		    </div>
		    <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>NICKNAME</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="nickname" id="nickname" type="text" placeholder="닉네임을 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn2" id="btn2">닉네임
						체크</button>
			      </div>
		    </div>
		     <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASSWORD</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<input class="form-control " name="pwd" id="pwd" type="password" placeholder="비밀번호를 입력해주세요">
			      </div>
			 </div>
		     <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASCHECK</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<input class="form-control " name="pwds" id="pwds" type="password" placeholder="재입력해주세요">
			      </div>
			 </div>
			  <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>AGE</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<select name="age" id="age" class="form-control">
						<option value="10">10대</option>
						<option value="20">20대</option>
						<option value="30">30대</option>
						<option value="40">40대</option>
						<option value="50">50대</option>
						<option value="60">60대</option>
					</select>
			      </div>
			 </div>
			 <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="gender" style="margin-top:5px;"><b>GENDER</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<select name="gender" id="gender" class="form-control">
						<option>남</option>
						<option>여</option>
					</select>
			      </div>
			 </div>
			<div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="email" style="margin-top:5px;"><b>EMAIL</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="email" id="email" type="text" placeholder="이메일을 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn3" id="btn3">email 체크</button>
			      </div>
		    </div>
			<div class="form-group">
				<div style="text-align: center;">
					
					<input class="btn btn-md background text" id="submit" type="submit" value="확인"name="submits">
					<input class="btn btn-md background text" type="reset" value="취소" id="reset">
				</div>
			</div>
		</form>
	</div>