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
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>个人资料</title>

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
                <a href="#" class="simple-text">个 人 中 心 </a>
            </div>

            <ul class="nav">
              
                <li class="active">
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
                 <li>
                    <a href="footmark.jsp?id=${USER.id }" >
                        <i class="ti-view-list-alt"></i>
                        <p>我的足迹</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
<%
      request.setCharacterEncoding("utf-8"); 
      response.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8");
    //String a= request.getParameter("user");
    String id=(String) request.getParameter("id");
    int ID=Integer.parseInt(id);
	ArrayList<Collect> collect=CollectDAO.Findallcollection(ID);
	request.setAttribute("collect", collect);
   %>
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
                    <a class="navbar-brand" href="#">个人资料</a>
                </div>
                
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src="personal/assets/img/background.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <!--<img class="avatar border-white" src="assets/img/faces/face-2.jpg" alt="..."/>-->
                                  <h4 class="title">${USER.user }<br /></h4>                                            
                                </div>
                                <p class="description text-center">
                                   ${USER.intro }
                                </p>
                            </div>
                            <hr>
                        </div>
                        
                        <div class="card">
                            <div class="header">
                                <h4 class="title">我的收藏</h4>
                            </div>
                            <div class="content">
                                <ul class="list-unstyled team-members">
                                <c:forEach items="${collect}" var="bas" begin="0" end="2">
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                           <!-- <img src="assets/img/faces/face-0.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">-->
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6"><a href="article.jsp?id=${bas.article_id }">${bas.article_name }</a>  <br />                                                 <!-- <span class="text-muted"><small>Offline</small></span>-->
                                                    </div>
                                                    <div class="col-xs-3 text-right">
                                                        <btn class="btn btn-sm btn-success btn-icon"><i class="fa fa-heart"></i></btn>
                                                    </div>
                                                </div>
                                            </li>
                                      </c:forEach> 
                                             <!-- style="text-align:right;"-->
                                        </ul>
                                         <div class="btn btn-sm btn-success btn-icon" style="float:right;"><a href="#">查看所有</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">编辑个人资料</h4>
                            </div>
                            <div class="content">
                                <form action="Edit_servlet" method="post">
                                    <div class="row">
                                        <!--<div class="col-md-5">
                                            <div class="form-group">
                                                <label>Company</label>
                                                <input type="text" class="form-control border-input" disabled placeholder="Company" value="Creative Code Inc.">
                                            </div>
                                        </div>-->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>昵称</label>
                                                <input type="hidden" name="id" value="${USER.id }">
                                                <input type="hidden" name="Type" value="personal">
                                                <input type="text" name="name" class="form-control border-input" placeholder="Username" value="${USER.user}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">邮箱</label>
                                                <input type="email" class="form-control border-input" placeholder="改不了了，哈哈哈哈">
                                            </div>
                                        </div>
                                    </div>                                   
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>地址</label>
                                                <input type="text" name="home" class="form-control border-input" placeholder="${USER.home }" value="${USER.home }">
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>性别</label>
                                                <input type="text" name="sex" class="form-control border-input" placeholder="${USER.sex }" value="${USER.sex }">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>年龄</label>
                                                <input type="text" name="age" class="form-control border-input" placeholder="${USER.age }" value="${USER.age }">
                                            </div>
                                        </div>
                                        </div>
                         

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>简介</label>
                                                <textarea rows="5" name="intro" class="form-control border-input" placeholder="${USER.intro}" value="${USER.intro}">${USER.intro}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">提交</button>${msg }
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
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
                            <a href="introduse.jsp?id=${USER.id }">
                               个人中心
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp">
                               首页
                            </a>
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
	<script src="personal/assets/js/demo.js"></script>

</html>
