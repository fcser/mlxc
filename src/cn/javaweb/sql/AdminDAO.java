package cn.javaweb.sql;
/**
 * 1.添加新的管理员到数据库；
 * 2.修改管理员信息；
 * 3.根据id删除某个管理员；
 * 4.查找出所有管理员；
 * 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import cn.javaweb.javabean.Admin;


public class AdminDAO {
	//添加新的管理员到数据库
	public static void Add_Admin(String name,String password,String sort,int is_mng)
	{
		String query="insert into admin(name,password,sort,is_mng) values('"+name+"','"+password+"','"+sort+"','"+is_mng+"')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	 //修改管理员信息
	public static void Edit_Admin(String name,String password,String sort,int id)
    {
		String query="update admin set name='"+name+"',password='"+password+"',sort='"+sort+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
	
	//根据id来删除某个管理员
	public static void Delete_Admin(int id)
	{
		String query="delete from admin where id="+id;
		try{
			dataprocess.ExeQuery(query);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//查找出所有的管理员
	 public static ArrayList<Admin> findALLAdmin(int a){
			Connection con=(Connection) dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Admin> Items=new ArrayList<Admin>();
			String sql="select * from admin where is_mng="+a;
			try {
			
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
						Admin admin=new Admin();
						admin.setId(rs.getInt(1));
						admin.setUser(rs.getString(2));
						admin.setPassword(rs.getString(3));
						admin.setSort(rs.getString(4));
						admin.setIs_mng(rs.getInt(5));
						Items.add(admin);
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
	 public Admin findUserByname(String username) {
			// TODO Auto-generated method stub
			Connection con=dataprocess.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Admin user=new Admin();
			String sql="select * from admin where name='"+username+"'";
			try {
				pstmt=(PreparedStatement) con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){	
					user.setId(rs.getInt(1));
					user.setUser(rs.getString(2));
					user.setPassword(rs.getString(3));	
					user.setSort(rs.getString(4));
					user.setIs_mng(rs.getInt(5));
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
			return user;	
		}
}
