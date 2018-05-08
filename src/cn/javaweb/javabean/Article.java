package cn.javaweb.javabean;

public class Article {
	private int id;
	private String title;
	private String intro;
	private String content;
	private String time;
	private String author;
	private String sort;
	private int havepass;
	private int rank;
	//private int goodnum;
	private int collectnum;
	private String state;
	public Article(){}
	
	
	public Article(int id,String title,String intro,String content,String time,String author,String sort,int havepass,int rank,int collectnum)
	{
		this.id=id;
		this.title=title;
		this.intro=intro;
		this.content=content;
		this.time=time;
		this.author=author;
		this.sort=sort;
		this.havepass=havepass;
		this.rank=rank;
		//this.goodnum=goodnum;
		this.collectnum=collectnum;
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
	
	public void setIntro(String intro)
	{
		this.intro=intro;
	}
	
	public String getIntro()
	{
		return this.intro;
	}
	
	public void setTitle(String title)
	{
		this.title=title;
	}
	
	public String getTitle()
	{
		return this.title;
	}
	
	public void setTime(String time)
	{
		this.time=time;
	}
	
	public String getTime()
	{
		return this.time;
	}
	public void setAuthor(String author)
	{
		this.author=author;
	}
	
	public String getAuthor()
	{
		return this.author;
	}
	public void setSort(String sort)
	{
		this.sort=sort;
	}
	
	public String getSort()
	{
		return this.sort;
	}
	public void setHavepass(int havepass)
	{
		this.havepass=havepass;
	}
	
	public int getHavepass()
	{
		return this.havepass;
	}
	

	public void setRank(int rank)
	{
		this.rank=rank;
	}
	
	public int getRank()
	{
		return this.rank;
	}
	
	/*public void setGoodnum(int goodnum)
	{
		this.goodnum=goodnum;
	}
	
	public int getGoodnum()
	{
		return this.goodnum;
	}*/

	public void setCollectnum(int collectnum)
	{
		this.collectnum=collectnum;
	}
	
	public int getCollectnum()
	{
		return this.collectnum;
	}
	
	public void setState(int havepass)
	{
		if(havepass==1)
		{
			this.state="审核通过";
		}
		else
		{
			this.state="审核未通过";
		}
	}
	
	public String getState()
	{
		return this.state;
	}
}
