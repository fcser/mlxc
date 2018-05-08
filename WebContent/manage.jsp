<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>模块后台管理中心</title>  
    <link rel="stylesheet" href="manage/css/pintuer.css">
    <link rel="stylesheet" href="manage/css/admin.css">
    <script src="manage/js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="manage/images/cun.jpg" class="radius-circle rotate-hover" height="50" alt="" />模块后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="index.jsp" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="Login.jsp"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
  	<li><a href="add_article.jsp" target="right"><span class="icon-caret-right"></span>上传美文</a></li>  
    <li><a href="add_news.jsp" target="right"><span class="icon-caret-right"></span>上传新闻</a></li> 
    <li><a href="mng_message.jsp?sort=${ADMIN.sort }" target="right"><span class="icon-caret-right"></span>留言管理</a></li> 
  </ul>   
  <!--<h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
  <ul>
  	   <li><a href="list2.html" target="right"><span class="icon-caret-right"></span>新闻管理</a></li>
    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
  </ul>  -->
  <h2><span class="icon-pencil-square-o"></span>美文管理</h2>
  <ul>
  	<li><a href="checkarticle.jsp?sort=${ADMIN.sort }&page=-1" target="right"><span class="icon-caret-right"></span>美文审核</a></li>
    <li><a href="mng_article.jsp?sort=${ADMIN.sort }&page=-1" target="right"><span class="icon-caret-right"></span>美文删改</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>新闻管理</h2>
  <ul>
  	   <li><a href="mng_news.jsp?sort=${ADMIN.sort }&page=-1" target="right"><span class="icon-caret-right"></span>新闻删改</a></li>      
  </ul>
  <h2><span class="icon-pencil-square-o"></span>活动管理</h2>
  <ul>
  	      <!--<h2><a href="page2.html" target="right">报名管理</a></h2>
            <ul>
  	          <li><a href="list4.html" target="right"><span class="icon-caret-right"></span>报名审核</a></li>
              <li><a href="list5.html" target="right"><span class="icon-caret-right"></span>信息查询</a></li>        
          </ul>-->
        <h2><a href="add_active.jsp" target="right">活动添加</a></h2>  
        <h2><a href="mng_active.jsp?sort=${ADMIN.sort }" target="right">活动删改</a></h2>  
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
  <li><a href="{:U('Index/pass')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="add_article.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>