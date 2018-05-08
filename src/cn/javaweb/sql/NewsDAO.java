package cn.javaweb.sql;
/**
 * 1.添加，删除，修改新闻；
 * 2.增加单个新闻的浏览次数；
 * 3.根据时间，浏览量排序查询所有新闻；
 * 4.根据时间，浏览量排序查询某个类型的新闻；
 * 5.根据id查询出新闻；
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Vector;

import cn.javaweb.javabean.News;
import cn.javaweb.javabean.Page;



public class NewsDAO {
	//添加新闻
	public static void Add_News(String title,String intro,String content,String author,String sort,int activity_id)
    {
   	 GregorianCalendar gc=new GregorianCalendar();

		@SuppressWarnings("deprecation")
		String query="insert into news(title,intro,content,datatime,author,sort,activity_id) values ('"+title+"','"+intro+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+author+"','"+sort+"','"+activity_id+"')";
   	// String query="insert into news value (2,'hh','hhh','hhhh')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
	/*public static void main(String[] args) {
		// TODO Auto-generated method stub
           NewsDAO.Delete_News(1);
           System.out.println("cgongl");
	}*/
    @SuppressWarnings("deprecation")
    //修改新闻内容
	public static void Edit_News(String title,String intro,String content,int id)
    {
   	 GregorianCalendar gc=new GregorianCalendar();
   	  
		String query="update news set title='"+title+"',intro='"+intro+"',content='"+content+"',datatime='"+gc.getTime().toLocaleString()+"'where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    
    //新闻的浏览次数
	public static void Count_News(int id)
    {
   	 News a=getNews(id);
   	 int count=a.getRank();
   	 count++;
		String query="update news set rank='"+count+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    //删除新闻
    public static void Delete_News(int id)
    {
   	 String deleteStr="delete from news where id="+id;
   	 try{
   		 //CommentDAO.Delete_Comment(id);
   		 dataprocess.ExeQuery(deleteStr);
 		}
 		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
    //根据时间给新闻排序查找
    public static ArrayList<News> findALLNewsbytime(){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<News> Items=new ArrayList<News>();
		String sql="select * from news order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					News news=new News();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					String sort=rs.getString(7);
					int rank=rs.getInt(8);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setRank(rank);
					news.setActive_id(rs.getInt(9));
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
    //根据访问量给新闻排序查找
    public static ArrayList<News> findALLNewsbyrank(){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<News> Items=new ArrayList<News>();
		String sql="select * from news order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					News news=new News();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					String sort=rs.getString(7);
					int rank=rs.getInt(8);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setRank(rank);
					news.setActive_id(rs.getInt(9));
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
    //根据时间排序查找出同一类型的新闻
    public static ArrayList<News> findALLNewsbysorttime(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<News> Items=new ArrayList<News>();
		String sql="select * from news where sort='"+sort+"'order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					News news=new News();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					//String sort=rs.getString(7);
					int rank=rs.getInt(8);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setRank(rank);
					news.setActive_id(rs.getInt(9));
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
    //根据访问量排序查找出同一类型的新闻
    public static ArrayList<News> findALLNewsbysort(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<News> Items=new ArrayList<News>();
		String sql="select * from news where sort='"+sort+"'order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					News news=new News();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					//String sort=rs.getString(7);
					int rank=rs.getInt(8);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setRank(rank);
					news.setActive_id(rs.getInt(9));
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
    public static Vector<News> search(String strSql,int page)throws Exception{
		Vector<News> Items=new Vector<News>();
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			pstmt=(PreparedStatement) con.prepareStatement(strSql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=pstmt.executeQuery();
			Page pgb=new Page();
			pgb.setp(rs,page,5);
			System.out.println("HHH"+rs.getRow());
			//pgb.gotoPage(page);
			rs.absolute(pgb.getRowsCount());//将光标移动到指定位置
			System.out.println("光标移动位置"+pgb.getRowsCount());
			int i=0;
			//System.out.println("page=="+page);
			if(rs!=null&&!rs.wasNull());
			{//System.out.println("进第一个if");
				do{
					System.out.println("当前页"+pgb.getCurrentPageRowsCount());
					if(pgb!=null&&pgb.getCurrentPageRowsCount()!=0){
						//System.out.println("进第二个if");
						News news=new News();
						int iid=rs.getInt(1);
						String title=rs.getString(2);
						String intro=rs.getString(3);
						String content=rs.getString(4);
						String time=rs.getString(5);
						String author=rs.getString(6);
						String sort=rs.getString(7);
						int rank=rs.getInt(8);
						news.setId(iid);
						news.setIntro(intro);
						news.setTitle(title);
						news.setContent(content);
						news.setDatatime(time);
						news.setAuthor(author);
						news.setSort(sort);
						news.setRank(rank);
						news.setActive_id(rs.getInt(9));
						Items.add(news);
						i++;
					}
				}while(rs.next()&&i<pgb.getCurrentPageRowsCount());
			}
			return Items;
		}
		finally{
			try{
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
    //根据id查找出新闻
	public static News getNews(int ID){
		String selectStr="select * from news where id="+ID;
		Connection con=(Connection) dataprocess.getConnection();
		News news=new News();
		try{
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(selectStr);
			if(rs.next()){
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				String sort=rs.getString(7);
				int rank=rs.getInt(8);
				news.setId(iid);
				news.setIntro(intro);
				news.setTitle(title);
				news.setContent(content);
				news.setDatatime(time);
				news.setAuthor(author);
				news.setSort(sort);
				news.setRank(rank);	
				news.setActive_id(rs.getInt(9));
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
