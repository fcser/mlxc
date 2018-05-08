<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 
    String id=(String) request.getParameter("id") ;
    int ID=Integer.parseInt(id);
    String news_id=(String) request.getParameter("news_id") ;
    CommentDAO.Count_comment(ID);
    request.setAttribute("id",news_id);
    request.getRequestDispatcher("news1.jsp").forward(request, response);
    %>
</body>
</html>