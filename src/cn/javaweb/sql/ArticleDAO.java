package cn.javaweb.sql;
/**
 * 1.对文章进行增删改操作；
 * 2.对某一篇文章进行审核通过havepass置1；
 * 3.查询出所有通过或者未通过的文章；
 * 4.根据访问量排序查询出所有通过审核的文章；
 * 5.根据时间排序查询出所有通过或者未审核的文章；
 * 6.根据作者查询出所有通过或未通过的文章；
 * 7.根据类型查询出所有通过或者未通过的文章；
 * 8.根据类型按访问量排序查询出所有通过的文章；
 * 9.根据id查询文章；
 * 10.收藏文章，给文章数加一
 * 11.访问量加一
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Vector;

import cn.javaweb.javabean.Article;
import cn.javaweb.javabean.News;
import cn.javaweb.javabean.Page;


public class ArticleDAO {
	//添加美文（通过不通过均可添加）
	public static void Add_Article(String title,String intro,String content,String author,String sort,int havepass)
    {
   	 GregorianCalendar gc=new GregorianCalendar();

		@SuppressWarnings("deprecation")
		String query="insert into article(title,intro,content,datatime,author,sort,havepass) values ('"+title+"','"+intro+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+author+"','"+sort+"','"+havepass+"')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
	//用于文章审核
    public static void Check_Article(int id)
    {
    	String query="update article set havepass=1 where id="+id;
    	try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    @SuppressWarnings("deprecation")
    //修改美文
	public static void Edit_Article(String title,String intro,String content,String author,String sort,int id)
    {
   	 GregorianCalendar gc=new GregorianCalendar();
   	 
		//String query="update article set title='"+title+"',intro='"+intro+"',content='"+content+"',datatime='"+gc.getTime().toLocaleString()+"',author='"+author+"',sort='"+sort+"',havepass='"+havepass+"'where id="+id;
   	String query="update article set title='"+title+"',intro='"+intro+"',content='"+content+"',datatime='"+gc.getTime().toLocaleString()+"',author='"+author+"',sort='"+sort+"'where id="+id;
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    //访问量改变
    public static void Count_Article(int id)
    {
   	  Article a=getArticle(id);
   	 int count=a.getRank();
   	 count++;
		String query="update article set rank='"+count+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    //收藏数改变
    public static void Collect_Article(int id)
    {
   	  Article a=getArticle(id);
   	int count=a.getCollectnum();
   	 count++;
		String query="update article set collectnum='"+count+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    //删除文章
    public static void Delete_Article(int id)
    {
   	 String deleteStr="delete from article where id="+id;
   	 try{
   		// CommentDAO.Delete_Comment(id);
   		 dataprocess.ExeQuery(deleteStr);
 		}
 		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
  //查询出所有审核通过或不通过的文章
    public static ArrayList<Article> findALLArticle(int pass){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		String sql="select * from article where havepass ="+pass;
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Article article=new Article();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					String sort=rs.getString(7);
					int rank=rs.getInt(9);
					//int goodnum=rs.getInt(10);
					int collectnum=rs.getInt(10);
					article.setId(iid);
					article.setTitle(title);
					article.setIntro(intro);
					article.setContent(content);
					article.setTime(time);
					article.setAuthor(author);
					article.setSort(sort);
					article.setHavepass(pass);
					article.setRank(rank);
					//article.setGoodnum(goodnum);
					article.setCollectnum(collectnum);
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
    //根据访问量排序查询出所有通过审核的文章
    public static ArrayList<Article> findALLpassArticlebyrank(){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		String sql="select * from article where havepass =1 order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				String sort=rs.getString(7);
				int rank=rs.getInt(9);
				//int goodnum=rs.getInt(10);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(1);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
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
    //根据时间排序查询出所有通过或者未审核的文章
    public static ArrayList<Article> findALLArticlebytime(int pass){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		String sql="select * from article where havepass ='"+pass+"' order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				String sort=rs.getString(7);
				int rank=rs.getInt(9);
				//int goodnum=rs.getInt(10);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(pass);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
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
    //根据作者查询出所有通过或未通过的文章
    public static ArrayList<Article> findallArticlebyauthor(String author){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		//String sql="select * from article where author='"+author+"' and havepass='"+pass+"' order by datatime desc";
		String sql="select * from article where author='"+author+"' order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				//String author=rs.getString(6);
				String sort=rs.getString(7);
				int rank=rs.getInt(9);
				int pass=rs.getInt(8);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(pass);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
				article.setState(pass);
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
   //根据类型查询出所有通过或者未通过的文章
    public static ArrayList<Article> findallArticlebytime(String sort,int pass){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		String sql="select * from article where sort='"+sort+"' and havepass='"+pass+"' order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				//String sort=rs.getString(7);
				int rank=rs.getInt(9);
				//int goodnum=rs.getInt(10);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(pass);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
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
    //根据类型按访问量排序查询出所有通过的文章
    public static ArrayList<Article> findallArticlebyrank(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Article> Items=new ArrayList<Article>();
		String sql="select * from article where sort='"+sort+"' and havepass=1 order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				//String sort=rs.getString(7);
				int rank=rs.getInt(9);
				//int goodnum=rs.getInt(10);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(1);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
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
    public static Vector<Article> search(String strSql,int page)throws Exception{
		Vector<Article> Items=new Vector<Article>();
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			pstmt=(PreparedStatement) con.prepareStatement(strSql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=pstmt.executeQuery();
			Page pgb=new Page();
			pgb.setp(rs,page,5);
			//System.out.println("HHH"+rs.getRow());
			//pgb.gotoPage(page);
			rs.absolute(pgb.getRowsCount());//将光标移动到指定位置
			//System.out.println("光标移动位置"+pgb.getRowsCount());
			int i=0;
			//System.out.println("page=="+page);
			if(rs!=null&&!rs.wasNull());
			{//System.out.println("进第一个if");
				do{
					System.out.println("但钱也"+pgb.getCurrentPageRowsCount());
					if(pgb!=null&&pgb.getCurrentPageRowsCount()!=0){
						//System.out.println("进第二个if");
						Article article=new Article();
						int iid=rs.getInt(1);
						String title=rs.getString(2);
						String intro=rs.getString(3);
						String content=rs.getString(4);
						String time=rs.getString(5);
						String author=rs.getString(6);
						String sort=rs.getString(7);
						int rank=rs.getInt(9);
						//int goodnum=rs.getInt(10);
						int collectnum=rs.getInt(10);
						article.setId(iid);
						article.setTitle(title);
						article.setIntro(intro);
						article.setContent(content);
						article.setTime(time);
						article.setAuthor(author);
						article.setSort(sort);
						article.setHavepass(1);
						article.setRank(rank);
						//article.setGoodnum(goodnum);
						article.setCollectnum(collectnum);
						Items.add(article);
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
    //根据id查询文章
	public static Article getArticle(int ID){
		String selectStr="select * from article where id="+ID;
		Connection con=(Connection) dataprocess.getConnection();
		Article article=new Article();
		try{
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(selectStr);
			if(rs.next()){
				//Article article=new Article();
				int iid=rs.getInt(1);
				String title=rs.getString(2);
				String intro=rs.getString(3);
				String content=rs.getString(4);
				String time=rs.getString(5);
				String author=rs.getString(6);
				String sort=rs.getString(7);
				int rank=rs.getInt(9);
				//int goodnum=rs.getInt(10);
				int collectnum=rs.getInt(10);
				article.setId(iid);
				article.setTitle(title);
				article.setIntro(intro);
				article.setContent(content);
				article.setTime(time);
				article.setAuthor(author);
				article.setSort(sort);
				article.setHavepass(1);
				article.setRank(rank);
				//article.setGoodnum(goodnum);
				article.setCollectnum(collectnum);
			
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
