<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>美文欣赏</title>
<link rel="stylesheet" href="news/css/bootstrap.min.css">
<link rel="stylesheet" href="news/css/style.css">

</head>

<body>
	<%
 
    String Id=(String) request.getAttribute("id") ;
    int iD=Integer.parseInt(Id);
    Article news=ArticleDAO.getArticle(iD);//获取详细新闻信息
    request.setAttribute("news", news);
    %>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">
                <a href="#" class="navbar-brand logo"> <img src="news/images/L-LOGO-2.jpg" alt="忆美.鲁港镇"></a>
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
</header>
      
<div class="tm-body">
    <div class="container">
        <h2 class="tm-title">${news.title}</h2>                                           
                    <p class="tm-text">${news.content}</p>
                    <p class="tm-author">作者：${news.author}</p>
                    <p class="tm-author">时间：${news.time }</p>
            
     <div class="row shoucang">
      <form action="Add_servlet" method="post" name="registerForm" onsubmit="return checkdata()">
                <input type="hidden" name="Type" value="collect">
                 <input type="hidden" name="user_id" value="${USER.id }">
                 <input type="hidden" name="acticle_id" value="${news.id }">
				<input type="hidden" name="article_name" value="${news.title }">
			
        	<p style="text-align: center;">喜欢就<input value="收藏" type="submit"/><span class="glyphicon glyphicon-heart-empty"></span></a>吧~~~</p>
        	</form>
        </div>  
        ${msg }
        </div>
        </div>
</body>
</html>
