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
<title>便捷的交通</title>
<link rel="stylesheet" href="chuxing/css/bootstrap.min.css">
<link rel="stylesheet" href="chuxing/css/style.css">
<link href="http://vjs.zencdn.net/5.0.2/video-js.css" rel="stylesheet">
    <script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
    <script src="http://vjs.zencdn.net/5.0.2/video.js"></script>
</head>

<body>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">
                <a href="#" class="navbar-brand logo"> <img src="chuxing/images/L-LOGO-1.jpg" alt="忆美.红星"></a>
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
				  <li class="active"><a href="chuxing.jsp"><span class="glyphicon glyphicon-plane" ></span> 便捷的交通</a></li>
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


    <div class="tab1">
      <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="chuxing/images/video.mp4" class="v-title"><h2>“走”在“变美”的路上</h2></a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-1">
               <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="600" height="300" poster="images/123.jpg" data-setup="{}">
    <source src="chuxing/images/video.mp4" type="video/mp4">
    <!--<source src="images/video.mp4" type="video/webm">
    <sourcesrc="images/video.mp4" type="video/ogg">-->
    <track kind="captions" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
    <!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
    <!-- Tracks need an ending tag thanks to IE9 -->
    <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
  </video>

            </div>
             <div class="col-md-4 col-1"> <!-- padding:10px;-->
                <p>很久之前，我们的村子交通非常的闭塞，唯一的通往小镇的小路也是祖祖辈辈人的脚走出来的，那时候村子里的农作物如若要送往集市去买卖，<!--家里的长辈得天没量就背上扁担，头戴蓑笠从家中出门-->要经过数小时的山路后才能来到集市，但回到家后星光早已爬上枝头。</p>
                <p>后来村子铺了水泥路，路旁还放置了围栏，村子与镇上的交通变得便利了不少，各家各户的孩子都骑着与自己身材格格不入的永久自行车经过这条小路前往学校。村子的长辈说，这条路不仅通往远方小镇，更表示这村子里的村民通往美好的明天。</p>
                <p>现在小镇开通了城乡巴士，在政府的补贴下，平日里数小时的行程坐在巴士中短短数十分钟就能走出村庄，在便利的交通中村子里的人渐渐地多了起来，<!--许多出去打工的年轻人们回来了，周末城市里的居民也过来度假了，村庄的名气也渐渐的传播出来，-->大家都为政府的决策而赞美不已。</p>
            </div>
        </div>
        <div class="row">
		    <div class="col-md-12">
			<div style="border-bottom: 1px solid #999999;"><img src="chuxing/images/xiangkan.png" style="margin: 20px 0;" /></div>
		    </div>
		</div>
		<%
	ArrayList<News> NEW=NewsDAO.findALLNewsbysort("出行");
	request.setAttribute("NEW", NEW);
	
	ArrayList<Article> article=ArticleDAO.findallArticlebyrank("出行");
	request.setAttribute("article", article);
	
	ArrayList<Document> document=DocumentDAO.findALLDocumentbyrank("出行");
	request.setAttribute("document", document);
	
	ArrayList<News> news=NewsDAO.findALLNewsbysorttime("出行");
	request.setAttribute("news", news);
	
	ArrayList<Article> Article=ArticleDAO.findallArticlebytime("出行",1);
	request.setAttribute("Article", Article);
	
	ArrayList<Document> Document=DocumentDAO.findALLDocumentbysort("出行");
	request.setAttribute("Document", Document);
        %>
        <div class="row">
            <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-signal"></span></a>
                    </div>
                     <c:forEach items="${article}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h2 class="media-heading">本周最佳</h2>                       
                        <p>${bas.intro }</p>
                        <div class="m1"><a href="article.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                    </c:forEach>
                </div>
             </div>
             
             
              <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-th-list"></span></a>
                    </div>
                    <c:forEach items="${NEW}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h2 class="media-heading">本周最佳</h2>                       
                        <p>${bas.intro }</p>
                        <div class="m1"><a href="news.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                    </c:forEach>
                </div>
             </div>
             
             <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-align-right"></span></a>
                    </div>
                    <c:forEach items="${document}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h2 class="media-heading">本周最佳</h2>    
			            <p>${bas.intro }</p> 
                        <div class="m1"><a href="document.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                    </c:forEach>
               </div>
            </div>
         </div>
         <div class="row">
		    <div class="col-md-12">
			<div style="border-bottom: 1px solid #999999;"><img src="chuxing/images/xinxianchulu.png" style="margin: 20px 0;" /></div>
		    </div>
		</div>
         <div class="row">
         <c:forEach items="${news}" var="bas" begin="0" end="1">
           <div class="col-md-3 col">
              <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-flag"></span></a>
                    </div>
                    
                    <div class="media-boday">
                        <h2 class="media-heading">${bas.title }</h2>   
			            <p>${bas.intro }</p>
                        <div class="m1"><a href="news.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                   
              </div>
           </div>
           </c:forEach>
           <!--  <div class="col-md-3 col">
              <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-bell"></span></a>
                    </div>
                    <div class="media-boday">
                        <h2 class="media-heading">广告</h2>   
			            <p>本文主要介绍从六十年代至今的家常美食的变的公司股份的风景化天宇公司都会丰华股份几乎都是在看电视给的说法是高分考生和伽就是符合规范恢复高考的就是个v尴尬</p>
                        <div class="m1"><a href="#">了解更多</a></div>
                    </div>
              </div>
           </div>-->
           <c:forEach items="${Document}" var="bas" begin="0" end="1">
           <div class="col-md-3 col">
              <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-piggy-bank"></span></a>
                    </div>
                    <div class="media-boday">
                        <h2 class="media-heading">${bas.title }</h2>   
			            <p>${bas.intro }</p>
                        <div class="m1"><a href="document.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
              </div>
           </div>
              </c:forEach>
           <!--  <div class="col-md-3 col">
              <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                    </div>
                    <div class="media-boday">
                        <h2 class="media-heading">汽车广告</h2>   
			            <p>本文主要介绍从六十年代至今的家常美食的变化天宇公副队好多海鲜司都会丰华股份几乎都是在看电视给的说法是高分考生和伽就是符合规范恢复高考的就是个v尴尬</p>
                        <div class="m1"><a href="#">了解更多</a></div>
                    </div>
              </div>
           </div>-->
            </div>
                    
        </div>
    </div>
    
    <div class="fh5co-narrow-content">
        <div class="container">
				<h3 class="s-title"><img src="chuxing/images/meilichuxing.png" /></h3>
				<div class="row row-bottom-padded-md">
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing1.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="http://news.163.com/15/1215/08/BAS4EO6300014Q4P.html">铺就农村孩子上学安全路</a></h3>
								
								<p>身处城市的我们，或许早已习惯了孩子上学车接车送，但部分农村孩子在上下学的路上却要争先恐后为抢坐“黑车”挤破头</p>
								<a href="http://news.163.com/15/1215/08/BAS4EO6300014Q4P.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
                    
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing2.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="http://news.163.com/15/0510/08/AP86GIFD00014JB5_4.html">乡村的低碳“马车婚礼”</a></h3>
								
								<p>浙江省桐乡市近年来积极推进美丽乡村建设，通过增加基础设施、生态保护、保障体系投入，为农民增收、改善村容村貌打实基础，实现“美丽乡村”可持续发展。</p>
								<a href="http://news.163.com/15/0510/08/AP86GIFD00014JB5_4.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing3.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="chuxing/chuxing-wenzhang/sx-chuxing3.html">骑上自行车</a></h3>
								
								<p>自行车作为交通工具，和走路比是一个历史性的飞跃。在70年代，自行车、缝纫机、手表被称作”三件宝“，如果结婚有这三件宝就会令人羡慕不已。</p>
								<a href="chuxing/chuxing-wenzhang/sx-chuxing3.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing4.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="http://mini.eastday.com/a/160428170152294.html">二十年前人们是这样出行的</a></h3>
								
								<p>随着经济的发展，农村的生活水平也越来越高，生活节奏也在变快。农村人出行的代步工具也发生了巨大的变化。</p>
								<a href="http://mini.eastday.com/a/160428170152294.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
				</div>
             </div>
             <div class="container">
				<div class="row row-bottom-padded-md">
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing5.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="chuxing/chuxing-wenzhang/sx-chuxing5.html">乡村巴士</a></h3>
								
								<p>我的童年是在农村度过的，所以小时候对公交车都没有什么印象。那个时候进城需要做公共汽车，就是后面带扶梯的那种中巴客车，</p>
								<a href="chuxing/chuxing-wenzhang/sx-chuxing5.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing6.png" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="chuxing/chuxing-wenzhang/sx-chuxing6.html">爱意满满的老牛</a></h3>
								
								<p>人缺水不行，牲畜也一样。终于有一天，一头一直被人们认为憨厚的老牛挣脱了缰绳，闯到沙漠里运水车必经的公路旁</p>
								<a href="chuxing/chuxing-wenzhang/sx-chuxing6.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing7.png" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="chuxing/chuxing-wenzhang/sx-chuxing7.html">我家有个拖拉机！</a></h3>
								
								<p>现在咱们农村是越来越有钱了，咱们农村人的钱包也越来越鼓了，不仅住上了洁白的二层小楼房，而且还买起了各种车。</p>
								<a href="chuxing/chuxing-wenzhang/sx-chuxing7.html" class="lead">了解更多</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
						<div class="blog-entry">
							<a href="#" class="blog-img"><img src="chuxing/images/sx-chuxing8.jpg" class="img-responsive" alt=""></a>
							<div class="desc">
								<h3><a href="https://baijiahao.baidu.com/po/feed/share?wfr=spider&for=pc&context=%7B%22sourceFrom%22%3A%22bjh%22%2C%22nid%22%3A%22news_3573331828192491144%22%7D">乡村人出行最该注意的三个问题</a></h3>
								
								<p>1.白不离岗，夜不离宿。2.安逸想着妻，富贵带着儿。3.亲近真善美，远离黄赌毒。</p>
								<a href="https://baijiahao.baidu.com/po/feed/share?wfr=spider&for=pc&context=%7B%22sourceFrom%22%3A%22bjh%22%2C%22nid%22%3A%22news_3573331828192491144%22%7D" class="lead">了解更多</a>
							</div>
						</div>
					</div>
                  </div>
				</div>
            
			</div>
             
             
             <div class="footer">
               <div class="container">
                   <h3 class="f-title"><img src="chuxing/images/jianyi.png" /></h3>
				<form action="Add_servlet" method="post">						
					 <div class="row">
                               <div class="col-md-12">
                                   <!--<label for="message"></label>-->
                                    <input type="hidden" name="user" value="${USER.id }">
                                   <input type="hidden" name="sort" value="出行">
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
<script src="chuxing/js/jquery.min.js"></script>
<script src="chuxing/js/bootstrap.min.js"></script>

</body>
</html>
