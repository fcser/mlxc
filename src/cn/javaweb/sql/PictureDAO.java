package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Picture;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * 
 * @author zym
 *1.添加图片
 //*2.编辑图片简介
 *3.删除图片
 *4.根据时间查询出三张图片
 *5.根据id获取图片详细信息
 */
public class PictureDAO {
      public static void Add_Picture(String path,String intro,String datatime)
      {
    	  GregorianCalendar gc=new GregorianCalendar();
    	  @SuppressWarnings("deprecation")
		String query="insert into picture(path,intro,datatime) values('"+path+"','"+intro+"','"+gc.getTime().toLocaleString()+"')";
    	  try{
  			dataprocess.ExeQuery(query);
  		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
      }
      public static void Delete_Picture(int id)
      {
    	  String query="delete from picture where id="+id;
    	  try{
    			dataprocess.ExeQuery(query);
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
      }
      public static ArrayList<Picture> findAllPicturebytime(){
  		Connection con=(Connection) dataprocess.getConnection();
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		ArrayList<Picture> Items=new ArrayList<Picture>();
  		String sql="select * from picture order by datatime desc";
  		try {
  		
  			pstmt=(PreparedStatement) con.prepareStatement(sql);
  			rs=pstmt.executeQuery();
  			while(rs.next()){
  				Picture article=new Picture();
  				int iid=rs.getInt(1);
  				String path=rs.getString(2);
  				String intro=rs.getString(3);
  				String datatime=rs.getString(4);
  				article.setId(iid);
  				article.setPath(path);
  				article.setIntro(intro);
  				article.setDatatime(datatime);
  				Items.add(article);
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
      public static Picture getPicture(int ID){
  		String selectStr="select * from picture where id="+ID;
  		Connection con=(Connection) dataprocess.getConnection();
  		Picture article=new Picture();
  		try{
  			Statement stmt=(Statement) con.createStatement();
  			ResultSet rs=stmt.executeQuery(selectStr);
  			if(rs.next()){
  				//Picture article=new Picture();
  				int iid=rs.getInt(1);
  				String path=rs.getString(2);
  				String intro=rs.getString(3);
  				String datatime=rs.getString(4);
  				article.setId(iid);
  				article.setPath(path);
  				article.setIntro(intro);
  				article.setDatatime(datatime);
  			
  				}
  			rs.close();
  			stmt.close();
  			con.close();
  			return article;
  		}catch(Exception e)
  		{
  			e.printStackTrace();
  			return null;
  		}
  	}
}
