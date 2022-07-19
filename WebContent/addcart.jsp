<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String bno=(String)session.getAttribute("bno");
String bname=(String)session.getAttribute("bname");
String price=(String)session.getAttribute("price");
double Price=Double.parseDouble(price);
String count=request.getParameter("count");
int Count=Integer.parseInt(count);
Connection conn=null;
Statement smt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
int n=0;                                                    
String sql="insert into item values('"+bno+"','"+bname+"','"+Price+"','"+Count+"')";
String sq="select * from item";
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
	out.print("第一次添加该商品到购物车<br>");
    n=smt.executeUpdate(sql);
    if(n==1)
    {  
    	String sq3="update book set number=number-'"+Count+"' where bno='"+bno+"' ";
    	int x=0;
    	x=smt.executeUpdate(sq3);
    	if(x==1) out.print("更改库存信息成功<br>");
    	else out.print("更改库存信息失败<br>");
    	out.print("添加商品到购物车成功<br>");
    }
    else out.print("添加商品到购物车失败<br>");
}
else
{
	out.print("已有同种商品在购物车<br>");
	String sq2="update item set count=count+'"+Count+"' where bno='"+bno+"' ";
	int m=0;
	m=smt.executeUpdate(sq2);
	if(m==1) 
	{
		String sq3="update book set number=number-'"+Count+"' where bno='"+bno+"' ";
    	int x=0;
    	x=smt.executeUpdate(sq3);
    	if(x==1) out.print("更改库存信息成功<br>");
    	else out.print("更改库存信息失败<br>");
		out.print("添加商品到购物车成功<br>");
	}
    else out.print("添加商品到购物车失败<br>");
}
smt.close();
conn.close();
rs.close();
%>
<a href="mainpage.jsp">再逛逛</a>
<a href="cart.jsp">购物车</a>
<a href="price.jsp">结账</a>
</body>
</html>