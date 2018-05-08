<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="manage/css/pintuer.css">
<link rel="stylesheet" href="manage/css/admin.css">
<script src="manage/js/jquery.js"></script>
<script src="manage/js/pintuer.js"></script>
</head>
<body>
	<%
 
    String id=(String) request.getParameter("id");
    int ID=Integer.parseInt(id);
  
    request.setAttribute("id", ID);
%>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>回复</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="Edit_servlet">
				
				
				<div class="form-group">
					<div class="label">
						<label>内容：</label>
					</div>
					<div class="field">
					 <input type="hidden" name="id"
							value="${id}"> <input type="hidden" name="Type"
							value="reply">
						<textarea name="content" class="input"
							style="height: 450px; border: 1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>${msg }
					</div>

				</div>
			</form>
		</div>
	</div>

</body>
</html>