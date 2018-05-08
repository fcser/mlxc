package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class dataprocess {
public dataprocess(){}
	
	//创建链接，连接到mlxc2数据库
public static Connection getConnection()   
{
	String CLASSFORNAME="com.mysql.jdbc.Driver";
	String SERVANDDB="jdbc:mysql://localhost:3306/mlxc2?user=root&password=123456&useUnicode=true&characterEncoding=utf-8";

	Connection con;
	try{
		Class.forName(CLASSFORNAME);
		con=DriverManager.getConnection(SERVANDDB);
		return con;
	}
	catch(Exception e)
	{
		e.printStackTrace();
		return null;
	}
}
	/*public static Connection getConnection()   //sqlserver连接数据库
	{
		String CLASSFORNAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
       String dburl="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=mlxc2";
       String username="sa";
       String password="123456";
		Connection con;
		try{
			Class.forName(CLASSFORNAME);
			con=DriverManager.getConnection(dburl,username,password);
			System.out.print("连接成功");
			return con;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}*/
	public static int nCount(String SQL)
	{
		Connection connection=getConnection();
		int count=0;
		try
		{
			Statement stm=connection.createStatement();
			ResultSet result=stm.executeQuery(SQL);
			if(result!=null){
			while(result.next())//改过了
			{
				count++;
			}
			result.close();
			stm.close();
			connection.close();
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	
	//执行sql语句主要用于增删改
	public static void ExeQuery(String SQL)    
	{
		Connection con=getConnection();
		try
		{
			Statement stmt=con.createStatement();
			stmt.executeUpdate(SQL);
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void CloseConnection(Connection con)
	{
		try{
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void CloseResultSet(ResultSet rs)
	{
		try{
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
          getConnection();
	}
}
