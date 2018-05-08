package cn.javaweb.javabean;

public class Message {
	private int id;
    private int user_id;
    private String content;
    private String datatime;
    private String sort;
    private String reply;
    private String redatatime;
    private String name;
    private String businessman;
    //无参构造函数
    public Message()
    {
   	 
    }
    //有参构造函数
    public Message(int id,int user_id,String content,String datatime,String sort,String reply,String redatatime,String businessman)
    {
   	 this.id=id;
   	 this.user_id=user_id;
   	 this.content=content;
   	 this.datatime=datatime;
   	 this.sort=sort;
   	 this.reply=reply;
   	 this.redatatime=redatatime;
   	 this.businessman=businessman;
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
    public void setUser_id(int user_id)
    {
   	 this.user_id=user_id;
    }
    
    public int getUser_id()
    {
   	 return this.user_id;
    }
    
    public void setContent(String content)
    {
    	this.content=content;
    }
    public String getContent()
    {
    	return this.content;
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
    public void setSort(String sort)
    {
   	 this.sort=sort;
    }
    public String getSort()
    {
   	 return this.sort;
    }
    public void setReply(String reply)
    {
    	this.reply=reply;
    }
    public String getReply()
    {
    	return this.reply;
    }
    public void setName(String name)
    {
    	this.name=name;
    }
    public String getName()
    {
    	return this.name;
    }
    public void setRedatatime(String redatatime)
    {
    	this.redatatime=redatatime;
    }
    public String getRedatatime()
    {
    	return this.redatatime;
    }
    public void setBusinessman(String businessman)
    {
    	this.businessman=businessman;
    }
    public String getBusinessman()
    {
    	return this.businessman;
    }
}
