<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 添加模块管理员</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="Add_servlet">      
      <div class="form-group">
        <div class="label">
          <label>管理名</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="" />
           
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>密码</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="password" value="" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>类型</label>
        </div>
        <div class="field">
        <input type="hidden" name="Type" value="admin">
          <input type="radio"name="sort"value="food" checked="checked" />美食
                <input type="radio"name="sort"value="home"/>住宅
                <input type="radio"name="sort"value="walk"/>出行
                <input type="radio"name="sort"value="sport"/>运动
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