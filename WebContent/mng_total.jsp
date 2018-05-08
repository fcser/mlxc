<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>总后台管理中心</title>  
    <link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <script src="manage/js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="manage/images/cs.jpg" class="radius-circle rotate-hover" height="50" alt="" />总后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="index.jsp" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp; <a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
  <li><a href="mng_bussman.jsp" target="right"><span class="icon-caret-right"></span>商家审核</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>模块管理员管理</h2>
   <ul>
  	<li><a href="add_admin.jsp" target="right"><span class="icon-caret-right"></span>设置管理员</a></li> 
  	<li><a href="mng_admin.jsp" target="right"><span class="icon-caret-right"></span>管理员管理</a></li> 
  </ul> 
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">

</div>
</body>
</html>