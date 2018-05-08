package cn.javaweb.javabean;

public class Application {
     private int id;
     private int user_id;
     private int activity_id;
     private String datatime;
     private String news_title;
     private String user_name;
     //无参构造函数
     public Application()
     {
    	 
     }
     //有参构造函数
     public Application(int id,int user_id,int activity_id,String datatime,String news_title,String user_name)
     {
    	 this.id=id;
    	 this.user_id=user_id;
    	 this.activity_id=activity_id;
    	 this.datatime=datatime;
    	 this.news_title=news_title;
    	 this.user_name=user_name;
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
     //设置新闻id信息和获取新闻id信息
     public void setActivity_id(int activity_id)
     {
    	 this.activity_id=activity_id;
     }
     
     public int getActivity_id()
     {
    	 return this.activity_id;
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
     //设置报名的新闻的标题
     public void setNews_title(String news_title)
     {
    	 this.news_title=news_title;
     }
     public String getNews_title()
     {
    	 return news_title;
     }
     
     public void setUser_name(String user_name)
     {
    	 this.user_name=user_name;
     }
     public String getUser_name()
     {
    	 return this.user_name;
     }
}
