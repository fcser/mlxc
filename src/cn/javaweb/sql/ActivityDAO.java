package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Activity;


/**
 * 1.添加活动
 * 2.修改活动
 * 3.删除活动
 * 4.查询所有活动
 * 5.查看单个活动
 *
 */
public class ActivityDAO {
	//添加活动
	public static void Add_Activity(String title,String content,String time,String place,String sort)
	{
		GregorianCalendar gc=new GregorianCalendar();
		@SuppressWarnings("deprecation")
		String query="insert into activity(title,content,time,place,datatime,sort) values('"+title+"','"+content+"','"+time+"','"+place+"','"+gc.getTime().toLocaleString()+"','"+sort+"')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	//修改活动
	public static void Edit_Activity(int id,String title,String content,String time,String place)
    {
   	 GregorianCalendar gc=new GregorianCalendar();
   	 
		//String query="update article set title='"+title+"',intro='"+intro+"',content='"+content+"',datatime='"+gc.getTime().toLocaleString()+"',author='"+author+"',sort='"+sort+"',havepass='"+havepass+"'where id="+id;
   	@SuppressWarnings("deprecation")
	String query="update article set title='"+title+"',content='"+content+"',time='"+time+"',place='"+place+"', datatime='"+gc.getTime().toLocaleString()+"'where id="+id;
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
	//删除活动
	public static void Delete_Activity(int id)
	{
		String query="delete from activity where id="+id;
		try{
			dataprocess.ExeQuery(query);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	//查询出所有活动
	public static ArrayList<Activity> findALLActivity(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Activity> Items=new ArrayList<Activity>();
		String sql="select * from activity where sort='"+sort+"' order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Activity activity=new Activity();
					activity.setId(rs.getInt(1));
					activity.setTitle(rs.getString(2));
					activity.setContent(rs.getString(3));
					activity.setTime(rs.getString(4));
					activity.setPlace(rs.getString(5));
					activity.setDatatime(rs.getString(6));
					Items.add(activity);
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
	
	public static Activity getActivity(int ID){
		String selectStr="select * from activity where id="+ID;
		Connection con=(Connection) dataprocess.getConnection();
		Activity activity=new Activity();
		try{
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(selectStr);
			if(rs.next()){
				activity.setId(rs.getInt(1));
				activity.setTitle(rs.getString(2));
				activity.setContent(rs.getString(3));
				activity.setTime(rs.getString(4));
				activity.setPlace(rs.getString(5));
				activity.setDatatime(rs.getString(6));
			
				}
			rs.close();
			stmt.close();
			con.close();
			return activity;
		}catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
