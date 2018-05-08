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
<title>新闻尽在我手</title>
<link rel="stylesheet" href="news/css/bootstrap.min.css">
<link rel="stylesheet" href="news/css/style.css">

</head>

<body>
<%
 
    String id=(String) request.getParameter("id") ;
    int ID=Integer.parseInt(id);
    NewsDAO.Count_News(ID);
    %>
	<%
 
    String Id=(String) request.getParameter("id") ;
    int iD=Integer.parseInt(Id);
    ArrayList<Comment> comment=CommentDAO.findALLCommentbyarticle(iD);//查询出改新闻的所有评论
	request.setAttribute("comment",comment);
	
    News news=NewsDAO.getNews(iD);//获取详细新闻信息
    if(news.getActive_id()!=0)
    {
    	 request.setAttribute("active","活动详情及报名");
    }
    request.setAttribute("news", news);
    %>
<header id="header" class="site-header">
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container ">
            <div class="navbar-header">
                <a href="#" class="navbar-brand logo"> <img src="news/images/L-LOGO-2.jpg" alt="忆美.鲁港镇"></a>
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
    <div class="container">
    
        <h2 class="tm-title">${news.title}</h2>                                           
                    <p class="tm-text">${news.content}</p>
                    <p class="tm-author">作者：${news.author}</p>
                    <p class="tm-author">时间：${news.datatime }</p>
                    <!--  <p class="tm-author"><a href="active.jsp?id=${news.active_id}">${active }</a></p>-->
     </div>
     <p style="text-align: center;"><a href="active.jsp?id=${news.active_id}">${active }<span class="glyphicon glyphicon-heart-empty"></span></a></p> 
     <div class="container">
         <div class="write">
          <h2 class="w-title">评论区</h2>
            
            <form id="text" action="Add_servlet" method="post" name="form1">
             <div class="row">
             
                  <div class="col-md-12 col">
                      <label for="name">评 论 :</label>
                      <input type="hidden" name="author" value="${USER.user}"> 
                      <input type="hidden" name="newsid" value="${news.id }"> 
                      <input type="hidden" name="beid" value="0">
                      <input type="hidden" name="Type" value="comment">
                      <input type="text" class="form-input" name="name" id="name">
                       <button type="submit">提交</button>
                  </div>
             </div>
        </form>
        <br><br><br>
         <c:forEach items="${comment}" var="bas">
            <ul id="pn">
          <li class="list0"> 
          <a style="font-size:18px;" class="close" href="javascript:;"><span class="glyphicon glyphicon-remove" ></span></a> 
        
          <div class="content">
            <p class="text"><span class="name">${bas.user_name }：</span>${bas.content }</p>            
            <!--<div class="pic"><img src="images/img1.jpg" alt=""/></div> -->
            <div class="good"><span class="date">${bas.datatime }</span><a class="dzan" href="good.jsp?id=${bas.id }&news_id=${bas.news_id}">赞</a></div> 
            <div class="people">${bas.goodnum }人觉得很赞</div> 
            <div class="comment-list"> 
                <div class="hf">
                     <form id="text" action="Add_servlet" method="post" name="form1">
                    <input type="hidden" name="author" value="${USER.user}"> 
                      <input type="hidden" name="newsid" value="${news.id }"> 
                      <input type="hidden" name="beid" value="${bas.id }">
                      <input type="hidden" name="Type" value="comment">
                      <textarea type="text" class="hf-text" name="name" autocomplete="off" maxlength="100">评论…</textarea>
                        <button class="hf-btn" type="submit">回复</button>
                       </form>
                    <span class="hf-nub">0/100</span> 
                </div> 
             </div> 
             </div>
        </li> 
</ul> 
  </c:forEach>       
         
         
         </div>
     </div>         
</div>   
   
                 
</div>    
<script src="news/js/jquery.min.js"></script>
<script src="news/js/bootstrap.min.js"></script>
<script type="text/javascript"> 
function addloadEvent(func){ var oldonload=window.onload; if(typeof window.onload !="function"){  window.onload=func; } else{  window.onload=function(){  if(oldonload){   oldonload();   }  func();  } } } addloadEvent(b); 
function b(){ var pn=document.getElementById("pn"); var lists=pn.children; //删除当前节点
 function remove(node){ node.parentNode.removeChild(node); } //上面的点赞 
 function praisebox(box,el){ //获取赞数量容器 
 var praise=box.getElementsByClassName("people")[0]; //获取容器当前total值
 var total=parseInt(praise.getAttribute("total")); //获取点击的innerHTML
 var txt=el.innerHTML; //创建一个新的total存储用
 var newtotal; //判断点击的文字内容
 if(txt=="赞"){ //total值+1 因为我还没点击赞，所以要点击的时候就多了一个人total+1 
 newtotal=total+1; //判断赞数量 把相应文字放到赞容器里
 praise.innerHTML=newtotal==1 ? "我觉得很赞" : "我和" + total +"个人觉得很赞"; el.innerHTML="取消赞"; } else{ //反之total值-1 
 newtotal=total-1; praise.innerHTML=newtotal==0 ? "" : newtotal +"个人觉得很赞"; el.innerHTML="赞"; } //更新total值
 praise.setAttribute("total",newtotal); //如果没有人点赞容器隐藏
 praise.style.display=(newtotal==0) ? "none" : "block"; } //回复评论
 function reply(box){ //获取评论框
 var textarea=box.getElementsByTagName("textarea")[0]; //获取包含所有评论的容器
 var comment=box.getElementsByClassName("comment-list")[0]; //创建新的评论div
 var div=document.createElement("div"); //赋类名
 div.className="comment"; //设置属性
 div.setAttribute("user","self"); //获取每条评论的innerHTML结构，每次只替换textarea的输入内容和 当前发送时间
 var html= '<div class="comment-right">'+  '<div class="comment-text"><span>我：</span>'+textarea.value+'</div>'+  '<div class="comment-date">'+  getTime()+  '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+  '<a class="comment-dele" href="javascript:;">删除</a>'+  '</div>'+  '</div>'; //插入到新建的评论div
 
 div.innerHTML=html; //把新评论插入到评论列表
 comment.appendChild(div); //评论后初始化textarea输入框
 textarea.value="评论…"; textarea.parentNode.className="hf"; } //获取当前时间回复评论时调用
 function getTime(){ var t=new Date(); var y=t.getFullYear(); var m=t.getMonth()+1; var d=t.getDate(); var h=t.getHours(); var mi=t.getMinutes(); m=m<10?"0"+m:m; d=d<10?"0"+d:d; h=h<10?"0"+h:h; mi=mi<10?"0"+mi:mi; return y+"-"+m+"-"+d+""+h+":"+mi; } //回复里点赞
 function praiseReply(el){ //获取当前total值 也就是所有点赞数量
 var total=parseInt(el.getAttribute("total")); //获取当前my值 我的点赞
 var my=parseInt(el.getAttribute("my")); //创建新的total 
 var newtotal; //判断my=0就是我准备要点赞
 if(my==0){ //我点了赞总数量就要+1
 newtotal=total+1; //更新total值
 el.setAttribute("total",newtotal); //更新my值
 el.setAttribute("my",1); //更新文字 就是我点了后 文字就是取消赞了
 el.innerHTML=newtotal+" 取消赞"; }else{ //反之-1
 newtotal=total-1; el.setAttribute("total",newtotal); el.setAttribute("my",0); el.innerHTML=(newtotal==0)?" 赞":newtotal+" 赞"; } } //操作回复
 function operateReply(el){ //每条评论
 var comment=el.parentNode.parentNode.parentNode; //整个状态
 var box=comment.parentNode.parentNode.parentNode; //评论框
 var textarea=box.getElementsByTagName("textarea")[0]; //名字
 var user=comment.getElementsByClassName("user")[0]; //点击的innerHTML
 var txt=el.innerHTML; //判断当前点击的是否为回复
 if(txt=="回复"){ //评论框触发焦点事件 也就是变高
 textarea.onfocus(); //内容变为回复+当前人的名字
 textarea.value="回复 "+user.innerHTML; //调用键盘事件
 textarea.onkeyup(); }else{ //否则就是删除节点
 remove(comment); } } //遍历所有状态消息
 for(var i=0;i<lists.length;i++){ //全部事件代理
 lists[i].onclick=function(e){ //获取当前点击事件
 var e=e||window.event; var el=e.srcElement; if(!el){ el=e.target;//兼容火狐
 } //判断点击的类名
 switch(el.className){ //关闭整个状态
   case "close": remove(el.parentNode); break; //上面的点赞
   case "dzan": praisebox(el.parentNode.parentNode.parentNode,el); break; //回复评论 
   case "hf-btn hf-btn-on": reply(el.parentNode.parentNode.parentNode); break; //每条评论中点赞 
   case "comment-zan": praiseReply(el); break; case "comment-dele": operateReply(el); 
	break; } } 
 var textarea=lists[i].getElementsByClassName("hf-text")[0]; //焦点事件
 textarea.onfocus=function(){ this.parentNode.className='hf hf-on'; this.value = this.value == '评论…' ? '' : this.value; } //失焦事件 
 textarea.onblur=function(){ if(this.value==''){ this.parentNode.className='hf'; this.value ='评论…';  }  } //键盘事件 
 textarea.onkeyup=function(){ var len=this.value.length; var textParentNode=this.parentNode; 
 var textBtn=textParentNode.children[1]; 
 var textNub=textParentNode.children[2]; 
 if(len==0){ 
 textBtn.className="hf-btn"; }
 else{ textBtn.className="hf-btn hf-btn-on";   } 
 textNub.innerHTML=len+"/100"; }
  } //遍历结束 
  } 
</script>
</body>
</html>
