package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class filter
 */
@WebFilter("/*")
public class loginfilter implements Filter {
	private String exclude="loginservlet";

    /**
     * Default constructor. 
     */
    public loginfilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest r1=(HttpServletRequest)request;
		HttpServletResponse r2=(HttpServletResponse)response;
				r2.setCharacterEncoding("UTF-8");
				r2.setContentType("text/html; cahrset=utf-8");
		HttpSession s1=r1.getSession();
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
	
		if(s1.getAttribute("user")!=null) {
		  if(s1.getAttribute("key").equals("1")) {
			  chain.doFilter(request, response);
		  }
		   if(s1.getAttribute("key").equals("2")) {
				  s1.removeAttribute("user");
				r2.getWriter().append("用户名密码错误<a href='loginservlet'>点我跳转</a>");
			  }	
			
		}
		
		
		else if(r1.getRequestURI().contains(exclude)) {
			chain.doFilter(request, response);
		}
		else {
			r2.sendRedirect("loginservlet");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
