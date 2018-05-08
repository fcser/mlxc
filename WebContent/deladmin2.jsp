<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.javaweb.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String id=request.getParameter("id");
	   int ID=Integer.parseInt(id);
		AdminDAO.Delete_Admin(ID);
		request.getRequestDispatcher("mng_bussman.jsp").forward(request, response);
	%>
</body>
</html>