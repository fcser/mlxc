package cn.javaweb.javabean;

public class News {
	private int id;
	private String title;
	private String author;
	private String content;
	private String datatime;
	private  int rank;
	private String sort;
	private String intro;
	private int active_id;
	
	
	public News(){}
	
	News(int id,String title,String intro,String content,String datatime,String author,String sort,int rank,int active_id)
	{
		this.id=id;
		this.rank=rank;
		this.title=title;
		this.content=content;
		this.datatime=datatime;
		this.intro=intro;
		this.sort=sort;
		this.author=author;
		this.active_id=active_id;
	}
	
	public void setRank(int rank)
	{
		this.rank=rank;
	}
	
	public int getRank()
	{
		return this.rank;
	}
	
	public void setId(int id)
	{
		this.id=id;
	}
	
	public int getId()
	{
		return this.id;
	}
	public void setContent(String content)
	{
		this.content=content;
	}
	
	public String getContent()
	{
		return this.content;
	}
	
	public void setTitle(String title)
	{
		this.title=title;
	}
	
	public String getTitle()
	{
		return this.title;
	}
	
	public void setIntro(String intro)
	{
		this.intro=intro;
	}
	
	public String getIntro()
	{
		return this.intro;
	}
	
	public void setSort(String sort)
	{
		this.sort=sort;
	}
	
	public String getSort()
	{
		return this.sort;
	}
	
	public void setDatatime(String datatime)
	{
		this.datatime=datatime;
	}
	
	public String getDatatime()
	{
		return this.datatime;
	}
 
	public void setAuthor(String author)
	{
		this.author=author;
	}
	
	public String getAuthor()
	{
		return this.author;
	}
	
	public void setActive_id(int active_id)
	{
		this.active_id=active_id;
	}
	public int getActive_id()
	{
		return this.active_id;
	}
}
