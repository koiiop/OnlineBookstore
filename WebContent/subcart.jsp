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
String bno=request.getParameter("bno");
//String bname=request.getParameter("bname");
//String price=request.getParameter("price");
//double Price=Double.parseDouble(price);
String count=request.getParameter("count");
int Count=Integer.parseInt(count);
String num=request.getParameter("num");
int Num=Integer.parseInt(num);
Connection conn=null;
Statement smt=null;
//ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC","root","123456"); 
smt=conn.createStatement();
int n=0;                                                    
if(Count>Num)
{
	String sql="update item set count=count-'"+Num+"' where bno='"+bno+"' ";
    n=smt.executeUpdate(sql);
    if(n==1)
    {  
    	String sq3="update book set number=number+'"+Num+"' where bno='"+bno+"' ";
    	int x=0;
    	x=smt.executeUpdate(sq3);
    	if(x==1) out.print("更改库存信息成功<br>");
    	else out.print("更改库存信息失败<br>");
    	out.print("从购物车减少商品成功<br>");
    }
    else out.print("从购物车减少商品失败<br>");
}
if(Count==Num)
{
	String sql="delete from item where bno='"+bno+"' ";
    n=smt.executeUpdate(sql);
    if(n==1)
    {  
    	String sq3="update book set number=number+'"+Num+"' where bno='"+bno+"' ";
    	int x=0;
    	x=smt.executeUpdate(sq3);
    	if(x==1) out.print("更改库存信息成功<br>");
    	else out.print("更改库存信息失败<br>");
    	out.print("从购物车删除该商品成功<br>");
    }
    else out.print("从购物车减少商品失败<br>");
}
else
{
	out.print("您要减少的该商品数量大于购物车中该商品的数量，从购物车减少商品失败<br>");
}
smt.close();
conn.close();
//rs.close();
%>
<a href="mainpage.jsp">再逛逛</a>
<a href="cart.jsp">购物车</a>
<a href="price.jsp">结账</a>
</body>
</html>