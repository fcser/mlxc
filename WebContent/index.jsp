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
<title>我的村庄</title>
<link rel="stylesheet" href="index/css/bootstrap.min.css">
<link rel="stylesheet" href="index/css/style.css">

</head>

<body>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">  <!--width:200%; height:370%;   style="margin-top:-10px; width:100%;"--> 
                <a href="#" class="navbar-brand logo"> <img src="index/images/L-LOGO-1.jpg"  alt="忆美.红星"></a>
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
                   <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> 我的村庄</a></li>
                   <li><a href="home.jsp"><span class="glyphicon glyphicon-globe" ></span> 美丽的房屋</a></li>
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



<!--轮播图-->
    <div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
           <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
           <li data-target="#myCarousel" data-slide-to="1"></li>
           <li data-target="#myCarousel" data-slide-to="2"></li>
           <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active"><a href="#"><img src="index/images/slides/slide1.jpg" alt="第一张"></a>
                <div class="carousel-caption">
                    <h2> 黑瓦白墙，小河绿植，把南方水乡的刚毅和柔美<br>
					    体现的淋漓尽致……
                    </h2>
                </div>
            </div>
            <div class="item"><a href="#"><img src="index/images/slides/slide2.jpg" alt="第二张"></a>
                <div class="carousel-caption">
                    <h2> 在外辛苦打拼许久的农民工终于可以坐上归家的列车<br>
					    和亲人一起过个好年了……
                    </h2>
                </div>   
            </div>
            <div class="item"><a href="#"><img src="index/images/slides/slide3.jpg" alt="第三张"></a>
                <div class="carousel-caption">
                    <h2>  村里的孩子们也有条件有场地，酣畅淋漓的踢一场的足球了<br>
					   一直以来的小愿望终于实现了……
                    </h2>
                </div>   
            </div>
            <div class="item"><a href="#"><img src="index/images/slides/slide4.jpg" alt="第四张"></a>
               <div class="carousel-caption">
                    <h2> 村民们再也不用羡慕城里东西种类齐全的超市了<br>
					    在家也可以吃到饭店里的大餐……
                    </h2>
                </div>   
            </div>
        </div>
        <a href="#myCarousel" data-slide="prev" class="carousel-control left"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a href="#myCarousel" data-slide="next" class="carousel-control right"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
    
    <div class="tab1">
        <div class="container">
        <div class="row">
		    <div class="col-md-12">
			<h2 class="tab-h2"><img src="index/images/xiangkan.png" /></h2>
            <!--<button class="btn tab1-btn"><a href="#">查看所有</a></button>-->
            <hr/>
		    </div>
		</div>
		<%
	ArrayList<News> NEW=NewsDAO.findALLNewsbyrank();
	request.setAttribute("NEW", NEW);
	
	ArrayList<Article> article=ArticleDAO.findALLpassArticlebyrank();
	request.setAttribute("article", article);
	
	ArrayList<Document> document=DocumentDAO.findALLDocumentbyrank();
	request.setAttribute("document", document);
	
	ArrayList<News> news=NewsDAO.findALLNewsbytime();
	request.setAttribute("news", news);
	
	ArrayList<Article> Article=ArticleDAO.findALLArticlebytime(1);
	request.setAttribute("Article", Article);
	
	ArrayList<Document> Document=DocumentDAO.findALLDocumentbytime();
	request.setAttribute("Document", Document);
        %>
        <div class="row">
            <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-eye-open"></span></a>
                    </div>
                    <c:forEach items="${article}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h4 class="media-heading">一周精选</h4>
                        <p>${bas.title }</p>
                        <p>${bas.intro }</p>
                        <div class="m1"><a href="article.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                    </c:forEach>
                </div>
              </div>
               <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-align-right"></span></a>
                    </div>
                    <c:forEach items="${NEW}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h4 class="media-heading">一周精选</h4>                      
			            <p>${bas.title }</p>
			            <p>${bas.intro }</p>			    
                        <div class="m1"><a href="news.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                       </c:forEach>
                </div>
              </div>
               <div class="col-md-4 col">
                <div class="media">
                    <div class="media-left">
                        <a href="#"><span class="glyphicon glyphicon-tags"></span></a>
                    </div>
                       <c:forEach items="${document}" var="bas" begin="0" end="0">
                    <div class="media-boday">
                        <h4 class="media-heading">一周精选</h4>              
			            <p>${bas.title }</p>
			            <p>${bas.intro }</p>
                        <div class="m1"><a href="document.jsp?id=${bas.id }">了解更多</a></div>
                    </div>
                    </c:forEach>
                </div>
              </div>
        
        </div>
        </div>
    </div>
    
    
    <div class="tab2">        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="tab2-h2"><img src="index/images/xinxianchulu.png"/></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-2">
                <c:forEach items="${Article}" var="bas" begin="0" end="2">
                            <li><a href="article.jsp?id=${bas.id }">${bas.title }</a></li>
                            </c:forEach>
                </div>
                <div class="col-md-6 col-2">                  
			                <c:forEach items="${Document}" var="bas" begin="0" end="2">
                            <li><a href="document.jsp?id=${bas.id }">${bas.title }</a></li>
                            </c:forEach>
			     </div>
            </div>
        </div>
    </div>
    <div id="banner" class="banner">
	    <div class="container">
		<!--<div class="row">
		    <div class="col-md-12">
			<h2 class="s-title">红 星 一 览</h2>
		    </div>
		</div>-->
		<!--<div class="row">
		    <div class="col-md-12">
			<ul id="s-mean" class="nav navbar-nav navbar-right">
			    <li class="current"><a href="#" data-filter="*">所有</a></li>
			    <li class=""><a href="#zhuzhai">美丽的房屋</a></li>
			    <li class=""><a href="#chuxing">便捷的交通</a></li>
			    <li class=""><a href="#yundong">多彩的活动</a></li>
			    <li class=""><a href="#meishi">美味的食物</a></li>
			</ul>
		    </div>      
     </div>-->
     </div>
     <div data-target="#s-mean" data-offset="-50" data-spy="scroll" style="padding:0 10px; overflow:auto; position:relative;">
        
        <div class="s-part">
            <div class="s-part0">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 id="chuxing" class="b-title"><img src="index/images/heying.png"/></h2>
                        </div>
                    </div>
                    <div class="row">
                       <div class="col-md-3 partner-logo0">
                            <div class="img">
                                <img src="index/images/sx-chuxing1.jpg" style="width:100%;">
                            </div>
                       </div>
                       <div class="col-md-3 partner-logo0">
                            <div class="img">
                                <img src="index/images/sx-chuxing2.jpg">
                            </div>
                       </div>
                       <div class="col-md-3 partner-logo0">
                            <div class="img">
                                <img src="index/images/sx-chuxing3.jpg">
                            </div>
                       </div>
                       <div class="col-md-3 partner-logo0">
                            <div class="img">
                                <img src="index/images/sx-chuxing4.jpg">
                            </div>
                       </div>
                       
                    </div>
               
                    <form action="UploadHandleServlet" enctype="multipart/form-data" method="post" name="form0" id="form0"  >
                     <div class="row">
                         <div class="col-md-8 sh-2">
                              <input type="file" name="file0" id="file0" multiple /><br>
                         </div>
                         <div class="col-md-2 sh-2">
                             <div class="dropdown">
                                  <!--<button class="btn  btn-primary" data-toggle="dropdown" style="background:#e04d47; border:1px solid #e04d47; ">选择合照的照片<span class="caret"></span></button>
                                      <ul class="dropdown-menu">
                                  <li><a href="#"><img src="index/images/sx-timg(1).jpg"></a></li>
                                  <li><a href="#"><img src="index/images/sx-timg(2).jpg"></a></li>
                                  <li><a href="#"><img src="index/images/sx-timg(3).jpg"></a></li>
                              </ul> -->
                              <select name="sort" class="btn  btn-primary" data-toggle="dropdown">
									<option value="a">村中小路</option>
									<option value="b">山里人家</option>
									<option value="c">小桥流水</option>
								</select>
                            </div>
                         </div>
                         <div class="col-md-2 sh-2">
                             <a href="#"><button class="btn btn-primary" style="background:#e04d47; border:1px solid #e04d47; ">上传</button></a>
                         </div>
                   </div>                       
                  
                   </form>
            
                </div>
            </div>
      
        
           <div class="s-part1">
              <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="zhuzhai" class="b-title"><img src="index/images/title1.png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-4 partner-logo1">
			              <a href="index/zhuzhai-wenzhang/sx-zhuzhai1.html"><img data-toggle="tooltip" title="茅 草 屋" src="index/images/sx-zhuzhai1.jpg" alt=""></a>
                          <p class="introduce">茅 草 屋</p>
			          </div>
			          <div class="col-md-4 partner-logo1">
			              <img data-toggle="tooltip" title="砖 瓦 房" src="index/images/sx-zhuzhai2.jpg" alt="">
                          <a href="index/zhuzhai-wenzhang/sx-zhuzhai4.html"><p class="introduce">砖 瓦 房</p></a>
			          </div>
			          <div class="col-md-4 partner-logo1">
			             <a href="index/zhuzhai-wenzhang/sx-zhuzhai6.html"><img data-toggle="tooltip" title="钢 筋 水 泥  房" src="index/images/sx-zhuzhai3.jpg" alt=""></a>
                         <p class="introduce">钢 筋 水 泥 房</p>
		              </div>
                     <!-- <div class="col-md-3 partner-logo1">/
                         <p class="introduce">白墙黑瓦</p>
		              </div>-->
	               </div>		 
                </div>
            </div>
          <div class="s-part2">
              <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="chuxing" class="b-title"><img src="index/images/jiaotong (1).png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-3 partner-logo2">
                         <div class="ih-item">   
                              <a href="index/chuxing-wenzhang/sx-chuxing5.html">
                                  <div class="img"><img src="index/images/sx-chuxing5.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>用于载运乘客及其随身行李的商用车，这类车型主要用于公共交通和团体运输使用。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>农村客车</h4>
			                    <h6>方便村里人进城</h6> 
                           </div>                          
                       </div>
                       
                        <div class="col-md-3 partner-logo2">
                         <div class="ih-item">   
                              <a href="index/chuxing-wenzhang/sx-chuxing3.html">
                                  <div class="img"><img src="index/images/sx-chuxing2.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                      <p>可以作为环保的交通工具用来代步、出行；越来越多的人将自行车作为健身器材用来骑行锻炼、自行车出游</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>自行车</h4>
			                    <h6>购物上班的好帮手</h6> 
                           </div>                          
                       </div>
                        <div class="col-md-3 partner-logo2">
                         <div class="ih-item">   
                              <a href="https://baijiahao.baidu.com/po/feed/share?wfr=spider&for=pc&context=%7B%22sourceFrom%22%3A%22bjh%22%2C%22nid%22%3A%22news_3573331828192491144%22%7D">
                                  <div class="img"><img src="index/images/sx-chuxing3.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>在如今讲究效率和时间就是金钱的时代，交通的便捷给人类带来的益处是巨大的，减少了不必要的赶路时间。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>小汽车</h4>
			                    <h6>小康家庭的体现</h6> 
                           </div>                          
                       </div>
                        <div class="col-md-3 partner-logo2">
                         <div class="ih-item">   
                              <a href="http://mini.eastday.com/a/160428170152294.html">
                                  <div class="img"><img src="index/images/sx-chuxing4.jpg" alt="img"></div> <!-- //图片-->
                                      <div class="info">     <!--  //提示文字-->
                                       <p>火车以比较低廉的价格（相对其他交通方式）而且相对安全的方式节省了人们出行的时间。</p>
                                      </div>
                               </a>
                           </div>
                           <div>
                                <h4>火车</h4>
			                    <h6>出远门最实惠的选择</h6> 
                           </div>                          
                       </div>
                  </div>                
             </div>
           </div>
           
           <div class="s-part3">
                 <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="yudong" class="b-title"><img src="index/images/title3.png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-4 partner-logo3">
			              <a href="index/yundong-wenzhang/sx-yungdong1.html"><img data-toggle="tooltip" title="公共设施" src="index/images/sx-yundong1.jpg" alt=""></a>
                          <p class="introduce">公共设施</p>
			          </div>
			          <div class="col-md-4 partner-logo3">
			              <a href="index/yundong-wenzhang/sx-yungdong2.html"><img data-toggle="tooltip" title="运动会" src="index/images/sx-yundong2.png" alt=""></a>
                          <p class="introduce">运动会</p>
			          </div>
			          <div class="col-md-4 partner-logo3">
			             <a href="index/yundong-wenzhang/sx-yungdong3.html"><img data-toggle="tooltip" title="广场舞" src="index/images/sx-yundong3.jpg" alt=""></a>
                         <p class="introduce">广场舞</p>
		              </div>
                      <!--<div class="col-md-3 partner-logo3">
			             <img data-toggle="tooltip" title="白墙黑瓦" src="images/住宅3.jpg" alt="">
                         <p class="introduce">白墙黑瓦</p>
		              </div>-->
                  </div>
                </div>
          </div>
          
          <div class="s-part4">
              <div class="container">
                 <div class="row">
                   <div class="col-md-12">
                       <h2 id="meishi" class="b-title"><img src="index/images/title2.png" /></h2>
                   </div>                 
                 </div>
                  <div class="row ">
			          <div class="col-md-3 partner-logo4">
                         <div class="ih-item">   
                              <a href="index/meishi-wenzhang/sx-meishi1.html">
                                  <div class="img"><img src="index/images/sx-meishi1.jpg" alt="img"></div> <!-- //图片-->
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
                              <a href="index/meishi-wenzhang/sx-meishi2.html">
                                  <div class="img"><img src="index/images/sx-meishi2.jpg" alt="img"></div> <!-- //图片-->
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
                              <a href="index/meishi-wenzhang/sx-meishi3.html">
                                  <div class="img"><img src="index/images/sx-meishi3.jpg" alt="img"></div> <!-- //图片-->
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
                              <a href="index/meishi-wenzhang/sx-meishi4.html">
                                  <div class="img"><img src="index/images/sx-meishi4.jpg" alt="img"></div> <!-- //图片-->
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
        
        <div id="footer" class="footer">
            <div class="container">
              <div class="row">
                  <div class="col-md-12">
                    <h2 class="f-title"><img src="index/images/chuangzuo.png" /></h2>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-6 f-col"> 
                      <form id="text" action="Add_servlet" method="post"
						name="form1">
						<div class="row">
							<div class="col-md-12">
								<label for="name">标题</label> <input type="text"
									class="form-input" name="title" id="name">
							</div>
							<div class="col-md-12">
								<label for="email">文章类型</label> <select name="sort">
									<option value="住宅">住宅</option>
									<option value="出行">出行</option>
									<option value="运动">运动</option>
									<option value="美食">美食</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label for="message">正文</label>
								<textarea rows="6" id="message" name="content" class="form-input"></textarea>
								<input type="hidden" name="Type" value="article"> <input
									type="hidden" name="sourse" value="sy"> <input
									type="hidden" name="author" value="${USER.user}"> <input
									type="hidden" name="intro" value=""> <input
									type="hidden" name="havepass" value=0>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								  <button class="main-button" type="submit">提交</button>
								  ${msg }
							</div>
							
						</div>
					</form>                   
                  </div>
                  <div class="col-md-6 f-col">
                            <h2>忆美·红星  欢迎小伙伴们说出自己的想法</h2>
                            <ul><h3>
                               <li>❤ 在这里，你可以介绍自己美丽的家乡</li>
                               <li>❤ 在这里，你可以分享自己家乡的发展之路</li>
                               <li>❤ 在这里，你可以说出身边有趣的乡村故事</li>
                               <li>❤ 在这里，你可以表达所有的你想表达的正能量，真性情</li>
			                </ul></h3>
      	          </div>
              </div>                
            </div>        
        </div>
<script src="index/js/jquery.min.js"></script>
<script src="index/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function(){
	   $('#myCarousel').carousel({
		   intervel:3000,
		   });
	   })
	   

$("#file0").change(function(){
    var objUrl = getObjectURL(this.files[0]) ;
    console.log("objUrl = "+objUrl) ;
    if (objUrl) {
        $("#img0").attr("src", objUrl) ;
    }
}) ;
//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null ; 
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}


	   
	   
</script>
</body>
</html>
