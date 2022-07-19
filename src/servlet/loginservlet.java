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
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginservlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("login.html").forward(request, response);
		
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
		String isadmin=request.getParameter("isadmin");
		ResultSet rs=null;
		String sql="select * from user where username='"+username+"' and password='"+password+"' and isadmin='"+isadmin+"'";
		System.out.println(sql);
		User u1=new User();
		u1.setUsername(username);
		u1.setPassword(password);
		u1.setIsadmin(isadmin);
		HttpSession s1=request.getSession();
		s1.setAttribute("user", u1);
		db d1=new db();
		rs=d1.executeQuery(sql);
		try {
			if(rs.next() && username!=null && password!=null && isadmin!=null) {
				if(isadmin.equals("1"))
				{
				  System.out.println("用户登陆成功");
				  s1.setAttribute("key", "1");
			      response.sendRedirect("mainpage.jsp");
				}
				else if(isadmin.equals("2"))
				{
				  System.out.println("管理员登陆成功");
				  s1.setAttribute("key", "1");
			      response.sendRedirect("admin.jsp");
				}
			}
			
			
			else {
				s1.setAttribute("key", "2");
				System.out.println("登陆失败用户名密码错误");
				response.sendRedirect("loginservlet");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}
