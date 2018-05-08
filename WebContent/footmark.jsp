<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="personal/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="personal/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>我的足迹</title>

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
    <link href="personal/assets/css/themify-icons.css" rel="stylesheet">

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
                <a href="introduce.jsp?id=${USER.id }" class="simple-text">个 人 中 心   </a>
            </div>

            <ul class="nav">
               <li>
                    <a href="introduce.jsp?id=${USER.id }">
                        <i class="ti-user"></i>
                        <p>个人资料</p>
                    </a>
                </li>
               
                <li>
                    <a href="password.jsp?id=${USER.id }">
                        <i class="ti-text"></i>
                        <p>修改密码</p>
                    </a>
                </li>
                 <li class="active" ><!--class="active"-->
                    <a href="footmark.jsp?id=${USER.id }">
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
                    <a class="navbar-brand" href="#">我的足迹</a>
                </div>                
            </div>
        </nav>
<%
      request.setCharacterEncoding("utf-8"); 
      response.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8");
    //String a= request.getParameter("user");
    String id=(String) request.getParameter("id");
    int ID=Integer.parseInt(id);
    User user=UserDAO.findUserByid(ID);
    System.out.println(user.getUser());
	ArrayList<Article> article=ArticleDAO.findallArticlebyauthor(user.getUser());
	request.setAttribute("article", article);
	ArrayList<Application> applicate=ApplicationDAO.FindallApplication(ID);
	//ArrayList<Activity> activity=ActivityDAO.getActivity(ApplicationDAO.FindallApplication(ID).getActivity_id());
	request.setAttribute("application", applicate);
	ArrayList<Message> message=MessageDAO.FindallMessage(ID);
	request.setAttribute("message", message);
   %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                   
                   <div class="col-md-10">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">我发表的文章</h4>
                                <!--<p class="category">Here is a subtitle for this table</p>-->
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>文章标题</th>
                                    	<th>文章简介</th>
                                        <th>发表时间</th>
                                    	<th>状态</th>
                                    	
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${article}" var="bas" begin="0" end="2">
                                        <tr>
                                        	<td>${bas.id }</td>
                                        	<td>${bas.title }</td>
                                        	<td>${bas.intro }</td>
                                            <td>${bas.time }</td>
                                        	<td>${bas.getState() }</td>
                                        	
                                        </tr>
                                        </c:forEach>
                                       
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                     <div class="col-md-10">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">我报名的活动</h4>
                                <!--<p class="category">Here is a subtitle for this table</p>-->
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>活动名称</t>
                                    	<th>报名时间</th>
                                    	<th>详细信息</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${application}" var="bas" begin="0" end="2">
                                        <tr>
                                        	<td>${bas.id }</td>
                                        	<td>${bas.getNews_title() }</td>
                                             	<td>${bas.datatime }</td>
                                        	<td><a href="active.jsp?id=${bas.activity_id }">查看详情</a></td>
                                        </tr>
                                        </c:forEach>
                                        <!--  <tr>
                                        	<td>1</td>
                                        	<td>龙舟比赛</td>
                                        	<td>划龙舟是端午节的一项竞赛项目</td>
                                        	<td>2017.05.14</td>
                                        	<td><a href="#">报名成功</a></td>
                                        </tr>
                                         <tr>
                                        	<td>1</td>
                                        	<td>龙舟比赛</td>
                                        	<td>划龙舟是端午节的一项竞赛项目</td>
                                        	<td>2017.05.14</td>
                                        	<td><a href="#">报名成功</a></td>
                                        </tr>-->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    
                     <div class="col-md-10">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">管理员回复</h4>
                                <!--<p class="category">Here is a subtitle for this table</p>-->
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                 
                                    <thead>
                                        <th>ID</th>
                                    	<th>留言时间</th>
                                    	<th>留言内容</th>
                                    	<th>管理员回复</th>
                                    	
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${message}" var="bas" begin="0" end="2">
                                        <tr>
                                        	<td>${bas.id }</td>
                                        	<td>${bas.datatime }</td>
                                        	<td>${bas.content }</td>
                                        	<td >${bas.reply }</td>
                                        	
                                        </tr>
                                        </c:forEach>
                                       <!--  <tr>
                                        	<td>1</td>
                                        	<td>立夏</td>
                                        	<td>您的留言我们已经收到，</td>
                                        	<td ><a href="#">待查看</a></td>
                                        	
                                        </tr>
                                        <tr>
                                        	<td>1</td>
                                        	<td>立夏</td>
                                        	<td>您的留言我们已经收到，</td>
                                        	<td ><a href="#">待查看</a></td>
                                        	
                                        </tr> -->
                                         
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                   

                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="introduse.jsp?id=${USER.id }">个人中心</a>
                        </li>
                        <li>
                            <a href="index.jsp">首页</a>
                        </li>                        
                    </ul>
                </nav>
				
            </div>
        </footer>


    </div>
</div>


</body>
<script type="text/javascript">
  $('button').popover();
</script>

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
	<script src="personal/assets/js/demo.js"></script>
</html>
