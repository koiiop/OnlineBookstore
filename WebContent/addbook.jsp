<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String bno=request.getParameter("bno");
String bname=request.getParameter("bname");
String author=request.getParameter("author");
String publish=request.getParameter("publish");
String price=request.getParameter("price");
double Price=Double.parseDouble(price);
String year=request.getParameter("year");
//String bmonth=request.getParameter("month");
//String bday=request.getParameter("day");
//String bdate=byear+"-"+bmonth+"-"+bday;
String classic=request.getParameter("classic");
String number=request.getParameter("number");
int Number=Integer.parseInt(number);
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
int n=0;                                                    //      ,to_date('"+dateTime+"','yyyy-MM-dd HH:mi:ss')
String sql="insert into book values('"+bno+"','"+bname+"','"+author+"','"+publish+"','"+year+"','"+Price+"','"+classic+"','"+Number+"')";
//String sql="insert into book values('"+bno+"','"+bname+"','"+bauthor+"','"+bpublish+"','"+bPrice+"',to_date('"+bdate+"','yyyy-mm-dd HH:mi:ss'),'"+bNum+"')";
//String sql="insert into book (bookname,author,publish,price,bnum) values('"+bname+"','"+bauthor+"','"+bpublish+"','"+bPrice+"','"+bNum+"')";
String sq="select * from book";
rs=smt.executeQuery(sq);
int flag=1;
while(rs.next())
{
	if(rs.getString(1).equals(bno))
	{
		flag=0;
		break;
	}
}
if(flag==1)
{
    n=smt.executeUpdate(sql);
    if(n==1) out.print("添加图书成功<br>");
    else out.print("添加图书失败<br>");
}
else
{
	out.print("添加图书失败，书号冲突<br>");
}
smt.close();
conn.close();
rs.close();
%>
<a href="admin.jsp">返回</a>
</body>
</html>