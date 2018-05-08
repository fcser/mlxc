package cn.javaweb.javabean;

public class Picture {
private int id;
private String path;
private String intro;
private String datatime;
public Picture(){}
public Picture(int id,String path,String intro,String datatime){
	this.id=id;
	this.path=path;
	this.intro=intro;
	this.datatime=datatime;
}

public void setId(int id)
{
	this.id=id;
}
public int getId()
{
	return this.id;
}

public void setPath(String path)
{
	this.path=path;
}
public String getPath()
{
	return this.path;
}

public void setIntro(String intro)
{
	this.intro=intro;
}
public String getIntro()
{
	return this.intro;
}

public void setDatatime(String datatime)
{
	this.datatime=datatime;
}
public String getDatatime()
{
	return this.datatime;
}
}
