<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书信息</title>
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
//int bNumber=Integer.parseInt(bnumber);
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
int n=0;                                                    //      ,to_date('"+dateTime+"','yyyy-MM-dd HH:mi:ss')
String sql="update book set bname='"+bname+"',author='"+author+"',publish='"+publish+"',year='"+year+"',Price='"+Price+"',classic='"+classic+"',number='"+number+"' where bno='"+bno+"' ";
//String sql="insert into book values('"+bno+"','"+bname+"','"+bauthor+"','"+bpublish+"','"+bPrice+"',to_date('"+bdate+"','yyyy-mm-dd HH:mi:ss'),'"+bNum+"')";
//String sql="insert into book (bookname,author,publish,price,bnum) values('"+bname+"','"+bauthor+"','"+bpublish+"','"+bPrice+"','"+bNum+"')";
String sq="select * from book";
rs=smt.executeQuery(sq);
int flag=0;
while(rs.next())
{
	if(rs.getString(1).equals(bno))
	{
		flag=1;
		break;
	}
}
if(flag==1)
{
    n=smt.executeUpdate(sql);
    if(n==1) out.print("修改图书信息成功<br>");
    else out.print("修改图书信息失败<br>");
}
else
{
	out.print("修改图书信息失败，书号不存在<br>");
}
smt.close();
conn.close();
rs.close();
%>
<a href="admin.jsp">返回</a>
</body>
</html>