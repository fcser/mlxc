package cn.javaweb.javabean;

public class Admin {
	private int id;
	private String user;
	private String password;
	private String sort;
    private int is_mng;
	
	public Admin(){}
	
	Admin(int id,String user,String password,String sort)
	{
		this.id=id;
		this.user=user;
		this.password=password;
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
	public void setIs_mng(int is_mng)
	{
		this.is_mng=is_mng;
	}
	
	public int getIs_mng()
	{
		return this.is_mng;
	}
	public void setUser(String user)
	{
		this.user=user;
	}
	
	public String getUser()
	{
		return this.user;
	}
	
	public void setPassword(String password)
	{
		this.password=password;
	}
	
	public String getPassword()
	{
		return this.password;
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
