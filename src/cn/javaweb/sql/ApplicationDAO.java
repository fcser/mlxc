package cn.javaweb.sql;
/**
 * 1.添加用户的某个报名
 * 2.删除用户报名
 * 3.清空用户的报名
 //*4.根据某个的活动，删除所有报名的人
 * 5.查询出用户的所有报名
 * 6.查询出某个活动的所有报名
 * 7.查询出用户报名的详细信息
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Application;


public class ApplicationDAO {
	//添加某个报名
	public static void Add_Application(int a,int b)
	  {
		 GregorianCalendar gc=new GregorianCalendar();
		  @SuppressWarnings("deprecation")
		String sql="insert into application(users_id,activity_id,datatime) values('"+a+"','"+b+"','"+gc.getTime().toLocaleString()+"')";
		  try{
			  dataprocess.ExeQuery(sql);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	  }
	 //删除用户的某个报名信息
	  public static void Delete_Application(int id)
	  {
	 	 String deleteStr="delete from application where id="+id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
	  //清空用户的报名
	  public static void Delete_allApplication(int user_id)
	  {
	 	 String deleteStr="delete from application where users_id="+user_id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
	  public static void Delete_allApplicationbynews(int user_id)
	  {
	 	 String deleteStr="delete from application where users_id="+user_id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
	  //查询出用户的所有报名
	  public static ArrayList<Application> FindallApplication(int user_id)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Application> Items=new ArrayList<Application>();
			String sql="select * from application where users_id="+user_id;
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Application application=new Application();
					int id=rs.getInt(1);
					int news_id=rs.getInt(3);
					String news_title=ActivityDAO.getActivity(news_id).getTitle();
					String datatime=rs.getString(4);
					application.setId(id);
					application.setUser_id(user_id);
					application.setActivity_id(news_id);
					application.setDatatime(datatime);
					application.setNews_title(news_title);
					Items.add(application);
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
	  public static ArrayList<Application> FindallApplicationbynews(int news_id)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Application> Items=new ArrayList<Application>();
			String sql="select * from application where activity_id="+news_id;
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Application application=new Application();
					int id=rs.getInt(1);
					int user_id=rs.getInt(2);
					String news_title=ActivityDAO.getActivity(news_id).getTitle();
					String user=UserDAO.findUserByid(user_id).getUser();
					String datatime=rs.getString(4);
					application.setId(id);
					application.setUser_id(user_id);
					application.setActivity_id(news_id);
					application.setDatatime(datatime);
					application.setNews_title(news_title);
					application.setUser_name(user);
					Items.add(application);
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
	  public static Application getApplication(int user_id,int news_id){
			String selectStr="select * from application where activity_id='"+news_id+"' and users_id="+user_id;
			Connection con=(Connection) dataprocess.getConnection();
			Application application=new Application();
			try{
				Statement stmt=(Statement) con.createStatement();
				ResultSet rs=stmt.executeQuery(selectStr);
				if(rs.next()){
					int id=rs.getInt(1);
					//int user_id=rs.getInt(2);
					String news_title=ActivityDAO.getActivity(news_id).getTitle();
					String user=UserDAO.findUserByid(user_id).getUser();
					String datatime=rs.getString(4);
					application.setId(id);
					application.setUser_id(user_id);
					application.setActivity_id(news_id);
					application.setDatatime(datatime);
					application.setNews_title(news_title);
					application.setUser_name(user);
				
					}
				rs.close();
				stmt.close();
				con.close();
				return application;
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
		}
}
