package utils;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req1, ServletResponse resp1, FilterChain fc)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) req1;
		HttpServletResponse resp = (HttpServletResponse) resp1;
		if (check(req.getRequestURI())) {
			fc.doFilter(req, resp);
		} else {
			if (req.getSession().getAttribute("user") == null) {
				resp.sendRedirect( req.getContextPath() + "/login.jsp");
			} else {
				fc.doFilter(req, resp);
			}
		}
	}

	private boolean check(String url) {
		for (int i = 0; i < remove.length; i++) {
			if (url.endsWith(remove[i]))
				return true;
		}
		return false;
	}

	String[] remove = new String[0];

	public void init(FilterConfig c) throws ServletException {
		remove = c.getInitParameter("remove").split(","); // 获得所有参数
	}

	// private boolean canIgnore(HttpServletRequest req) {
	// String url = req.getRequestURI();
	// for(String ignore:prefixIgnores) {
	// if( url.endsWith(ignore)) {
	// return true;
	// }
	// }
	// return false;
	// }
}
