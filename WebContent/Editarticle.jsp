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
  
    Article article=ArticleDAO.getArticle(ID);
    request.setAttribute("article", article);
%>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>编辑文章</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="Edit_servlet">
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" name="title" class="input"
							value="${article.title}"> <input type="hidden" name="id"
							value="${article.id}"> <input type="hidden" name="Type"
							value="article">
						<input type="hidden" name="author" value="${article.author }">
						<input type="hidden" name="sort" value="${article.sort }">
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>内容：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height: 450px; border: 1px solid #ddd;">${article.content}</textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>简介：：</label>
					</div>
					<div class="field">
						<input type="text" name="intro" class="input"
							value="${article.intro }" />
					</div>
				</div>
				<!--<div class="form-group">
        <div class="label">
          <label>关键字描述：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="s_desc" style="height:80px;"></textarea>
        </div>
      </div>-->
				<!-- <div class="form-group">
        <div class="label">
          <label>排序：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sort" value="0"  data-validate="number:排序必须为数字" />
          <div class="tips"></div>
        </div>
      </div>-->
				<div class="form-group">
					<div class="label">
						<label>发布时间：${article.time } </label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>作者：${article.author }</label>
					</div>
				</div>
				<!--<div class="form-group">
        <div class="label">
          <label>点击次数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="views" value="" data-validate="member:只能为数字"  />
          <div class="tips"></div>
        </div>
      </div>-->
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>

				</div>
			</form>
		</div>
	</div>

</body>
</html>