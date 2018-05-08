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
<title>index</title>
<link rel="stylesheet" href="yundong/css/bootstrap.min.css">
<link rel="stylesheet" href="yundong/css/style.css">

</head>

<body>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">
                <a href="#" class="navbar-brand logo"> <img src="yundong/images/L-LOGO-1.jpg" alt="忆美.红星"></a>
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
				   <li class="active"><a href="sport.jsp"><span class="glyphicon glyphicon-fire" ></span> 多彩的活动</a></li>
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
   <%
	ArrayList<News> NEW=NewsDAO.findALLNewsbysort("运动");
	request.setAttribute("NEW", NEW);
	
	ArrayList<Article> article=ArticleDAO.findallArticlebyrank("运动");
	request.setAttribute("article", article);
	
	ArrayList<Document> document=DocumentDAO.findALLDocumentbyrank("运动");
	request.setAttribute("document", document);
	
	ArrayList<News> news=NewsDAO.findALLNewsbysorttime("运动");
	request.setAttribute("news", news);
	
	ArrayList<Article> Article=ArticleDAO.findallArticlebytime("运动",1);
	request.setAttribute("Article", Article);
	
	ArrayList<Document> Document=DocumentDAO.findALLDocumentbysort("运动");
	request.setAttribute("Document", Document);
        %>   
<div class="tm-body">
   
   
    <div class="tm-1">
      <div class="container">
          <div class="bg bg-blur"></div>
            <div class="content">
              <div class="container">          
                <div class="row">
                <c:forEach items="${article}" var="bas" begin="0" end="0">
                    <div class="col-md-4 tm-1-col">                     
                       <div class="tm-1-boxes-container">
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">${bas.title }</h2>
                                    <p><font color=#000000  >${bas.intro }</font></p> 
                                  
                                </div>                            
                                <a href="article.jsp?id=${bas.id }" class="tm-1-link tm-button">了解更多</a>
                            </div>
                       </div>  
                     </div>
                     </c:forEach>
                     <c:forEach items="${NEW}" var="bas" begin="0" end="0">
                     <div class="col-md-4 tm-1-col"> 
                       <div class="tm-1-boxes-container">      
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">${bas.title }</h2>
                                    <p><font color=#000000  >${bas.intro }</font></p> 
                                   
                                </div>                            
                                <a href="news.jsp?id=${bas.id }" class="tm-1-link tm-button">了解更多</a>
                            </div>
                       </div>                   
                     </div>
                     </c:forEach>
                     <c:forEach items="${document}" var="bas" begin="0" end="0">
                     <div class="col-md-4 tm-1-col">                     
                       <div class="tm-1-boxes-container">
                            <div class="tm-1-box">
                                <div class="tm-1-text">
                                    <h2 class="tm-1-title">${bas.title }</h2>
                                    <p><font color=#000000  >${bas.intro }</font></p>   
                                    
                                </div>                            
                                <a href="document.jsp?id=${bas.id }" class="tm-1-link tm-button">了解更多</a>
                            </div>
                       </div>  
                     </div>
                    </c:forEach>
                  </div>                  
              </div>
          </div>
        </div>
   </div>
     <div class="board">
		<div class="container">
			<div class="col-md-3 board-right">
			<div class="col-md1 ">
				<a href="#" class="b-link-stripe b-animate-go  thickbox">
					<img src="yundong/images/gg1.png" class="img-responsive" alt="">
						<div class="b-wrapper">
							<h3 class="b-animate b-from-top top-in1   b-delay03 ">
									
							</h3>
						</div>
				</a>
			</div>
			</div>
			<div class="col-md-3 board-mid">
				<h5><font color="#C9302C" >公共设施</font></h5>
				<p>村头忽然出现的公共健身器材。</p>
				<a class="hvr-shutter-in-horizontal" href="yundong/yundong-wenzhang/sx-yungdong1.html"><font color=#2AABD2 >更多</font></a>
			</div>
			<div class="col-md-6 board-left">
				<div class="col-md1 ">
					<a href="#" class="b-link-stripe b-animate-go  thickbox">
						<img src="yundong/images/24.jpg" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in1   b-delay03 ">
									
								</h3>
							</div>
					</a>
				</div>
			</div>
				<div class="clearfix"></div>
			<div class="col-md-6 board-left">
				<div class="col-md1 ">
					<a href="#" class="b-link-stripe b-animate-go  thickbox">
						<img src="yundong/images/2.jpg" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in1   b-delay03 ">
										
								</h3>
							</div>
					</a>
				</div>
			</div>
			<div class="col-md-3 board-mid">
				<h5><font color="#C9302C" >广场舞盛行</font></h5>
				<p>广场舞的盛行给村里的人们带去了更多的笑容</p>
				<a class="hvr-shutter-in-horizontal" href="yundong/yundong-wenzhang/sx-yungdong3.html"><font color=#2AABD2 >更多</font></a>
			</div>
			<div class="col-md-3 board-right">
				<div class="col-md1 ">
					<a href="#" class="b-link-stripe b-animate-go  thickbox">
						<img src="yundong/images/20.jpg" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in1   b-delay03 ">
										
								</h3>
							</div>
					</a>
				</div>
			</div>
				<div class="clearfix"></div>
			
			<div class="col-md-3 board-right">
				<div class="col-md1 ">
					<a href="#" class="b-link-stripe b-animate-go  thickbox">
						<img src="yundong/images/qm.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in1   b-delay03 ">
									
								</h3>
							</div>
					</a>
				</div>
			</div>
			<div class="col-md-3 board-mid">
				<h5><font color="#C9302C" >村里运动会</font></h5>
				<p>村中的运动健将们可以再运动会上一展雄姿。</p>
				<a class="hvr-shutter-in-horizontal" href="yundong/yundong-wenzhang/sx-yungdong2.html"><font color=#2AABD2 >更多</font></a>
			</div>
			<div class="col-md-6 board-left">
				<div class="col-md1 ">
					<a href="#" class="b-link-stripe b-animate-go  thickbox">
						<img src="yundong/images/14.png" class="img-responsive" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in1   b-delay03 ">
									
								</h3>
							</div>
					</a>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
<!-- board -->
<!-- categories -->
	<div class="categories">
		<div class="container">
			<div class="col-md-3 cate-left">
			<h3><font color="#C9302C" >村里体育快报</font></h3>
				<ul>
				<c:forEach items="${news}" var="bas" begin="0" end="6">
					<li><a href="news.jsp?id=${bas.id }"><span></span>${bas.title } </a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-5 cate-left1">
				<h3><font color="#C9302C" >有更多你不知道的事</font></h3>
				<img src="yundong/images/1.jpg" class="img-responsive" alt="" />
				<p>在这个崇尚养生之道的时代，人们在追求更高品质的生活，从衣食住行各个方面来提高生活的健康指数，但往往忽略了养生之道最根本的要求--运动。来吧，一起走进运动的人生...</p>
				<a class="hvr-shutter-in-horizontal" href="#">更多</a>
			</div>
			
			<div class="col-md-3 cate-left">
			<h3><font color="#C9302C" >运动小贴士</font></h3>
				<ul>
				<c:forEach items="${Document}" var="bas" begin="0" end="6">
					<li><a href="document.jsp?id=${bas.id }"><span></span>${bas.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			</div>
			<div class="footer">
               <div class="container">
                   <h3 class="f-title"><img src="yundong/images/jianyi.png" /></h3>
				<form action="Add_servlet" method="post">						
					 <div class="row">
                               <div class="col-md-12">
                                   <!--<label for="message"></label>-->
                                   <input type="hidden" name="user" value="${USER.id }">
                                   <input type="hidden" name="sort" value="运动">
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
<script src="yundong/js/jquery.min.js"></script>
<script src="yundong/js/bootstrap.min.js"></script>

</body>
</html>
