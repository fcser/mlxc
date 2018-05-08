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
	String a=(String) request.getParameter("sort");
	//BasalDAO bs=new BasalDAO();
	if(a.equals("home")){
		String sort="住宅";
	ArrayList<Activity> news=ActivityDAO.findALLActivity(sort);
	request.setAttribute("basal", news); 
	}
	else if(a.equals("walk")){
		String sort="出行";
	ArrayList<Activity> news=ActivityDAO.findALLActivity(sort);
	request.setAttribute("basal", news); 
	}
	else if(a.equals("sport")){
		String sort="运动";
	ArrayList<Activity> news=ActivityDAO.findALLActivity(sort);
	request.setAttribute("basal", news); 
	}
	else if(a.equals("food")){
		String sort="美食";
	ArrayList<Activity> news=ActivityDAO.findALLActivity(sort);
	request.setAttribute("basal", news); 
	}
   %>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 活动删改</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
    </div>
    <table class="table table-hover text-center">
      <tr>
        
        <th>活动主题</th>
        <th width="10%">活动地点</th>
        <th >活动时间</th>
        <th>查看报名</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${basal}" var="stu1">
        <tr>
          
          <td>${stu1.title }</td>
         
          <td>${stu1.place }</td>
          <td>${stu1.time }</td>
          <td><a class="button border-main" href="mng_application.jsp?id=${stu1.id }">报名查询入口</a></td>
          <td><div class="button-group"> <a class="button border-main" href="add_activenew.jsp?id=${stu1.id }"><span class="icon-edit"></span> 编辑活动新闻</a> <a class="button border-red" href="delactive.jsp?id=${stu1.id }"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        </c:forEach>
   		
      
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
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

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>