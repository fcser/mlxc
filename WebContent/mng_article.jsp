<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="cn.javaweb.sql.*"%>
<%@ page import="java.util.*"%>

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
	request.setAttribute("s", a); 
	//BasalDAO bs=new BasalDAO();
	//System.out.println(a);
	String PAGE=(String) request.getParameter("page");
	System.out.println(PAGE);
	int pages=Integer.parseInt(PAGE);
	//BasalDAO bs=new BasalDAO();
	if(a.equals("home"))
	{
		String sql="select * from article where sort='住宅'and havepass=1 order by rank desc";
		//ArrayList<News> news=NewsDAO.findALLNewsbysorttime(sort);
		Vector <Article> news=ArticleDAO.search(sql,pages);
		request.setAttribute("basal", news); 
	}
	if(a.equals("food"))
	{
		String sql="select * from article where sort='美食'and havepass=1 order by rank desc";
		//ArrayList<News> news=NewsDAO.findALLNewsbysorttime(sort);
		Vector <Article> news=ArticleDAO.search(sql,pages);
		request.setAttribute("basal", news); 
	}
	if(a.equals("sport"))
	{
		String sql="select * from article where sort='运动'and havepass=1 order by rank desc";
		//ArrayList<News> news=NewsDAO.findALLNewsbysorttime(sort);
		Vector <Article> news=ArticleDAO.search(sql,pages);
		request.setAttribute("basal", news); 
	}
	if(a.equals("walk"))
	{
		String sql="select * from article where sort='出行'and havepass=1 order by rank desc";
		//ArrayList<News> news=NewsDAO.findALLNewsbysorttime(sort);
		Vector <Article> news=ArticleDAO.search(sql,pages);
		request.setAttribute("basal", news); 
	}
   
   %>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 美文删改</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        
        <th>名称</th>
        <th>简介</th>
        <th width="10%">上传时间</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${basal}" var="stu1">
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
           ${stu1.id }</td>
         <!-- <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td>-->
          
          <td>${stu1.title }</td>
          <td>${stu1.intro }</td>
          <td>${stu1.time }</td>
          <td><div class="button-group"> <a class="button border-main" href="Editarticle.jsp?id=${stu1.id }"> 编辑</a> <a class="button border-red" href="deletearticle.jsp?id=${stu1.id }" >删除</a> </div></td>
        </tr>
        </c:forEach>
   		 
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
         
          
      </tr>
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="mng_article.jsp?sort=${s }&page=-1">首页</a> <a href="mng_article.jsp?sort=${s }&page=-2">上一页</a><a href="mng_article.jsp?sort=${s }&page=-3">下一页</a><a href="mng_article.jsp?sort=${s }&page=-4">尾页</a> </div></td>
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