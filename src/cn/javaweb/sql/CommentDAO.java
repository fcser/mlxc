package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Comment;

public class CommentDAO {

	/**
	 * @param args
	 * beuser_id指被评论的那条评论的id
	 * 1.添加某条评论
	 * 2.点赞
	 * 2.查询出所有原评论
	 * 3.查询出评论回复
	 * 4.删除某条评论
	 * 6.查询一个评论详细信息
	 */
	public static void Add_comment(String user_name,int news_id,String content,int be_id)
    {
   	 GregorianCalendar gc=new GregorianCalendar();

		@SuppressWarnings("deprecation")
		String query="insert into comment(users_name,news_id,content,datatime,beuser_id) values ('"+user_name+"','"+news_id+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+be_id+"')";
   	// String query="insert into news value (2,'hh','hhh','hhhh')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
	public static void Count_comment(int id)
    {
   	 Comment a=getComment(id);
   	 int count=a.getGoodnum();
   	 count++;
		String query="update comment set good_num='"+count+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
	//查询出原评论
    public static ArrayList<Comment> findALLCommentbyarticle(int news_id){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Comment> Items=new ArrayList<Comment>();
		String sql="select * from comment where beuser_id=0 and news_id="+news_id;
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Comment news=new Comment();
				int id=rs.getInt(1);
				String user=rs.getString(2);
				int aid=rs.getInt(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				//String author=rs.getString(5);
				int goodnum=rs.getInt(6);
				int beauthor=rs.getInt(7);
				//String sort=rs.getString(7);
				news.setId(id);
				news.setUser_name(user);
				news.setNews_id(aid);
				news.setContent(content);
				news.setDatatime(time);
				news.setBeuser_id(beauthor);
				news.setGoodnum(goodnum);
				Items.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return Items;
		
	}
    public static ArrayList<Comment> findALLComment(int news_id,int beuser_id){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Comment> Items=new ArrayList<Comment>();
		String sql="select * from comment where news_id='"+news_id+"' and beuser_id="+beuser_id;
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Comment news=new Comment();
				int id=rs.getInt(1);
				String user=rs.getString(2);
				int aid=rs.getInt(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				//String author=rs.getString(5);
				int goodnum=rs.getInt(6);
				int beauthor=rs.getInt(7);
				//String sort=rs.getString(7);
				news.setId(id);
				news.setUser_name(user);
				news.setNews_id(aid);
				news.setContent(content);
				news.setDatatime(time);
				news.setBeuser_id(beauthor);
				news.setGoodnum(goodnum);
				Items.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return Items;
	}
    public static void Delete_Comment(int id)
	  {
	 	 String deleteStr="delete from comment where id="+id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
    public static Comment getComment(int ID){
		String selectStr="select * from comment where id="+ID;
		Connection con=(Connection) dataprocess.getConnection();
		Comment news=new Comment();
		try{
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(selectStr);
			if(rs.next()){
				int id=rs.getInt(1);
				String user=rs.getString(2);
				int aid=rs.getInt(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				//String author=rs.getString(5);
				int goodnum=rs.getInt(6);
				int beauthor=rs.getInt(7);
				//String sort=rs.getString(7);
				news.setId(id);
				news.setUser_name(user);
				news.setNews_id(aid);
				news.setContent(content);
				news.setDatatime(time);
				news.setBeuser_id(beauthor);
				news.setGoodnum(goodnum);
				}
			rs.close();
			stmt.close();
			con.close();
			return news;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
