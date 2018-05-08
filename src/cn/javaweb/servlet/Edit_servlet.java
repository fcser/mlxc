package cn.javaweb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.javaweb.sql.*;

/**
 * Servlet implementation class Edit_servlet
 */
@WebServlet("/Edit_servlet")
public class Edit_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type=(String)request.getParameter("Type");
		if(type.equals("news"))
		{
		String title=(String)request.getParameter("title");
		String content=(String)request.getParameter("content");
		String ID=(String)request.getParameter("id");
		String intro=(String)request.getParameter("intro");
		int id=Integer.parseInt(ID);
		
		NewsDAO.Edit_News(title,intro,content, id);
		request.setAttribute("msg", "修改成功");
		request.getRequestDispatcher("Editnews.jsp").forward(request, response);
		}
		else if(type.equals("article"))
		{
			String title=(String)request.getParameter("title");
			String content=(String)request.getParameter("content");
			String ID=(String)request.getParameter("id");
			String author=(String)request.getParameter("author");
			String sort=(String)request.getParameter("sort");
			int id=Integer.parseInt(ID);
			String intro=(String)request.getParameter("intro");
			//String rank=(String)request.getParameter("rank");
			//int RANK=Integer.parseInt(rank);
			
			ArticleDAO.Edit_Article(title,intro,content,author,sort,id);
			request.getRequestDispatcher("Editarticle.jsp").forward(request, response);
		}
		else if(type.equals("personal"))
		{
			String name=(String)request.getParameter("name");
			String id=(String)request.getParameter("id");
			int ID=Integer.parseInt(id);
			String home=(String)request.getParameter("home");
			String intro=(String)request.getParameter("intro");
			String sex=(String)request.getParameter("sex");
			String Age=(String)request.getParameter("age");
			int age=Integer.parseInt(Age);
				UserDAO.Edit_User(ID, name, sex, age, home, intro);
				request.setAttribute("msg","亲，你的资料修改成功了！");
				request.getRequestDispatcher("introduce.jsp").forward(request, response);
		
		}
		else if(type.equals("changemima"))
		{
			//String name=(String)request.getParameter("name");
			String id=(String)request.getParameter("id");
			int ID=Integer.parseInt(id);
			String pass=(String)request.getParameter("password");
			String oldpass=(String)request.getParameter("oldpassword");
			String newpass=(String)request.getParameter("newpassword");
			if(pass.equals(oldpass)){
				UserDAO.Change_Password(ID, newpass);
				request.setAttribute("msg","亲，你的密码修改成功了！");
				request.getRequestDispatcher("password.jsp").forward(request, response);
			}
			else{
				request.setAttribute("msg","原密码输入不正确，请重新输入！");
				request.getRequestDispatcher("password.jsp").forward(request, response);
			}
		}
		else if(type.equals("reply"))
		{
			String id=(String)request.getParameter("id");
			int ID=Integer.parseInt(id);
			System.out.println(ID);
			String content=(String)request.getParameter("content");
			System.out.println("content");
			MessageDAO.Add_Reply(ID, content);
			request.setAttribute("msg","回复成功！");
			request.getRequestDispatcher("reply.jsp").forward(request, response);
			
		}
	}

}
