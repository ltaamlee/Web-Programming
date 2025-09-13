package vn.iostar.controller.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.entity.User;

import java.io.IOException;

@WebServlet(urlPatterns = {"/manager/home", "/manager"})
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("account");
        if (user == null || user.getRoleid() != 2) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.setAttribute("username", user.getUserName());

        req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
