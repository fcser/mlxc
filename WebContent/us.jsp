<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>关于我们</title>
   <script type="text/javascript" src="us/js/jquery-1.3.min.js"></script>
    <link rel="stylesheet" href="us/css/hero-slider-style.css">                              
    <!-- Hero slider style (https://codyhouse.co/gem/hero-slider/) -->
    <link rel="stylesheet" href="us/css/magnific-popup.css">                                 
    <!-- Magnific popup style (http://dimsemenov.com/plugins/magnific-popup/) -->
    <link rel="stylesheet" href="us/css/templatemo-style.css">                                   
    <style type="text/css">
    	p{text-indent: 2em;}
    </style>
    <link rel="stylesheet" href="us/css/bootstrap.min.css">
    <link rel="stylesheet" href="us/css/style.css">


</head>

    <body>
    	<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">  <!--width:200%; height:370%;   style="margin-top:-10px; width:100%;"--> 
                <a href="#" class="navbar-brand logo"> <img src="us/images/L-LOGO-1.jpg"  alt="忆美.红星"></a>
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
				   <li><a href="food.jsp"><span class="glyphicon glyphicon-cutlery" ></span> 美味的食物</a></li>
				   <li><a href="us.jsp"><span class="glyphicon glyphicon-heart" ></span> 关于我们</a></li>
				   <li class="active"><a href="introduce.jsp?id=${USER.id }"><span class="glyphicon glyphicon-user" ></span> ${personal }</a></li>
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




        
            

            <ul class="cd-hero-slider">  <!-- autoplay -->
                <li class="selected">
                    <div class="cd-full-width">
                        <div class="container-fluid js-tm-page-content tm-page-1" data-page-no="1">

                            <div class="cd-bg-video-wrapper" data-video="us/video/night-light-blur">
                                <!-- video element will be loaded using jQuery -->
                            </div> <!-- .cd-bg-video-wrapper -->
                            
                            <div class="row">
                            
                                <div class="col-xs-12">
                                    <div class="tm-2-col-container tm-bg-white-translucent">

                                        <div class="row">
                                            <div class="col-xs-4">
                                                <h2 class="tm-text-title">关于我们</h2>    
                                            </div>  
                                           
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12  col-lg-12 col-xl-12 tm-2-col-left">
                                                <div class="text-xs-left tm-textbox tm-2-col-textbox">  
                                             
                                                    <p class="tm-text">网站以位于安徽省芜湖市的一个小镇——鲁港镇为原型，以中国农村当代发展为基础、改革开放至今为背景，以时间变迁，描绘了村民们从物质到精神上的变化之美。</p>
                                                    <p class="tm-text">整个网站分为“美丽的房屋”、“便捷的交通”、“美味的食物”和“多彩的活动”四个板块，其中前两个板块呈现了“鲁港镇”在物质方面的美丽变迁，而后两个版块则展示了“鲁港镇”在精神方面更高的追求。</p> 
                                                </div>
                                            </div><br/>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-2-col-left">
                                                <div class="text-xs-left tm-textbox tm-2-col-textbox">
                                                    <p class="tm-text">网站通过原创漫画、视频、故事等多种形式的内容，让大家更加生动地了解“鲁港镇”几十年来的变化之美。同时我们还提供了多种互动功能：比如“我与乡村合个影”，您还可以上传自己想要分享的照片，和网站提供的背景一键合成新照片，“身临其境”体会“鲁港镇”的美丽。</p>
                                                    <p class="tm-text">除此之外，您可以在每个页面浏览 “鲁港镇”的热门文章、活动，实时关注新闻，如果您想参加村里的活动，也可以通过网站提交报名表，会一键提交相互信息；如果您对村里哪个商铺感兴趣，也可关注网站的打折信息、优惠活动，更可以一键购买。最最重要的是，如果您想分享自己身边的美事，美文，不仅可以回复别人的文章，还可以直接上传作品，通过审核后，就可以让别人感受你的快乐啦！</p>
                                                    <p class="tm-text">当然，我们更欢迎您提出关于网站各个方面的意见或是建议。</p>
                                                    <p class="tm-text">希望我们的网站能够让您产生共鸣，更多的发现乡村的美丽所在，体会时代的进步。希望我们共同携起手来，在党的领导下，共创更美乡村。</p>
                                                </div>          
                                            </div>
                                            
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div> <!-- .cd-full-width -->
                </li>
             </ul>          
                <li>
                     
        <!-- load JS files -->
        <script src="us/js/jquery-1.11.3.min.js"></script>         <!-- jQuery (https://jquery.com/download/) -->         
        <script src="us/js/hero-slider-main.js"></script>          <!-- Hero slider (https://codyhouse.co/gem/hero-slider/) -->
        <script src="us/js/masonry.pkgd.min.js"></script>          <!-- Masonry (http://masonry.desandro.com/) -->
        <script src="us/js/jquery.magnific-popup.min.js"></script> <!-- Magnific popup (http://dimsemenov.com/plugins/magnific-popup/) -->
        
        <script>

            function adjustHeightOfPage(pageNo) {

                var offset = 80;
                var pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .js-tm-page-content").height();

                if($(window).width() >= 992) { offset = 120; }
                else if($(window).width() < 480) { offset = 40; }
               
                // Get the page height
                var totalPageHeight = 15 + $('.cd-slider-nav').height()
                                        + pageContentHeight + offset
                                        + $('.tm-footer').height();

                // Adjust layout based on page height and window height
                if(totalPageHeight > $(window).height()) 
                {
                    $('.cd-hero-slider').addClass('small-screen');
                    $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", totalPageHeight + "px");
                }
                else 
                {
                    $('.cd-hero-slider').removeClass('small-screen');
                    $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", "100%");
                }
            }

            /*
                Everything is loaded including images.
            */
            $(window).load(function(){

                adjustHeightOfPage(1); // Adjust page height

                /* Gallery One pop up
                -----------------------------------------*/
                $('.gallery-one').magnificPopup({
                    delegate: 'a', // child items selector, by clicking on it popup will open
                    type: 'image',
                    gallery:{enabled:true}                
                });
				
				/* Gallery Two pop up
                -----------------------------------------*/
				$('.gallery-two').magnificPopup({
                    delegate: 'a',
                    type: 'image',
                    gallery:{enabled:true}                
                });

                /* Collapse menu after click 
                -----------------------------------------*/
                $('#tmNavbar a').click(function(){
                    $('#tmNavbar').collapse('hide');

                    adjustHeightOfPage($(this).data("no")); // Adjust page height       
                });

                /* Browser resized 
                -----------------------------------------*/
                $( window ).resize(function() {
                    var currentPageNo = $(".cd-hero-slider li.selected .js-tm-page-content").data("page-no");
                    
                    // wait 3 seconds
                    setTimeout(function() {
                        adjustHeightOfPage( currentPageNo );
                    }, 1000);
                    
                });
        
                // Remove preloader (https://ihatetomatoes.net/create-custom-preloading-screen/)
                $('body').addClass('loaded');
                           
            });

           
        
          

        </script>
        

</body>
</html>
