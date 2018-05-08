<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title>
<link rel="stylesheet" type="text/css" href="login/css/stylereg.css" />
</head>
<body>
	<div class="register">
		<div class="message">
			<img src="login/img/regist.png" />
		</div>
		<form action="Reg_servlet" method="post" name="registerForm"
			onsubmit="return checkdata()">

			<input type="text" name="user" placeholder="请输入用户名">
			<input type="hidden" name="Type" value="user">
			<hr class="hr15" />
			<input type="password" name="pass" placeholder="请输入密码">
			<hr class="hr15" />
			<input type="password" name="pass2" placeholder="请再次确认密码"
				onblur="password2Change(this)">
			<hr class="hr15" />
			<input type="email" name="mail" placeholder="请输入邮箱">
			<hr class="hr15" />
			<input type="number" min="1" max="100" name="age" placeholder="请输入年龄">
			<hr class="hr15" />
			<input type="text" name="home" placeholder="请输入地址">
			<hr class="hr15" />
			性别： <input type="radio" id="man" name="gender" value="male">男<input
				type="radio" id="women" name="gender" value="female">女
			<hr class="hr15" />
			<input value="注册" type="submit" />

		</form>
		<script src="login/js/main.js" type="text/javascript" charset="utf-8"></script>
	</div>

</body>
</html>