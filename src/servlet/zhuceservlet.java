package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import util.db;

/**
 * Servlet implementation class zhuceservlet
 */
@WebServlet("/zhuceservlet")
public class zhuceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public zhuceservlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("zhuce.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String user_id=request.getParameter("user_id");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String isadmin=request.getParameter("isadmin");
		ResultSet rs=null;
		int n=0;
		String sql="insert into user values('"+user_id+"','"+username+"','"+password+"','"+address+"','"+email+"','"+phone+"','"+isadmin+"')";
		System.out.println(sql);
		User u2=new User();
		u2.setUsername(username);
		u2.setPassword(password);
		u2.setUser_id(user_id);
		u2.setPhone(phone);
		u2.setAddress(address);
		u2.setEmail(email);
		HttpSession s2=request.getSession();
		s2.setAttribute("user", u2);
		db d1=new db();
		String sq="select * from user where user_id='"+user_id+"'";
		rs=d1.executeQuery(sq);
		try {
			if(rs.next())
			{
				s2.setAttribute("key", "2");
				System.out.println("该用户已注册，注册失败");
				response.sendRedirect("zhuceservlet");
			}
			else
			{
                n=d1.executeUpdate(sql);
			    if(n==1) {
				   System.out.println("注册成功，请登录");
				   s2.setAttribute("key", "1");
			       response.sendRedirect("login.html");
			     }
			    else {
				   s2.setAttribute("key", "2");
				   System.out.println("注册失败");
				   response.sendRedirect("zhuceservlet");
			    }
	         }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}