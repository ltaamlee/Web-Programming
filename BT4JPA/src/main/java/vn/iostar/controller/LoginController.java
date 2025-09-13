package vn.iostar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;
import vn.iostar.service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserServiceImpl userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("account", user);
			session.setMaxInactiveInterval(30 * 60);
			
			switch (user.getRoleid()) {
			case 1: // admin
				resp.sendRedirect(req.getContextPath() + "/admin/home");
				break;
			case 2: // manager
				resp.sendRedirect(req.getContextPath() + "/manager/home");
				break;
			case 3: // user
			default:
				resp.sendRedirect(req.getContextPath() + "/user/home");
				break;
			}
		} else {
			req.setAttribute("alert", "Tài khoản hoặc mật khẩu không đúng!");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}
	}
}
