<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>黄金屋</title>

<script src="jquery-3.4.1.min.js">
</script>

<style type="text/css">
    #lunbo ul li{width:100%;list-style: none;width:640px; height:250px;text-align: center;}
    #lunbo ul li:not(:first-child){display: none;}
</style>

<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<!-- 底部样式 -->
<link rel="stylesheet" type="text/css" href="css/foot.css">

<style type="text/css">
.container {
	/* max-width: 1024px; */
	width: 100%;
	margin: 0 auto;
	padding: 0px;
	font-size: 14px;
}

.preview {
	text-align: center;
	padding: 5px;
}

.preview a {
	display: inline-block;
	margin: 5px;
}

.preview img {
	display: block;
	width: 100%;
	height: auto;
}

.active {
	outline: 3px solid #196cd2;
	box-shadow: 2px 2px 20px 4px rgba(0, 0, 0, .5);
}
.menu ul{
	margin-top: 0px;
	margin-bottom: 0px;
}
.menu ul li{
	margin-top: 5px;
}
</style>
</head>

<body>
<div class="head">
     <div class="menu">
		<ul>
		<li>
		    <div class="div2">
			位置：<select name="location">
                     <option value="China" selected>中国</option>
                     <option value="America">美国</option>
                     <option value="England">英国</option>
                     <option value="German">德国</option>
                     <option value="Japan">日本</option>
                     <option value="Russia">俄罗斯</option>
                     <option value="Italy">意大利</option>
                  </select>
			</div>
		</li>
		<li>
			<div class="div3">
			<img src="img/head.png" style="height: 20px; width: 20px; ">
			</div>
			<div class="div2">
			<a href="login.html">请登录</a>
		    <a href="zhuce.jsp">免费注册</a>
			</div>
		</li>
		<li>
			<div class="div3" style="border:0px;">
			<img src="img/head.png" style="height: 20px; width: 20px; ">
			</div>
			<div class="div2">
			<a href="price.jsp">我的账户</a>
			</div>
		</li>
		<li>
			<div class="div3">
			<img src="img/11.png" style="height: 20px; width: 20px; ">
			</div>
			<div class="div2">
			<a href="cart.jsp">购物车</a>
			</div>
		</li>
		<li>
			<div class="div2">
			欢迎！
			</div>
		</li>
		</ul>
	</div>
</div>
	
<form action="sousu.jsp" method="post">
<div style="height:50px;width:50%;font-family:隶书;font-size:26px;float:left">
   <div align="center">
     黄金屋<br>
   huangjinwu.com
   </div>
</div>
<div style="height:50px;width:50%;font-family:隶书;font-size:26px;float:right">
<input type="textarea" name="search" autocomplete="off" valign="center"><input type="submit" name="b1" value="搜索">
</div>
</form>
	
<!-- 分类信息 -->
<div class="htmleaf-container">
	<nav>
	<ul id="main" style=" width: 1200px;">
	<li>网站主页</li>
	<li>书籍分类
		<ul class="drop" style="width: 400px;">
		<div>
		<li>						
		<span class="span1">
		<a href="#" class="a1" >儿童/育儿</a>
		</span>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="span2">
		<a href="#" class="a1">儿童文学</a>
	    </span>
		<span class="span2">
		<a href="#" class="a1">绘本</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">启蒙书</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">科普读物</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">启蒙认知</a>
		</span>
		</li>
						
		<li>
		<span class="span1">
		<a href="#" class="a1" >考试/教辅</a>
		</span>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="span2">
		<a href="#" class="a1">考研</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">公务员</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">外语考试</a>
		</span>
        <span class="spn2">
		<a href="#" class="a1">中小学教辅</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">外文读物</a>
		</span>
		</li>
					
		<li>
		<span class="span1">
		<a href="#" class="a1" >生活/社科</a>
		</span>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="span2">
		<a href="#" class="a1">美容</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">境外游</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">两性情感</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">居家</a>
		</span>
		<span class="span2">
		<a href="#" class="a1">社科</a>
		</span>
		</li>
						
		</div>
		</ul>
	</li>
	<div id="marker"></div>
	</ul>
	</nav>
</div>
	

<div id="lunbo">
    <ul>
        <li>
        <img src="images/0000.jpeg" alt="" style="height: 300px;"> <br>
		<span>书中自有颜如玉，书中自有黄金屋</span>
        </li>
        <li>
        <img src="images/0001.jpeg" alt="" style="height: 300px;"> <br>
		<span>书是人类进步的阶梯</span>
        </li>
        <li>
        <img src="images/3.jpg" alt="" style="height: 300px;"> <br>
		<span>朝闻道，夕可死矣</span>
        </li>
    </ul>
</div>
<script type="text/javascript">
    //因为使用了document，所以js需要放在需要执行的代码下面生效才能生效
    var li=document.getElementById('lunbo').getElementsByTagName("li");
    var num=0;
    var len=li.length;

    setInterval(function(){
        li[num].style.display="none";
        num=++num==len?0:num;
        li[num].style.display="inline-block";

    },6000);//切换时间
</script>

<table align="center">
<tr><td colspan="3">
<h1 style="font-family:隶书">新书上架<a href="#">>></a></h1>
<tr>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/001.jpg" height="300px"><br>
<input type="submit" name="bname" value="《皮囊》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/002.jpg" height="300px"><br>
<input type="submit" name="bname" value="《你当像鸟飞往你的山》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/003.jpg" height="300px"><br>
<input type="submit" name="bname" value="《庆余年》" style="background:pink"> 
</form>

<tr><td colspan="3">
<h1 style="font-family:隶书">人气书籍<a href="#">>></a></h1>
<tr>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/101.jpg" height="300px"><br>
<input type="submit" name="bname" value="《万般滋味，都是生活》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/102.jpg" height="300px"><br>
<input type="submit" name="bname" value="《月亮与六便士》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/103.jpg" height="300px"><br>
<input type="submit" name="bname" value="《红楼梦》" style="background:pink"> 
</form>


<tr><td colspan="3">
<h1 style="font-family:隶书">猜你喜欢<a href="#">>></a></h1>
<tr>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/201.jpg" height="300px"><br>
<input type="submit" name="bname" value="《人间词话》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/202.jpg" height="300px"><br>
<input type="submit" name="bname" value="《父与子全集》" style="background:pink"> 
</form>
<td align="center">
<form action="show.jsp" method="post">
<img src="images/203.jpg" height="300px"><br>
<input type="submit" name="bname" value="《活着》" style="background:pink"> 
</form>
</table>

</body>
</html>