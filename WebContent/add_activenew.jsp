<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="cn.javaweb.sql.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="manage/css/pintuer.css">
<link rel="stylesheet" href="manage/css/admin.css">
<script src="manage/js/jquery.js"></script>
<script src="manage/js/pintuer.js"></script>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String id=(String) request.getParameter("id");
	int ID=Integer.parseInt(id);
	request.setAttribute("ID", ID); 
   
   %>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 上传新闻</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="Add_servlet">      
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="title" value="" />
           <input type="hidden" name="Type" value="news">
          <input type="hidden" name="author" value="${ADMIN.user }"> 
           <input type="hidden" name="sort" value="${SORT }">
           <input type="hidden" name="active_id" value="${ID }">
          <div class="tips"></div>
        </div>
      </div>
      <!--<div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片尺寸：500*200</div>
        </div>
      </div>-->
      <div class="form-group">
					<div class="label">
						<label>简介：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="intro" value="" />
						<div class="tips"></div>
					</div>
				</div>
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea name="content"></textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>${msg }
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>