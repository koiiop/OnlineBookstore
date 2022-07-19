package util;
import java.sql.*;

public class db {
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int i=0;
	String str="jdbc:mysql://localhost:3306/bookstore";
	private String user="root";
	private String ps="123456";
	
	public db(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			System.out.print(e);
			}
	    try {
	    	conn=DriverManager.getConnection(str,user,ps);
	    	if(conn!=null) {System.out.println("连接数据库成功");}
	    	stmt=conn.createStatement();  }
	    catch(SQLException e) {System.out.print(e);}
	}
    public ResultSet executeQuery(String sql) {
    	try{rs=stmt.executeQuery(sql);
       	}
    	catch(SQLException e) {
    		System.out.print(e);
    	}
    	return rs;
    }
    public int executeUpdate(String sql) {
    	try {
    		i=stmt.executeUpdate(sql);
    	}
    	catch(SQLException e) {
    		System.out.print(e);
    	}
    	
    	return i;
    }
}
