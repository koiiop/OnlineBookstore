<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄金屋注册页面</title>
<script type="text/javascript">
var num;
function yan()
{
	var x;
	x=Math.round(Math.random()*900000);
	return x;
}
function qu()
{
	var y=f1.q.value;
	y=parseInt(y);
	if(y!=num) alert("验证码错误");
}
function reyan()
{
	var x;
	x=Math.round(Math.random()*900000);
	num=x;
	var v=document.getElementById("i");
	v.innerHTML=num;
}
function pass(z)
{
	if(z.value.length<8) alert("密码长度须不小于8");
}
function check(z)
{
	if(f1.password.value!=f1.mima.value) alert("两次密码不一致");
}

function checkid(x)
{
	var r=new RegExp(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/);	
	if(r.test(x.value)==false)
		{
		alert("身份证号码输入错误");
		x.focus();
		return;
		}
	else 
		{
		alert("您的身份证号码是："+x.value);
		return;
		}
}
function checkemail(y)
{
	var t=new RegExp(/^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?) *[a-z\d]+\.)+([a-z]{2,})+$/i);
	if(t.test(y.value)==false) 
		{
		alert("E-mail地址输入错误");
		y.focus();
		return;
		}
	else
		{
		alert("您的E-mail地址是："+y.value);
		return;
		}
}
function checkall()
{
	if(f1.username.value.length==0)
	{
		alert("用户名不能为空");
		return false;
	}
	else
		if(f1.user_id.value.length==0)
		{
			alert("身份证号码不能为空");
			return false;
		}
		else
			if(f1.password.value.length==0)
			{
				alert("密码不能为空");
				return false;
			}
			else
				if(f1.mima.value.length==0)
				{
					alert("确认密码不能为空");
					return false;
				}
				else
					if(f1.q.value.length==0)
					{
						alert("验证码不能为空");
						return false;
					}
			else return true;
}
</script>
</head>
<body>
<h1 align="center">注册</h1>
<form name="f1" onsubmit="return checkall()" action="zhuceservlet" method="post">
<table border="1"  align="center">
<tr><td>用户名<td colspan="3"><input type="text" name="username" style="width:100%"  autocomplete="off" >
<tr><td>密码<td colspan="3"><input type="password" name="password" style="width:100%"  autocomplete="off"  onblur="pass(this)">
<tr><td>确认密码<td colspan="3"><input type="password" name="mima" style="width:100%"  autocomplete="off"  onblur="check()">
<tr><td>身份证号码<td colspan="3"><input type="text" name="user_id" style="width:100%"  autocomplete="off"  onblur="checkid(this)">
<tr><td>E-mail<td colspan="3"><input type="text" name="email" style="width:100%"  autocomplete="off"  onblur="checkemail(this)">
<tr><td>联系方式<td colspan="3"><input type="text" name="phone" style="width:100%"  autocomplete="off" >
<tr><td>地址<td colspan="3"><input type="text" name="address" style="width:100%""  autocomplete="off" >
<tr><td>验证码<td><span id="i">
                  <script type="text/javascript">
                  num=yan();
                  document.write(num);
                  </script>
                  </span>
              <td><input type="text" name="q" onblur="qu()">
              <td><input type="button" name="b" value="看不清重新产生验证码"  onclick="reyan()">
<tr><td colspan="2"><input type="reset" name="r" value="重置" style="width:100%">
    <td colspan="1"><input type="hidden" name="isadmin" value="1" style="width:100%">
    <td colspan="1"><input type="submit" name="s" value="提交" style="width:100%">
</table>
</form>
<a href="login.html">返回</a>
</body>
</html>