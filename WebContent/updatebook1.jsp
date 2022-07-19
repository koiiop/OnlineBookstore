<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书信息</title>
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
<h1 align="center">修改图书信息</h1>
<p align="center">
<form name="book" onsubmit="return yanzheng()" action="updatebook.jsp" method="post">
<table width="600" border="1" align="center">
<tr><td>书号：<td><input type="text" name="bno" size="40" autocomplete="off">
<tr><td>书名：<td><input type="text" name="bname" size="40" autocomplete="off">
<tr><td>作者：<td><input type="text" name="author" size="40" autocomplete="off">
<tr><td>单价：<td><input type="text" name="price" size="40" value="0">元
<tr><td>出版社：<td><input type="text" name="publish" size="40" autocomplete="off">
<tr><td>出版年：<td><select name="year"> 年
                    <script>
                      var i;
                      for(i=1960;i<=2019;i++)
                    	  document.write("<option value="+i+">"+i+"</option>");
                    </script>
                    </select>
<tr><td>所属类别：<td><input type="text" name="classic" size="40" autocomplete="off">
<tr><td>库存数量：<td><input type="text" name="number" size="40" value="0">本
<tr><td colspan="2" align="center"><input type="submit" value="修改" ><input type="reset" value="重置">                    
</table>
</form>
<a href="admin.jsp">返回</a>
</p>
</body>
</html>