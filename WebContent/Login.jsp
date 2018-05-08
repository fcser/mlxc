<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="login/css/style.css" />
<script language="javascript">
function changeItem(i)
{
	var text=document.getElementById("text");
	var pass=document.getElementById("password");
    if(i==0)
    {
    	
    	text.value="12431895@qq.com";
    	pass.value="123456";
    }
    if(i==1)
    {
    	text.value="ws";
    	pass.value="123456";
    }
    if(i==2)
    {
    	text.value="zzz";
    	pass.value="123456";
    }
 }

</script>
</head>
<body>
	<div class="login">
		<div class="message">
			<img src="login/img/login.png" />
		</div>
		<hr class="hr15" />
		<form method="post" action="Login_servlet" name="form2">
			<input name="user" id="text" type="text" value="1243701895@qq.com"/>
			<hr class="hr15" />
			<input name="pass" id="password" type="password" value="12345678"/>
			<hr class="hr15" />
			<input type="radio" name="gender" value="student" checked onClick="return changeItem(0);" />用户
			<input type="radio" name="gender" value="manager" onClick="return changeItem(1);"/>管理员
			<input type="radio" name="gender" value="business" onClick="return changeItem(2);"/>商家
			<hr class="hr15" />
			<input type="submit" name="Button1" id="Button1" class="button"
				value="登录" />&nbsp;</br>
				${msg }
			<hr class="hr15" />
			<a href="regist2.jsp ">注册商家</a> 
			<a href="regist.jsp" class="register">注册用户</a>
		</form>
	</div>
</body>
</html>
