<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除图书</title>
<script>
  function  yanzheng()
  {
	  var i;
	  i=book.bno.value;
	  if(i.length==0)
		  {
		  alert("书号不能为空");
		  return false;
		  }
  }
</script>
</head>
<body>
<h1 align="center">删除图书</h1>
<p align="center">
<form name="book" onsubmit="return yanzheng()" action="delbook.jsp" method="post">
<table width="600" border="1" align="center">
<tr><td>书号：<td><input type="text" name="bno" size="40" autocomplete="off">
<tr><td colspan="2" align="center"><input type="submit" value="删除" ><input type="reset" value="重置">                    
</table>
</form>
<a href="admin.jsp">返回</a>
</p>
</body>
</html>