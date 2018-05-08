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
System.out.println("22222");
		String id=request.getParameter("id");
System.out.println("yi");
	   int ID=Integer.parseInt(id);
	   System.out.println("yier");
		ActivityDAO.Delete_Activity(ID);
		System.out.println("san");
		request.getRequestDispatcher("mng_active.jsp?sort=${ADMIN.sort }").forward(request, response);
	%>
</body>
</html>