package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Message;


/**
 * 
 * @author zym
 *1.添加留言
 *2.修改留言（管理员回复）
 *3.删除留言
 *4.根据用户id查询出改用户所有留言
 *5.根据类别查询出所有留言
 */
public class MessageDAO {
	public static void Add_Message(int user_id,String content,String sort,int have)
	  {
		 GregorianCalendar gc=new GregorianCalendar();
		  @SuppressWarnings("deprecation")
		String sql="insert into message(users_id,content,datatime,sort,have) values('"+user_id+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+sort+"','"+have+"')";
		  try{
			  dataprocess.ExeQuery(sql);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	  }
	public static void Add_liuyan(int user_id,String content,String sort,String businessman,int have)
	  {
		 GregorianCalendar gc=new GregorianCalendar();
		  @SuppressWarnings("deprecation")
		String sql="insert into message(users_id,content,datatime,sort,have,bussinessman) values('"+user_id+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+sort+"','"+have+"','"+businessman+"')";
		  try{
			  dataprocess.ExeQuery(sql);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	  }
	public static void Add_Reply(int id,String reply)
	{
		int have=1;
		GregorianCalendar gc=new GregorianCalendar();
		  @SuppressWarnings("deprecation")
		String query="update message set reply='"+reply+"',redatatime='"+gc.getTime().toLocaleString()+"',have='"+have+"' where id="+id;
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
	public static void Delete_Message(int id)
	{
		String query="delete from message where id="+id;
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
	//通过用户查找所有留言
	public static ArrayList<Message> FindallMessage(int user_id)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Message> Items=new ArrayList<Message>();
			String sql="select * from message where users_id='"+user_id+"' order by redatatime desc";
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Message message=new Message();
					message.setId(rs.getInt(1));
					message.setUser_id(rs.getInt(2));
					message.setContent(rs.getString(3));
					message.setDatatime(rs.getString(4));
					message.setSort(rs.getString(5));
					message.setReply(rs.getString(6));
					message.setRedatatime(rs.getString(7));
					Items.add(message);
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
	
	public static ArrayList<Message> FindallMessagebysort(String sort)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Message> Items=new ArrayList<Message>();
			String sql="select * from message where have=0 and sort='"+sort+"'";
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Message message=new Message();
					message.setId(rs.getInt(1));
					message.setUser_id(rs.getInt(2));
					message.setName(UserDAO.findUserByid(rs.getInt(2)).getUser());
					message.setContent(rs.getString(3));
					message.setDatatime(rs.getString(4));
					message.setSort(rs.getString(5));
					message.setReply(rs.getString(6));
					message.setRedatatime(rs.getString(7));
					Items.add(message);
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
	//商家查找
	public static ArrayList<Message> FindallMessagebybusiness(String businessman)
	  {
		  Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Message> Items=new ArrayList<Message>();
			String sql="select * from message where have=1 and bussinessman='"+businessman+"'";
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Message message=new Message();
					message.setId(rs.getInt(1));
					message.setUser_id(rs.getInt(2));
					message.setName(UserDAO.findUserByid(rs.getInt(2)).getUser());
					message.setContent(rs.getString(3));
					message.setDatatime(rs.getString(4));
					message.setSort(rs.getString(5));
					message.setReply(rs.getString(6));
					message.setRedatatime(rs.getString(7));
					Items.add(message);
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
}
