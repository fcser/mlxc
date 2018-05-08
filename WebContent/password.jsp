<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="personal/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="personal/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>修改密码</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="personal/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="personal/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="personal/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="personal/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="personal/css/pintuer.css">
    <link rel="stylesheet" href="personal/css/admin.css">
    <script src="personal/js/jquery.js"></script>
    <script src="personal/js/pintuer.js"></script>
</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

	<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

		<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">个 人 中 心 </a>
            </div>

            <ul class="nav">
               
                <li> <!-- class="active"-->
                    <a href="introduce.jsp?id=${USER.id }">
                        <i class="ti-user"></i>
                        <p>个人资料</p>
                    </a>
                </li>
               
                <li class="active">
                    <a href="password.jsp?id=${USER.id }">
                        <i class="ti-text"></i>
                        <p>修改密码</p>
                    </a>
                </li>
                 <li>
                    <a href="footmark.jsp?id=${USER.id }" >
                        <i class="ti-view-list-alt"></i>
                        <p>我的足迹</p>
                    </a>
                </li> 
            </ul>
    	</div>
    </div>
   

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">修改密码</a>
                </div>                
            </div>
        </nav>
        <div class="panel admin-panel">
  <!--<div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>-->
  <div class="body-content">
    <form method="post" class="form-x" action="Edit_servlet">
      <div class="form-group">
        <div class="label">
          <label for="sitename">昵称：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">${USER.user } </label>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" name="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
        <input type="hidden" name="id" value="${USER.id }">
       <input type="hidden" name="Type" value="changemima">
       <input type="hidden" name="oldpassword" value="${USER.password }">
          <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" name="newpassword" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>  ${msg } 
        </div>
      </div> 
      </form>     
  </div>
</div>


        
   
        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="introduse.jsp?id=${USER.id }">个人中心   </a>
                        </li>
                        <li>
                            <a href="index.jsp">首页  </a>
                        </li>
                        
                    </ul>
                </nav>			
            </div>
        </footer>


    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="personal/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="personal/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="personal/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="personal/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="personal/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="personal/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</html>
