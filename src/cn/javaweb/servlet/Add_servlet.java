package cn.javaweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.javaweb.sql.*;
import cn.javaweb.javabean.*;
/**
 * Servlet implementation class Add_servlet
 */
@WebServlet("/Add_servlet")
public class Add_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_servlet() {
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
		System.out.println("0");
		if(type.equals("news"))
		{
		String title=(String)request.getParameter("title");
		String content=(String)request.getParameter("content");
		String intro=(String)request.getParameter("intro");
		String sort=(String)request.getParameter("sort");
		String author=(String)request.getParameter("author");
		String active_id=(String)request.getParameter("active_id");
		int active=Integer.parseInt(active_id);
		NewsDAO.Add_News(title,intro,content,author,sort,active);
		request.setAttribute("msg","新闻发表成功");
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("add_news.jsp");//还没写好，jsp路径还没加进去
		requestDispatcher.forward(request, response);
		}
		else if(type.equals("article"))
		{   
			String sort=(String)request.getParameter("sort");
			String title=(String)request.getParameter("title");
			String content=(String)request.getParameter("content");
			String author=(String)request.getParameter("author");
			String intro=(String)request.getParameter("intro");
			String sourse=(String)request.getParameter("sourse");
			String have=(String)request.getParameter("havepass");
			
			int havepass=Integer.parseInt(have);
		
			if(sourse.equals("sy")){
				if(author.equals(""))
				{
					request.setAttribute("msg","亲，登录了才可以发表文章！");
					RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");//还没写好，jsp路径还没加进去
					requestDispatcher.forward(request, response);
				}
				else{
				ArticleDAO.Add_Article(title,intro, content,author,sort,havepass);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");//还没写好，jsp路径还没加进去
				requestDispatcher.forward(request, response);
				request.setAttribute("msg","亲，感谢你发表了文章！");
				}
			}
			else
			{
				ArticleDAO.Add_Article(title,intro, content,author,sort,havepass);
				request.setAttribute("msg","文章发表成功！");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("add_article.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
			}
		}
		/*else if(type.equals("liuyan"))
		{
			String content=(String)request.getParameter("con");
			String author=(String)request.getParameter("author");
			String sort=(String)request.getParameter("sort");
			int articleid=0;
			CommentDAO.Add_liuyan(articleid, content, author, sort);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("Index.jsp");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}*/
		else if(type.equals("comment"))
		{
			String content=(String)request.getParameter("name");
			System.out.println("1");
			String author=(String)request.getParameter("author");
			System.out.println("2");
			String beauthor=(String)request.getParameter("beid");
			System.out.println("3");
			
			String id=(String)request.getParameter("newsid");
			System.out.println("4");
			int news_id=Integer.parseInt(id);
			System.out.println(news_id);
			if(author.equals(""))
			{
				request.setAttribute("msg","亲，登录了才可以评论哦！");
				request.setAttribute("id",id);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("news1.jsp");
				requestDispatcher.forward(request, response);
		
			}
			else{
				int be_id=Integer.parseInt(beauthor);
			CommentDAO.Add_comment(author, news_id, content,be_id);
			request.setAttribute("id",id);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("news1.jsp");
			request.setAttribute("msg","评论成功！");//还没写好，jsp路径还没加进去
			requestDispatcher.forward(request, response);
		}
			}
		else if(type.equals("message"))
		{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String sort=(String)request.getParameter("sort");
			String content=(String)request.getParameter("content");
			String user=(String)request.getParameter("user");
			System.out.println(content);
			System.out.println(user);
			String Path=request.getHeader("Referer");
			String path=Path.substring(Path.lastIndexOf("/")+1);
			//String path=new String(Path);
			System.out.println(path);
			if(user.equals(""))
			{
				request.setAttribute("msg","亲，登录了才可以留言哦！");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher(path);
				requestDispatcher.forward(request, response);
		
			}
			else{
				int user_id=Integer.parseInt(user);
			MessageDAO.Add_Message(user_id,content,sort,0);
			request.setAttribute("msg","留言成功！");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher(path);
			requestDispatcher.forward(request, response);
			
			}
		}
		else if(type.equals("messagebus"))//商家留言
		{
			String sort=(String)request.getParameter("sort");
			String content=(String)request.getParameter("name");
			String user=(String)request.getParameter("user");
			String businessman=(String)request.getParameter("businessman");
			String news_id=(String)request.getParameter("iddd");
			
			if(user.equals(""))
			{
				request.setAttribute("msg","亲，登录了才可以留言哦！");
				request.setAttribute("id",news_id);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("document2.jsp");
				requestDispatcher.forward(request, response);
		
			}
			else{
				int user_id=Integer.parseInt(user);
			MessageDAO.Add_liuyan(user_id,content,sort,businessman,1);
			request.setAttribute("msg","留言成功！");
			request.setAttribute("id",news_id);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("document2.jsp");
			requestDispatcher.forward(request, response);
			
			}
		}
		else if(type.equals("application")){
			String user=(String)request.getParameter("user_id");
			
			String active=(String)request.getParameter("activity_id");
			int activity_id=Integer.parseInt(active);
			
			if(user.equals(""))
			{request.setAttribute("id",active);
				request.setAttribute("msg","亲，登录了才可以报名哦！");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("active2.jsp");
				requestDispatcher.forward(request, response);
		
			}
			else 
			{int user_id=Integer.parseInt(user);
			Application ap=ApplicationDAO.getApplication(user_id,activity_id);
				if(ap==null)
			{
				ApplicationDAO.Add_Application(user_id,activity_id);
				request.setAttribute("id",active);
				request.setAttribute("msg","报名成功！");
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("active2.jsp");
				requestDispatcher.forward(request, response);
				
			}
			else{
				request.setAttribute("id",active);
				request.setAttribute("msg","您已经报过名了，无需再报！");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("active2.jsp");
			requestDispatcher.forward(request, response);
			
			}
			}
		}
		else if(type.equals("active")){
			String title=(String)request.getParameter("title");
			String content=(String)request.getParameter("content");
			String time=(String)request.getParameter("time");
			String place=(String)request.getParameter("place");
			String sort=(String)request.getParameter("sort");
			ActivityDAO.Add_Activity(title,content,time,place,sort);
			request.setAttribute("msg","活动添加成功！");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("add_active.jsp");
			requestDispatcher.forward(request, response);
		}
		else if(type.equals("document"))
		{
			String sort=(String)request.getParameter("sort");
			String title=(String)request.getParameter("title");
			String content=(String)request.getParameter("content");
			String author=(String)request.getParameter("author");
			String intro=(String)request.getParameter("intro");
			String link=(String)request.getParameter("link");
			DocumentDAO.Add_Document(title,intro,content,author,sort,link);
			request.setAttribute("msg", "广告发布成功");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("add_document.jsp");
			requestDispatcher.forward(request, response);
		}
		else if(type.equals("collect"))
		{
			String user=(String)request.getParameter("user_id");
			
			String article=(String)request.getParameter("acticle_id");
			int article_id=Integer.parseInt(article);
			String article_name=(String)request.getParameter("article_name");
			
			if(user.equals(""))
			{request.setAttribute("id",article);
				request.setAttribute("msg","亲，登录了才可以收藏哦！");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("article2.jsp");
				requestDispatcher.forward(request, response);
		
			}
			else{	
				int user_id=Integer.parseInt(user);
			Collect ap=CollectDAO.getCollect(user_id,article_id);
			 if(ap==null)
			{
				
				request.setAttribute("id",article);
				
				request.setAttribute("msg","您已经收藏了，无需再报！");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("article2.jsp");
				requestDispatcher.forward(request, response);
				
			}
			else{
				
				CollectDAO.Add_Collection(user_id,article_id,article_name);
				request.setAttribute("id",article);
				request.setAttribute("msg","收藏成功！");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("article2.jsp");
			requestDispatcher.forward(request, response);
			
			}
			}
		}
		else if(type.equals("admin")){
			String name=(String)request.getParameter("name");
			String password=(String)request.getParameter("password");
			String sort=(String)request.getParameter("sort");
			AdminDAO.Add_Admin(name, password, sort, 1);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("add_admin.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
