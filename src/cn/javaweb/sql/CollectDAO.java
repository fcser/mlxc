package cn.javaweb.sql;
/**
 * 1.给用户添加收藏；
 * 2.删除用户的某个收藏；
 * 3.清空用户的收藏；
 * 4.查询出用户收藏的所有文章
 * 5.说明：user_id是参考user表中的id，而article_id不是外键
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import cn.javaweb.javabean.Collect;


public class CollectDAO {
	//添加收藏
	 public static void Add_Collection(int a,int b,String article_name)
	  {
		 GregorianCalendar gc=new GregorianCalendar();
		  @SuppressWarnings("deprecation")
		String sql="insert into collect(users_id,article_id,datatime,article_name) values('"+a+"','"+b+"','"+gc.getTime().toLocaleString()+"','"+article_name+"')";
		  try{
			  dataprocess.ExeQuery(sql);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	  }
	 //删除用户的某个收藏
	  public static void Delete_Collection(int id)
	  {
	 	 String deleteStr="delete from collect where id="+id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
	  //清空用户的收藏
	  public static void Delete_allCollection(int user_id)
	  {
	 	 String deleteStr="delete from collect where users_id="+user_id;
	 	 try{
	 		 //CommentDAO.Delete_Comment(id);
	 		 dataprocess.ExeQuery(deleteStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	  }
	  //查询出用户的所有收藏
	  public static ArrayList<Collect> Findallcollection(int user_id)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Collect> Items=new ArrayList<Collect>();
			String sql="select * from collect where users_id="+user_id;
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Collect collect=new Collect();
					int id=rs.getInt(1);
					int article_id=rs.getInt(3);
					//String article_title=ArticleDAO.getArticle(article_id).getTitle();
					String datatime=rs.getString(4);
					collect.setId(id);
					collect.setUser_id(user_id);
					collect.setArticle_id(article_id);
					collect.setDatatime(datatime);
					collect.setArticle_name(rs.getString(5));
					Items.add(collect);
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
	  public static Collect getCollect(int user_id,int news_id){
			String selectStr="select * from collect where article_id='"+news_id+"' and users_id="+user_id;
			Connection con=(Connection) dataprocess.getConnection();
			Collect collect=new Collect();
			try{
				Statement stmt=(Statement) con.createStatement();
				ResultSet rs=stmt.executeQuery(selectStr);
				if(rs.next()){
					int id=rs.getInt(1);
					int article_id=rs.getInt(3);
					//String article_title=ArticleDAO.getArticle(article_id).getTitle();
					String datatime=rs.getString(4);
					collect.setId(id);
					collect.setUser_id(user_id);
					collect.setArticle_id(article_id);
					collect.setDatatime(datatime);
					collect.setArticle_name(rs.getString(5));
				
					}
				rs.close();
				stmt.close();
				con.close();
				return collect;
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
		}
}
