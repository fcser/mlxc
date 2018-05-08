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

	//BasalDAO bs=new BasalDAO();
	
	ArrayList<Admin> admin=AdminDAO.findALLAdmin(2);
	request.setAttribute("basal", admin); 
	
   %>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 设置管理员</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        
        <th width="150">姓名</th>
      
     <!--   <th>职业</th>-->
        <th width="200">所属模块</th>
        <!--<th width="10%">上传时间</th>-->
        <th width="310">操作</th>
      </tr>
      <c:forEach items="${basal}" var="stu1">
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
           ${stu1.id }</td>
         <!-- <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td>-->
          
          <td>${stu1.user }</td>
          <!--<td><font color="#00CC99">首页</font></td>-->
          <td>${stu1.sort }</td>
         <!-- <td>2016-07-01</td>-->
          <td><a class="button border-red" href="deladmin2.jsp?id=${stu1.id }" >撤销</a> </div></td>
        </tr>
   		</c:forEach> 
          
      
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//单个通过
function del(id,mid,iscid){
	if(confirm("您确定要进行该操作吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量未通过
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要实施该操作吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要操作的内容!");
		return false;
	}
}
</script>
</body>
</html>