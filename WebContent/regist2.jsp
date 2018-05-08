<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>商家注册</title>
		<link rel="stylesheet" type="text/css" href="regist2/css/stylereg.css"/>
	</head>
	<body>
		<div class="register">
			<div class="message"><img src="regist2/img/regist.png"/></div>
			
			<!-- 通过onsubmit验证是否提交  false不提交，，true 提交-->
			<form action="Reg_servlet" method="get" name="registerForm" onsubmit="return checkdata()">
				<input  name="name" placeholder="请输入用户名" required="" type="text"/>
				<hr class="hr15" />
				<input  name="password" placeholder="请输入密码" required="" type="password"/>
				<hr class="hr15" />
				<input type="hidden" name="Type" value="business">
				<input  name="password2" placeholder="请再次确认密码" onblur="password2Change(this)" required="" type="password"/>
				<hr class="hr15" />
				<input type="radio"name="gender"value="food" checked="checked" />美食
                <input type="radio"name="gender"value="home"/>住宅
                <input type="radio"name="gender"value="walk"/>出行
                <input type="radio"name="gender"value="sport"/>运动
                <hr class="hr15" />
		        <button  value="商户注册"type="submit"> 商户注册</button>
			</form>
			
			<script src="regist2/js/main.js" type="text/javascript" charset="utf-8"></script>
		</div>
	</body>
</html>
