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
String bno=request.getParameter("bno");
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
int n=0;                                                    //      ,to_date('"+dateTime+"','yyyy-MM-dd HH:mi:ss')
String sql="delete from book where bno='"+bno+"'";
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
    if(n==1) out.print("删除图书成功<br>");
    else out.print("删除图书失败<br>");
}
else
{
	out.print("删除图书失败，书号不存在<br>");
}
smt.close();
conn.close();
rs.close();
%>
<a href="admin.jsp">返回</a>
</body>
</html>