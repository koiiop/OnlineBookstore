<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String search=request.getParameter("search");
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
String sql="select * from book";
rs=smt.executeQuery(sql);
out.print("搜素的图书信息如下：<br>");
int n=0;
while(rs.next())
{
	if(rs.getString(2).equals(search))
	{
		
		  n=1;
	      out.print("书号："+rs.getString(1)+"<br>");
	      out.print("书名："+rs.getString(2)+"<br>");
	      out.print("作者："+rs.getString(3)+"<br>");
	      out.print("出版社："+rs.getString(4)+"<br>");
	      out.print("出版年份："+rs.getString(5)+"<br>");
	      out.print("单价："+rs.getString(6)+"<br>");
	      out.print("类别："+rs.getString(7)+"<br>");
	      
	}
	else
		if(rs.getString(3).equals(search))
		{
			
			  n=1;
		      out.print("书号："+rs.getString(1)+"<br>");
		      out.print("书名："+rs.getString(2)+"<br>");
		      out.print("作者："+rs.getString(3)+"<br>");
		      out.print("出版社："+rs.getString(4)+"<br>");
		      out.print("出版年份："+rs.getString(5)+"<br>");
		      out.print("单价："+rs.getString(6)+"<br>");
		      out.print("类别："+rs.getString(7)+"<br>");
		      
		}
		else
			if(rs.getString(1).equals(search))
			{
				
				  n=1;
			      out.print("书号："+rs.getString(1)+"<br>");
			      out.print("书名："+rs.getString(2)+"<br>");
			      out.print("作者："+rs.getString(3)+"<br>");
			      out.print("出版社："+rs.getString(4)+"<br>");
			      out.print("出版年份："+rs.getString(5)+"<br>");
			      out.print("单价："+rs.getString(6)+"<br>");
			      out.print("类别："+rs.getString(7)+"<br>");
			      
			}
		
}
if(n==0) out.print("没有找到本书<br>");
smt.close();
conn.close();
rs.close();
%>
<a href="mainpage.jsp">返回</a>
</body>
</html>