package cn.javaweb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import cn.javaweb.javabean.Admin;
import cn.javaweb.javabean.*;
import cn.javaweb.sql.*;
//import cn.javaweb.sql.adminDAO;

/**
 * Servlet implementation class Login_servlet
 */
@WebServlet("/Login_servlet")
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
	  String a=(String)request.getParameter("gender");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String mail = request.getParameter("user");
		//request.getSession().setAttribute("u", mail);
		String pass = request.getParameter("pass");
		if(a.equals("student"))
		{
	    User psw =new UserDAO().findUserBymail(mail);
		if(psw.getUser()==null){
			request.setAttribute("msg", "没有这个用户！");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
		if(psw.getUser()!=null&&!psw.getPassword().equals(pass))
		{
			request.setAttribute("msg", "密码错误请重新输入！");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}
		if(psw.getPassword().equals(pass)){
			session.setAttribute("USER", psw);
			session.setAttribute("personal", "个人中心");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		}
		else if(a.equals("manager")){
			Admin psw =new AdminDAO().findUserByname(mail);
			if(psw.getUser()==null){
				request.setAttribute("msg", "没有这个管理员！");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(psw.getUser()!=null&&!psw.getPassword().equals(pass)){
				request.setAttribute("msg", "密码错误请重新输入！");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(psw.getPassword().equals(pass)){
				if(psw.getIs_mng()==1){        //模块管理员登录
				session.setAttribute("ADMIN", psw);
				   if(psw.getSort().equals("home"))
				   {
					session.setAttribute("SORT", "住宅");
				    }
				   else if(psw.getSort().equals("food"))
				   {
					   session.setAttribute("SORT", "美食");
				   }
				   else if(psw.getSort().equals("sport"))
				   {
					   session.setAttribute("SORT", "运动");
				   }
				   else if(psw.getSort().equals("walk"))
				   {
					   session.setAttribute("SORT", "出行");
				   }
				
				request.getRequestDispatcher("manage.jsp").forward(request, response);
				}
				else{           //总管理登录
					session.setAttribute("ADMIN", psw);
					request.getRequestDispatcher("mng_total.jsp").forward(request, response);
				}
			}
	 }
		else{//商家登录
			Admin psw =new AdminDAO().findUserByname(mail);
			if(psw.getUser()==null||psw.getIs_mng()!=2){
				request.setAttribute("msg", "没有这个商家！");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(psw.getUser()!=null&&!psw.getPassword().equals(pass)){
				request.setAttribute("msg", "密码错误请重新输入！");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(psw.getPassword().equals(pass)){
				session.setAttribute("ADMIN", psw);
				if(psw.getSort().equals("home"))
				   {
					session.setAttribute("SORT", "住宅");
				    }
				   else if(psw.getSort().equals("food"))
				   {
					   session.setAttribute("SORT", "美食");
				   }
				   else if(psw.getSort().equals("sport"))
				   {
					   session.setAttribute("SORT", "运动");
				   }
				   else if(psw.getSort().equals("walk"))
				   {
					   session.setAttribute("SORT", "出行");
				   }
				request.getRequestDispatcher("mng_business.jsp").forward(request, response);
				
			}
		}
   }
}


