package cn.javaweb.javabean;

public class Collect {
	 private int id;
     private int user_id;
     private int article_id;
     private String datatime;
     private String article_name;
     //无参构造函数
     public Collect()
     {
    	 
     }
     //有参构造函数
     public Collect(int id,int user_id,int article_id,String datatime,String article_name)
     {
    	 this.id=id;
    	 this.user_id=user_id;
    	 this.article_id=article_id;
    	 this.datatime=datatime;
    	 this.article_name=article_name;
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
     public void setArticle_id(int article_id)
     {
    	 this.article_id=article_id;
     }
     
     public int getArticle_id()
     {
    	 return this.article_id;
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
     public void setArticle_name(String article_name)
     {
    	 this.article_name=article_name;
     }
     public String getArticle_name()
     {
    	 return this.article_name;
     }
}
