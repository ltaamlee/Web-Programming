package ltaam.com.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ltaam.com.entity.User;
import ltaam.com.service.UserService;
import ltaam.com.service.impl.UserServiceImpl;

import java.io.File;
import java.io.IOException;

@WebServlet("/admin/profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/profile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        String username = request.getParameter("username");
        String email = request.getParameter("email");       // thêm email
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");

        Part part = request.getPart("avatar");
        String fileName = null;
        if (part != null && part.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            part.write(uploadPath + File.separator + fileName);
        }

        user.setUserName(username);
        user.setEmail(email);          
        user.setFullName(fullname);
        user.setPhone(phone);
        if (fileName != null) user.setAvatar(fileName);

        userService.update(user);

        session.setAttribute("account", user);

        response.sendRedirect(request.getContextPath() + "/admin/profile");
    }

}
