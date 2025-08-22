package hcmute.vn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.getWriter().append("Password wrong!");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");

		String user = req.getParameter("username");
		String pass = req.getParameter("password");

		if ("ltaam".equals(user) && "412@lt".equals(pass)) {
			Cookie c = new Cookie("username", user);
			c.setMaxAge(30);
			resp.addCookie(c);
			resp.sendRedirect(req.getContextPath() + "/hello");
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

}