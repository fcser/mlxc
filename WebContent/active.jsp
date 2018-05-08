<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>活动内容</title>
		<link rel="stylesheet" href="active/css/bootstrap.min.css">
        <link rel="stylesheet" href="active/css/style.css">
		<link rel="stylesheet" type="text/css"  href="active/css/styleform.css"/>
	</head>
	<body>
		<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">  <!--width:200%; height:370%;   style="margin-top:-10px; width:100%;"--> 
                <a href="#" class="navbar-brand logo"> <img src="active/images/L-LOGO-1.jpg"  alt="忆美.红星"></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
               <div class="nav-r">
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> 我的村庄</a></li>
                   <li><a href="home.jsp"><span class="glyphicon glyphicon-globe" ></span> 美丽的房屋</a></li>
				   <li><a href="chuxing.jsp"><span class="glyphicon glyphicon-plane" ></span> 便捷的交通</a></li>
				   <li><a href="sport.jsp"><span class="glyphicon glyphicon-fire" ></span> 多彩的活动</a></li>
				   <li><a href="food.jsp"><span class="glyphicon glyphicon-cutlery" ></span> 美味的食物</a></li>
				   <li><a href="us.jsp"><span class="glyphicon glyphicon-heart" ></span> 关于我们</a></li>
				   <li><a href="introduce.jsp?id=${USER.id }"><span class="glyphicon glyphicon-user" ></span> ${personal }</a></li>
                </ul> 
               </div>
               <div class="nav-l">
                <ul class=" nav navbar-nav">
                   <li class=""><a href="regist.jsp"><span class="glyphicon glyphicon-edit" ></span> 注册 </a></li>
                   <li class=""><a href="Login.jsp"><span class="glyphicon glyphicon-off" ></span> 登录</a></li>
                </ul>
               </div>    
            </div>       
        </div>   
    </nav>
    <%
 
    String Id=(String) request.getParameter("id") ;
    int iD=Integer.parseInt(Id);
    Activity active=ActivityDAO.getActivity(iD);
    request.setAttribute("active", active);
    %>
</header>
		<div class="register">
			<div class="message">${active.title }活动表</div><br/><br/>
              <hr class="hr15" />
			
			<!-- 通过onsubmit验证是否提交  false不提交，，true 提交-->
			
				活动名称：${active.title }
				<hr class="hr15" />
				    活动时间：${active.time }
				    <hr class="hr15" />
			        活动地点：${active.place }
			        <hr class="hr15" />
				
				<hr class="hr15" />
			        
                         主要内容：
            ${active.content }    <br/><br/>
                <hr class="hr15" />
                <form action="Add_servlet" method="post" name="registerForm" onsubmit="return checkdata()">
                <input type="hidden" name="Type" value="application">
                 <input type="hidden" name="user_id" value="${USER.id }">
                 <input type="hidden" name="activity_id" value="${active.id }">
				<input value="我要报名" type="submit"/>${msg }
			</form>
			
			<script src="active/js/main.js" type="text/javascript" charset="utf-8"></script>
		</div>
	</body>
</html>
