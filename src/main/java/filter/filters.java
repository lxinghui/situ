package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class filters implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	



	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain file)
			throws IOException, ServletException {
		HttpServletRequest  rep=(HttpServletRequest) arg0;
		HttpServletResponse rop= (HttpServletResponse) arg1;
		
		
			if((rep.getRequestURI().indexOf("login.jsp")>0 || rep.getRequestURI().indexOf("login")>0 ||rep.getRequestURI().indexOf("css")>0||rep.getRequestURI().indexOf("png")>0||rep.getRequestURI().indexOf("js")>0||rep.getRequestURI().indexOf("jpg")>0 )&& rep.getRequestURI().indexOf("jsp")<0 || rep.getRequestURI().indexOf("login.jsp")>0) {
				file.doFilter(rep, rop);
			}
			else if(rep.getSession().getAttribute("user")!=null) {
				  file.doFilter(rep, rop);
			}
			else
			{
				//rep.setAttribute("login", "login");
				rop.sendRedirect(rep.getContextPath()+"/login.jsp");
				//file.doFilter(rep, rop);
			}
               
		
	}


	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	

}
