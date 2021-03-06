<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="cn.javaweb.sql.*" errorPage="error.jsp"%>
<%@ page import="cn.javaweb.javabean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>美丽的房屋</title>
<link rel="stylesheet" href="zhuzhai/css/bootstrap.min.css">
<link rel="stylesheet" href="zhuzhai/css/style.css">

</head>

<body>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">
                <a href="#" class="navbar-brand logo"> <img src="zhuzhai/images/L-LOGO-1.png" alt="忆美.红星"></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
               <div class="nav-r">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> 我的村庄</a></li>
                   <li class="active"><a href="home.jsp"><span class="glyphicon glyphicon-globe" ></span> 美丽的房屋</a></li>
				   <li><a href="chuxing.jsp"><span class="glyphicon glyphicon-plane" ></span> 便捷的交通</a></li>
				   <li><a href="sport.jsp"><span class="glyphicon glyphicon-fire" ></span> 多彩的活动</a></li>
				   <li><a href="food.jsp"><span class="glyphicon glyphicon-cutlery" ></span> 美味的食物</a></li>
				   <li><a href="us.jsp"><span class="glyphicon glyphicon-heart" ></span> 关于我们</a></li>
				   <li><a href="introduce.jsp?id=${USER.id }"><span class="glyphicon glyphicon-user" ></span> ${personal }</a></li>
                </ul> 
               </div>
               <div class="nav-l">
                <ul class=" nav navbar-nav">
                   <li class=""><a href="regist.jsp"><span class="glyphicon glyphicon-edit" ></span> 注册 </a></li>
                   <li class=""><a href="Login.jsp"><span class="glyphicon glyphicon-off" ></span> 登录</a></li>
                </ul>
               </div>    
            </div>       
        </div>   
    </nav>
</header>
      
<div class="tm-body">
   
   <div class="tm-2">
       <div class="container">
           <div class="row">
               <div class="col-md-12">
               	   <div style="border-bottom: 1px solid #999999;"><img src="zhuzhai/images/lu.png" style="padding: 10px 0;" /></div>
                   <!--<h2>房屋的变美之路</h2>-->
               </div>
           </div>
           <div class="row">
               <div class="col-md-2 tm-2-col">
                  <div class="ih-item">   
                              <a href="zhuzhai-wenzhang/sx-zhuzhai1.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai1.jpg" alt="img"></div> <!-- //图片-->
                                  <div class="img-txt">
                                      <h4> 茅 草 屋 <br/><span>五六十年代</span></h4>
                                  </div>
                                      <div class="info">     <!--  //提示文字-->
                                       
                                          <p>没有任何设计，稍遮风雨</p>
                                      </div>
                               </a>
                   </div>
               </div> 
                <div class="col-md-2 tm-2-col">
                   <div class="ih-item">   
                              <a href="zhuzhai/zhuzhai-wenzhang/sx-zhuzhai2.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai2.jpg" alt="img"></div> <!-- //图片-->
                                  <div class="img-txt">
                                      <h4>黄 土 房 <br/><span>七八十年代</span></h4>
                                  </div>
                                      <div class="info">     <!--  //提示文字-->                                       
                                          <p>没有任何设计,可以挡风遮雨</p>
                                      </div>
                               </a>
                           </div>
               </div> 
                <div class="col-md-2 tm-2-col">
                   <div class="ih-item">   
                              <a href="zhuzhai/zhuzhai-wenzhang/sx-zhuzhai3.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai3.jpg" alt="img"></div> <!-- //图片-->
                                   <div class="img-txt">
                                       <h4>石 头 房<br/><span>七八十年代</span></h4>
                                  </div>
                                      <div class="info">     <!--  //提示文字-->
                                        <p>房子变大了，也更牢固了</p>
                                   </div>
                               </a>
                   </div>
               </div> 
               <div class="col-md-2 tm-2-col">
                  <div class="ih-item">   
                             <a href="zhuzhai/zhuzhai-wenzhang/sx-zhuzhai4.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai4.jpg" alt="img"></div> <!-- //图片-->
                                  <div class="img-txt">
                                       <h4>砖 瓦 房<br/><span>八九十年代</span></h4>                                    
                                  </div>
                                      <div class="info">     <!--  //提示文字-->
                                       <p>在牢固实用的前提下，更注重美观</p>
                                      </div>
                               </a>
                   </div>
               </div> 
               <div class="col-md-2 tm-2-col">
                   <div class="ih-item">   
                              <a href="zhuzhai/zhuzhai-wenzhang/sx-zhuzhai5.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai5.jpg" alt="img"></div> <!-- //图片-->
                                  <div class="img-txt">
                                      <h4>红 色 砖 瓦 房<br/><span>八九十年代</span></h4>
                                   
                                  </div>
                                      <div class="info">     <!--  //提示文字-->                                       
                                          <p>有了二层小楼，孩子也有属于自己的空间</p>
                                      </div>
                               </a>
                           </div>
               </div> 
               <div class="col-md-2 tm-2-col">
                   <div class="ih-item">   
                              <a href="zhuzhai/zhuzhai-wenzhang/sx-zhuzhai6.html">
                                  <div class="img"><img src="zhuzhai/images/sx-zhuzhai6.jpg" alt="img"></div> <!-- //图片-->
                                   <div class="img-txt">
                                        <h4>钢 筋 水 泥 房<br/><span>21世纪</span></h4>
                                   
                                  </div>
                                      <div class="info">     <!--  //提示文字-->
                                        <p>集客厅、餐厅、厨房等为一体，更有小别墅，小洋房等</p>
                                   </div>
                               </a>
                   </div>
               </div> 
               
           </div>
    <div class="row">
   	    <div class="col-md-12 tm-3-col">
             
                            <p class="tm-3-description">社会在发展，时代在进步。现在的<a href="http://baike.baidu.com/link?url=f4yi4oAgQtYwwke8Jrd0VR0RGehtBjVrgMCMj-N-cbkyJbdAR7Mj3Hu_fbyPn4z3qJwKjkwr9ZKVEcRxILKi2Bh9L2mU_4REsI6yvflACHpt1pjGv77yAKD9qQ_wofdJ" target="_parent">农村</a>跟几十年前相比发生了翻天覆地的变化！就从住房条件来说：</p>
                            <p><li class="tm-3-description">以前只有用茅草和木头搭建的“陋室”，牢固性差，遮挡风雨的能力更是不行 </li></p>
                            <p><li class="tm-3-description">后来有了石头黄土房，用黄土混稻草加水做粘料也是人们智慧的体现，可日子久了还是会“<a href="http://baike.baidu.com/link?url=f4yi4oAgQtYwwke8Jrd0VR0RGehtBjVrgMCMj-N-cbkyJbdAR7Mj3Hu_fbyPn4z3qJwKjkwr9ZKVEcRxILKi2Bh9L2mU_4REsI6yvflACHpt1pjGv77yAKD9qQ_wofdJ" target="_parent">岌岌可危</a>”</li></p>   
                            <p><li class="tm-3-description">再后来有了砖瓦房，用砖头、瓦片盖起来，既能遮风挡雨，又不失美观，可满足不了农村人对高楼大厦的憧憬 </li></p>  
                            <p><li class="tm-3-description">一直到现在村里也有了钢筋水泥铸成的小洋房，小别墅，让农村有了新的“味道” </li></p>
              </div>
   	
   </div>
   </div>
   
 </div>
   
   <div class="tm-1">
      <div class="container">
       
           
              <div class="container"> 
              	<div class="row">
                    <div class="col-md-12">
                    	<div style="border-bottom: 1px solid #999999;"><img src="zhuzhai/images/xiangkan.png" style="padding: 10px 0;" /></div>
                        <!--<h2 class="tm-0-title">你想看的都在这里</h2>-->
                    </div>
           </div>
           <%
	ArrayList<News> NEW=NewsDAO.findALLNewsbysort("住宅");
	request.setAttribute("NEW", NEW);
	
	ArrayList<Article> article=ArticleDAO.findallArticlebyrank("住宅");
	request.setAttribute("article", article);
	
	ArrayList<Document> document=DocumentDAO.findALLDocumentbyrank("住宅");
	request.setAttribute("document", document);
	
	ArrayList<News> news=NewsDAO.findALLNewsbysorttime("住宅");
	request.setAttribute("news", news);
	
	ArrayList<Article> Article=ArticleDAO.findallArticlebytime("住宅",1);
	request.setAttribute("Article", Article);
	
	ArrayList<Document> Document=DocumentDAO.findALLDocumentbysort("住宅");
	request.setAttribute("Document", Document);
        %>
                <div class="row">
                 <c:forEach items="${article}" var="bas" begin="0" end="0">
                    <div class="col-md-6 tm-1-col">                     
                       <div class="tm-1-boxes-container">
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">${bas.title }</h2>
                                    <p>${bas.intro }</p>    
                                </div>                            
                                <a href="article.jsp?id=${bas.id }" class="tm-1-link tm-button">查看全文</a>
                            </div>
                       </div>  
                     </div>
                     </c:forEach>
                      <c:forEach items="${NEW}" var="bas" begin="0" end="0">
                     <div class="col-md-6 tm-1-col"> 
                       <div class="tm-1-boxes-container">      
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">${bas.title }</h2>
                                    <p>${bas.intro }</p>    
                                </div>                            
                                <a href="news.jsp?id=${bas.id }" class="tm-1-link tm-button">查看全文</a>
                            </div>
                       </div>                   
                     </div>
                     </c:forEach>
                  </div>                  
              </div>
          
   </div>
   
    <!--<div class="tm-1">
      <div class="container">
          <div class="bg bg-blur"></div>
            <div class="content">
              <div class="container"> 
              	<div class="row">
                    <div class="col-md-12">
                        <h2 class="tm-0-title">你想看的都在这里</h2>
                    </div>
           </div>
                <div class="row">
                    <div class="col-md-6 tm-1-col">                     
                       <div class="tm-1-boxes-container">
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">中国农村住宅现状问题</h2>
                                    <p>本文简单介绍了中国农村住宅在技术层面和环保方面及国外住宅在上述两方面的现状。</p>    
                                </div>                            
                                <a href="https://wenku.baidu.com/view/d1f1347d453610661fd9f422.html" class="tm-1-link tm-button">查看全文</a>
                            </div>
                       </div>  
                     </div>
                     <div class="col-md-6 tm-1-col"> 
                       <div class="tm-1-boxes-container">      
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">中国农村住宅发展趋势</h2>
                                    <p>住宅的建设和发展关系国计民生，有效解决其建设和发展问题，是全面建设小康社会的重要方面</p>    
                                </div>                            
                                <a href="https://wenku.baidu.com/view/f21f13725a8102d276a22fbe.html" class="tm-1-link tm-button">查看全文</a>
                            </div>
                       </div>                   
                     </div>
                  </div>                  
              </div>
          </div>
        </div>
   </div>-->
     
     
     
     <!--<div class="tm-3">
       <div class="container">
           <div class="row">
              <div class="col-md-5 tm-3-col">
                  <img src="images/timg.jpg">
              </div>
              
           </div>
       </div>
   </div>-->
     <div class="tm-4">
       <div class="container">
            <div class="row">
               <div class="col-md-12">
                   <div style="border-bottom: 1px solid #999999;"><img src="zhuzhai/images/xinxianchulu.png" style=" margin-top:30px;padding: 10px 0;" /></div>
               </div>
           </div>
            
           <div class="row">
           <c:forEach items="${document}" var="bas" begin="0" end="0">
              <div class="col-md-12 tm-4-col tm-4-1">
                   <h2 class="tm-4-title">${bas.title }</h2>
                            <p>${bas.intro }</p>
                            <a href="document.jsp?id=${bas.id }" class="tm-button tm-button-normal">了解更多</a>
              </div>
              </c:forEach>
              <div class="row">
                  <div class="col-md-6 tm-4-col tm-4-2">
                       <ul class="tm-4-xinwen">
                       <c:forEach items="${news}" var="bas" begin="0" end="3">
                                <li><a href="news.jsp?id=${bas.id }">${bas.title }</a></li>
                                </c:forEach>
                               
                       </ul>
                  </div>
                   <div class="col-md-6 tm-4-col tm-4-2">
                       <ul class="tm-4-xinwen">
                                <c:forEach items="${Document}" var="bas" begin="0" end="3">
                                <li><a href="document.jsp?id=${bas.id }">${bas.title }</a></li>
                                </c:forEach>
                       </ul>
                  </div>
              </div> 
           </div>
       </div>
   </div> 
   
   
      
</div>             
             
             <div class="footer">
               <div class="container">
                   <h2 class="f-title"><img src="zhuzhai/images/jianyi.png" /></h2>
				<form action="Add_servlet" method="post">						
					 <div class="row">
                               <div class="col-md-12">
                                   <!--<label for="message"></label>-->
                                   <input type="hidden" name="user" value="${USER.id }">
                                   <input type="hidden" name="sort" value="住宅">
                                   <input type="hidden" name="Type" value="message">
                                   <textarea rows="6" id="message" name="content" class="form-input"></textarea>
                               </div>
                           </div>
                           <div class="row">
                               <div class="col-md-12">
                                   <button class="main-button" type="submit">提交</button>${msg }
                               </div>
                           </div>			
				</form>
                
               </div>
                 
             </div>    
<script src="zhuzhai/js/jquery.min.js"></script>
<script src="zhuzhai/js/bootstrap.min.js"></script>

</body>
</html>
