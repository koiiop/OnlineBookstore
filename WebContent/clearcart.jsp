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
String count=request.getParameter("count");
int Count=Integer.parseInt(count);
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();                                                   //      ,to_date('"+dateTime+"','yyyy-MM-dd HH:mi:ss')
String sq="select * from item";
rs=smt.executeQuery(sq);
while(rs.next())
{
	int n=0; 
	String sql="delete from item where bno='"+rs.getString(1)+"'";
	n=smt.executeUpdate(sql);
	if(n==1) 
		{
		  String sq3="update book set number=number+'"+Count+"' where bno='"+rs.getString(1)+"'";
    	  int x=0;
    	  x=smt.executeUpdate(sq3);
    	  if(x==1) out.print("更改库存信息成功<br>");
    	  else out.print("更改库存信息失败<br>");
		 out.print("清空购物车成功<br>");
        }
	else out.print("清空购物车失败<br>");
}
smt.close();
conn.close();
rs.close();
%>
<a href="cart.jsp">返回</a>
</body>
</html>