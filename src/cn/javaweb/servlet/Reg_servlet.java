package cn.javaweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.javaweb.javabean.User;
import cn.javaweb.sql.AdminDAO;
import cn.javaweb.sql.UserDAO;

/**
 * Servlet implementation class Reg_servlet
 */
@WebServlet("/Reg_servlet")
public class Reg_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg_servlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type=(String)request.getParameter("Type");
		if(type.equals("user")){
		String name=(String)request.getParameter("user");
		String password=(String)request.getParameter("pass");
		String sex=(String)request.getParameter("gender");
		String age=(String)request.getParameter("age");
		int AGE=0;
		//int AGE=19;
		String mail=(String)request.getParameter("mail");
		String home=(String)request.getParameter("home");
		
		User psw =new UserDAO().findUserBymail(mail);
		if(password.length()<6||password.length()>12)
		{
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("regist.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}
		else
		{
		if(psw.getMail()!=null&&age.equals("")){
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("regist.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}
		else
		{
			AGE=Integer.parseInt(age);
			UserDAO.Add_User(name, password,sex,AGE,home,mail);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
			
		}
		}
		}
		else if(type.equals("business")){
			String name=(String)request.getParameter("name");
			String password=(String)request.getParameter("password");
			String sort=(String)request.getParameter("gender");
			AdminDAO. Add_Admin(name,password,sort,2);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("Login.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}
		else{
			String name=(String)request.getParameter("name");
			String password=(String)request.getParameter("password");
			String sort=(String)request.getParameter("gender");
			AdminDAO. Add_Admin(name,password,sort,2);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("mng_total.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}
	}

}
