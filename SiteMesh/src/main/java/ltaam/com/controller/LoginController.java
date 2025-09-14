package ltaam.com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ltaam.com.entity.User;
import ltaam.com.service.UserService;
import ltaam.com.service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserService userService = new UserServiceImpl(); 
		User user = userService.login(username, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("account", user);

			switch (user.getRoleid()) {
			case 1: // admin
				response.sendRedirect(request.getContextPath() + "/admin/home");
				break;
			case 2: // manager
				response.sendRedirect(request.getContextPath() + "/manager/home");
				break;
			case 3: // user
			default:
				response.sendRedirect(request.getContextPath() + "/user/home");
				break;
			}
		} else {
			request.setAttribute("alert", "Tài khoản hoặc mật khẩu không đúng!");
			request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
		}
	}

}
