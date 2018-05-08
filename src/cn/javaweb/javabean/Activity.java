package cn.javaweb.javabean;

public class Activity {
     private int id;
     private String title;
     private String content;
     private String time;
     private String place;
     private String datatime;
     private String sort;
     
     public Activity(){}
     public Activity(int id,String title,String content,String time,String place,String datatime,String sort)
     {
    	 this.id=id;
    	 this.title=title;
    	 this.content=content;
    	 this.time=time;
    	 this.place=place;
    	 this.datatime=datatime;
    	 this.sort=sort;
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
	
	public void setTime(String time)
	{
		this.time=time;
	}
	
	public String getTime()
	{
		return this.time;
	}
	public void setDatatime(String datatime)
	 {
	   	 this.datatime=datatime;
	 }
	public String getDatatime()
     {
	   	 return this.datatime;
     } 
	public void setPlace(String place)
	{
		this.place=place;
	}
	public String getPlace()
	{
		return this.place;
	}
	public void setSort(String sort)
	{
		this.sort=sort;
	}
	public String getSort()
	{
		return this.sort;
	}
}
