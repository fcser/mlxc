package cn.javaweb.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import cn.javaweb.javabean.Document;


/*
 * 1.发布广告
 * 2.编辑广告
 * 3.删除广告
 * 4.通过类别，作者查询出所有广告
 * 5.查询某个广告详情
 * 6.访问量
 * 7.通过访问量查询广告
 */
public class DocumentDAO {
	public static void Add_Document(String title,String intro,String content,String author,String sort,String link)
    {
   	 GregorianCalendar gc=new GregorianCalendar();

		@SuppressWarnings("deprecation")
		String query="insert into document(title,intro,content,datatime,author,sort,link) values ('"+title+"','"+intro+"','"+content+"','"+gc.getTime().toLocaleString()+"','"+author+"','"+sort+"','"+link+"')";
   	// String query="insert into news value (2,'hh','hhh','hhhh')";
		try{
			dataprocess.ExeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
    @SuppressWarnings("deprecation")
    //修改新闻内容
	public static void Edit_Document(String title,String intro,String content,String link,int id)
    {
   	 GregorianCalendar gc=new GregorianCalendar();
   	  
		String query="update document set title='"+title+"',intro='"+intro+"',content='"+content+"',link='"+link+"',datatime='"+gc.getTime().toLocaleString()+"'where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    
    public static void Delete_Document(int id)
    {
   	 String deleteStr="delete from document where id="+id;
   	 try{
   		 //CommentDAO.Delete_Comment(id);
   		 dataprocess.ExeQuery(deleteStr);
 		}
 		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
    public static ArrayList<Document> findALLDocumentbysort(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Document> Items=new ArrayList<Document>();
		String sql="select * from document where sort='"+sort+"'order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Document news=new Document();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					//String sort=rs.getString(7);
					String link=rs.getString(9);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setLink(link);
					news.setRank(rs.getInt(8));
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
    public static ArrayList<Document> findALLDocumentbyauthor(String author){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Document> Items=new ArrayList<Document>();
		String sql="select * from document where author='"+author+"'order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Document news=new Document();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					//String author=rs.getString(6);
					String sort=rs.getString(7);
					String link=rs.getString(9);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setLink(link);
					news.setRank(rs.getInt(8));
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
    public static ArrayList<Document> findALLDocumentbytime(){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Document> Items=new ArrayList<Document>();
		String sql="select * from document order by datatime desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Document news=new Document();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					String sort=rs.getString(7);
					String link=rs.getString(9);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setLink(link);
					news.setRank(rs.getInt(8));
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
    public static Document getDocument(int ID){
		String selectStr="select * from document where id="+ID;
		Connection con=(Connection) dataprocess.getConnection();
		Document news=new Document();
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
				String link=rs.getString(9);
				news.setId(iid);
				news.setIntro(intro);
				news.setTitle(title);
				news.setContent(content);
				news.setDatatime(time);
				news.setAuthor(author);
				news.setSort(sort);
				news.setLink(link);
				news.setRank(rs.getInt(8));
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
    public static void Count_Document(int id)
    {
   	  Document a=getDocument(id);
   	 int count=a.getRank();
   	 count++;
		String query="update document set rank='"+count+"' where id="+id;
		
		try{
	           dataprocess.ExeQuery(query);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    public static ArrayList<Document> findALLDocumentbyrank(){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Document> Items=new ArrayList<Document>();
		String sql="select * from document order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Document news=new Document();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					String sort=rs.getString(7);
					String link=rs.getString(9);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setLink(link);
					news.setRank(rs.getInt(8));
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
    public static ArrayList<Document> findALLDocumentbyrank(String sort){
		Connection con=(Connection) dataprocess.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Document> Items=new ArrayList<Document>();
		String sql="select * from document where sort='"+sort+"' order by rank desc";
		try {
		
			pstmt=(PreparedStatement) con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
					Document news=new Document();
					int iid=rs.getInt(1);
					String title=rs.getString(2);
					String intro=rs.getString(3);
					String content=rs.getString(4);
					String time=rs.getString(5);
					String author=rs.getString(6);
					//String sort=rs.getString(7);
					String link=rs.getString(9);
					news.setId(iid);
					news.setIntro(intro);
					news.setTitle(title);
					news.setContent(content);
					news.setDatatime(time);
					news.setAuthor(author);
					news.setSort(sort);
					news.setLink(link);
					news.setRank(rs.getInt(8));
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
}
