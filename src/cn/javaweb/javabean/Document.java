package cn.javaweb.javabean;

public class Document {
	private int id;
	private String title;
	private String author;
	private String content;
	private String datatime;
	private String link;
	private String sort;
	private String intro;
	private int rank;
	public Document(){}
	public Document(int id,String title,String intro,String content,String datatime,String author,String sort,String link,int rank)
	{
		this.id=id;
		this.title=title;
		this.content=content;
		this.datatime=datatime;
		this.intro=intro;
		this.sort=sort;
		this.author=author;
		this.link=link;
		this.rank=rank;
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
	
	public void setLink(String link)
	{
		this.link=link;
	}
	public String getLink()
	{
		return this.link;
	}
	public void setRank(int rank)
	{
		this.rank=rank;
	}
	
	public int getRank()
	{
		return this.rank;
	}
}
