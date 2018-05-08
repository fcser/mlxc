package cn.javaweb.javabean;

public class Comment {
	private int id;
    private String user_name;
    private int news_id;
    private String datatime;
    private String content;
    private int goodnum;
    private int beuser_id;
    //无参构造函数
    public Comment()
    {
   	 
    }
    //有参构造函数
    public Comment(int id,String user_name,int news_id,String datatime,String content,int goodnum,int beuser_id)
    {
   	 this.id=id;
   	 this.user_name=user_name;
   	 this.news_id=news_id;
   	 this.datatime=datatime;
   	 this.content=content;
   	 this.goodnum=goodnum;
   	 this.beuser_id=beuser_id;
    }
    //设置id和获取id
    public void setId(int id)
    {
   	 this.id=id;
    }
    
    public int getId()
    {
   	 return this.id;
    }
    //设置用户id和获取用户id
    public void setUser_name(String user_name)
    {
   	 this.user_name=user_name;
    }
    
    public String getUser_name()
    {
   	 return this.user_name;
    }
    //设置文章id信息和获取文章id信息
    public void setNews_id(int news_id)
    {
   	 this.news_id=news_id;
    }
    
    public int getNews_id()
    {
   	 return this.news_id;
    }
    //设置存储时间和获取存储时间
    public void setDatatime(String datatime)
    {
   	 this.datatime=datatime;
    }
    public String getDatatime()
    {
   	 return this.datatime;
    }
    //设置评论内容和获取评论内容
    public void setContent(String content)
    {
    	this.content=content;
    }
    public String getContent()
    {
    	return this.content;
    }
    
    public void setGoodnum(int goodnum)
	{
		this.goodnum=goodnum;
	}
	
	public int getGoodnum()
	{
		return this.goodnum;
	}
	
	public void setBeuser_id(int beuser_id)
	{
		this.beuser_id=beuser_id;
	}
	public int getBeuser_id()
	{
		return this.beuser_id;
	}
}
