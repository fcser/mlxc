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
<title>美食</title>
<link rel="stylesheet" href="meishi/css/bootstrap.min.css">
<link rel="stylesheet" href="meishi/css/style.css">

</head>

<body>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">  <!--width:200%; height:370%;   style="margin-top:-10px; width:100%;"--> 
                <a href="#" class="navbar-brand logo"> <img src="meishi/images/L-LOGO-1.jpg"  alt="忆美.红星"></a>
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
                   <li><a href="home.jsp"><span class="glyphicon glyphicon-globe" ></span> 美丽的房屋</a></li>
				  <li><a href="chuxing.jsp"><span class="glyphicon glyphicon-plane" ></span> 便捷的交通</a></li>
				   <li><a href="sport.jsp"><span class="glyphicon glyphicon-fire" ></span> 多彩的活动</a></li>
				   <li class="active"><a href="food.jsp"><span class="glyphicon glyphicon-cutlery" ></span> 美味的食物</a></li>
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



<!--轮播图-->
    <!--<div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
           <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
           <li data-target="#myCarousel" data-slide-to="1"></li>
           <li data-target="#myCarousel" data-slide-to="2"></li>-->
           <!--<li data-target="#myCarousel" data-slide-to="3"></li>-->
        <!--</ol>
        <div class="carousel-inner">
            <div class="item active"><a href="#"><img src="images/slides/slide2.jpg" alt="第一张"></a>
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item"><a href="#"><img src="images/slides/slide4.jpg" alt="第二张"></a>
                <div class="carousel-caption">
                    
                </div>   
            </div>-->
            
            <!--<div class="item"><a href="#"><img src="images/slides/slide4.jpg" alt="第四张"></a>
               <div class="carousel-caption">
                   
                </div>   
            </div>-->
        <!--</div>
        <a href="#myCarousel" data-slide="prev" class="carousel-control left"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a href="#myCarousel" data-slide="next" class="carousel-control right"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
    
    -->
 
     <div data-target="#s-mean" data-offset="-50" data-spy="scroll" style="padding:0 10px; overflow:auto; position:relative;">
        
        <div class="s-part">
         
	              
          <div class="s-part2">
              <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="chuxing" class="b-title"><img src="meishi/images/1505891924_128139.png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-6 partner-logo2">
                         <div class="ih-item">   
                              <a href="meishi/chuxing-wenzhang/sx-chuxing5.html">
                                  <div class="img"><img src="meishi/images/meishi1.jpg" ="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>二十世纪六七十年代，人们的生活艰苦，到处都在闹饥荒。那时候为了裹腹，树皮、树叶都会吃。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>树叶裹腹</h4>
			                    <h6></h6> 
                           </div>                          
                       </div>
                       
                        <div class="col-md-6 partner-logo2">
                         <div class="ih-item">   
                              <a href="meishi/chuxing-wenzhang/sx-chuxing3.html">
                                  <div class="img"><img src="meishi/images/meishi2.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                      <p>慢慢人们的生活水平得到了提高，人们可以不用挨饿，不用啃草根、吃树皮。但白面馒头还是稀罕物，经常吃的还是红薯和玉米。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>摆脱饥饿</h4>
			                    <h6></h6> 
                           </div>                          
                       </div>
                        <div class="col-md-6 partner-logo2">
                         <div class="ih-item">   
                              <a href="https://baijiahao.baidu.com/po/feed/share?wfr=spider&for=pc&context=%7B%22sourceFrom%22%3A%22bjh%22%2C%22nid%22%3A%22news_3573331828192491144%22%7D">
                                  <div class="img"><img src="meishi/images/meishi 3.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>改革开放以来，人们的物质生活水平迅速提高，人们渐渐过上了小康的生活。“有钱了”，人们可以顿顿大鱼大肉，</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>大鱼大肉</h4>
			                    <h6></h6> 
                           </div>                          
                       </div>
                        <div class="col-md-6 partner-logo2">
                         <div class="ih-item">   
                              <a href="https://baijiahao.baidu.com/po/feed/share?wfr=spider&for=pc&context=%7B%22sourceFrom%22%3A%22bjh%22%2C%22nid%22%3A%22news_3573331828192491144%22%7D">
                                  <div class="img"><img src="meishi/images/meishi4.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>人们的物质水平提高了，伴随而来的是因平时的大鱼大肉带来的各种疾病，人们也渐渐意识到“花钱买来的不健康是一种愚蠢的行为”。越来越多的人崇尚养生，健康饮食，慢慢的提高我们的精神层次。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>健康饮食</h4>
			                    <h6></h6> 
                           </div>                          
                       </div>
                  </div>                
             </div>
           </div>
           
    <div class="tab1">
        <div class="container">
        <div class="row">
		    <div class="col-md-12">
			<h2 class="tab-h2"><img src="meishi/images/xiangkan.png" /></h2>
            <!--<button class="btn tab1-btn"><a href="#">查看所有</a></button>-->
            <hr/>
		    </div>
		</div>
		<%
	ArrayList<News> NEW=NewsDAO.findALLNewsbysort("美食");
	request.setAttribute("NEW", NEW);
	
	ArrayList<Article> article=ArticleDAO.findallArticlebyrank("美食");
	request.setAttribute("article", article);
	
	ArrayList<Document> document=DocumentDAO.findALLDocumentbyrank("美食");
	request.setAttribute("document", document);
	
	ArrayList<News> news=NewsDAO.findALLNewsbysorttime("美食");
	request.setAttribute("news", news);
	
	ArrayList<Article> Article=ArticleDAO.findallArticlebytime("美食",1);
	request.setAttribute("Article", Article);
	
	ArrayList<Document> Document=DocumentDAO.findALLDocumentbysort("美食");
	request.setAttribute("Document", Document);
        %>
        <div class="row">
        <c:forEach items="${NEW}" var="bas" begin="0" end="0">
            <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-eye-open"></span></a>
                    </div>
                    <div class="media-boday">
                        <h4 class="media-heading">今日热点</h4>
                        <p>${bas.title }</p>
                        <p>${bas.intro }</p>
                        
                        <div class="m1"><a href="news.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                </div>
              </div>
              </c:forEach>
              <c:forEach items="${document}" var="bas" begin="0" end="0">
               <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-align-right"></span></a>
                    </div>
                    <div class="media-boday">
                        <h4 class="media-heading">吃货必看</h4>                      
			            <p>${bas.title }</p>
			            <p>${bas.intro }</p>
			           
                        <div class="m1"><a href="document.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                </div>
              </div>
              </c:forEach>
              <c:forEach items="${article}" var="bas" begin="0" end="0">
              <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-eye-open"></span></a>
                    </div>
                    <div class="media-boday">
                        <h4 class="media-heading">最佳分享</h4>
                        <p>${bas.title }</p>
                        <p>${bas.intro }</p>
                        
                        <div class="m1"><a href="article.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                </div>
              
              </div>
               </c:forEach>
        
        </div>
        </div>
    </div>
    
    
    <div class="tab2">        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="tab2-h2"><img src="meishi/images/xinxianchulu.png"/></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-2">
                <c:forEach items="${news}" var="bas" begin="0" end="2">
                            <li><a href="news.jsp?id=${bas.id }">${bas.title }</a></li>
			              </c:forEach>
                </div>
                <div class="col-md-4 col-2">  
                <c:forEach items="${Document}" var="bas" begin="0" end="2">                
			                <li><a href="document.jsp?id=${bas.id }">${bas.title }</a></li>
			               </c:forEach>
                </div>
                <div class="col-md-4 col-2">
                             <c:forEach items="${Article}" var="bas" begin="0" end="2">                
			                <li><a href="article.jsp?id=${bas.id }">${bas.title }</a></li>
			               </c:forEach>
                </div>
            </div>
        </div>
    </div>      
          
          <div class="s-part4">
              <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="meishi" class="b-title"><img src="meishi/images/title2.png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-3 partner-logo4">
                         <div class="ih-item">   
                              <a href="meishi/meishi-wenzhang/sx-meishi1.html">
                                  <div class="img"><img src="meishi/images/sx-meishi1.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>主要原料为配料和豆腐，材料主要有豆腐、牛肉末（也可以用猪肉）、辣椒和花椒等。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>麻婆豆腐</h4>
			                    <h6>川菜系</h6> 
                           </div>                          
                       </div>
                       
                        <div class="col-md-3 partner-logo4">
                         <div class="ih-item">   
                              <a href="meishi/meishi-wenzhang/sx-meishi2.html">
                                  <div class="img"><img src="meishi/images/sx-meishi2.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                      <p>主料均为鸡腿和可乐。味道鲜美，色泽艳丽，鸡翅嫩滑，又保留了可乐的香气，深受广大食客喜爱</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>红烧鸡腿</h4>
			                    <h6>家常菜</h6> 
                           </div>                          
                       </div>
                        <div class="col-md-3 partner-logo4">
                         <div class="ih-item">   
                              <a href="meishi/meishi-wenzhang/sx-meishi3.html">
                                  <div class="img"><img src="meishi/images/sx-meishi3.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>清新的粽叶混合着鲜肉的香味，让人垂涎欲滴，再加入一颗蛋黄，又让咸香的粽子带上了一丝甜意，风味独具。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>蛋黄肉粽</h4>
			                    <h6>节日小吃</h6> 
                           </div>                          
                       </div>
                        <div class="col-md-3 partner-logo4">
                         <div class="ih-item">   
                              <a href="meishi/meishi-wenzhang/sx-meishi4.html">
                                  <div class="img"><img src="meishi/images/sx-meishi4.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>制作原料主要有瘦肉、彩椒、蚝油等，营养丰富，老少皆宜。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>彩椒炒肉丝</h4>
			                    <h6>家常菜</h6> 
                           </div>                          
                       </div>
                  </div>                
             </div>
           </div>
          </div>
		</div>
        <div class="footer">
               <div class="container">
                   <h3 class="f-title"><img src="meishi/images/jianyi.png" /></h3>
				<form action="Add_servlet" method="post">						
					 <div class="row">
                               <div class="col-md-12">
                                   <!--<label for="message"></label>-->
                                   <input type="hidden" name="user" value="${USER.id }">
                                   <input type="hidden" name="sort" value="食物">
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
        
<script src="meishi/js/jquery.min.js"></script>
<script src="meishi/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function(){
	   $('#myCarousel').carousel({
		   intervel:3000,
		   });
	   })
	   



	   
	   
</script>
</body>
</html>
