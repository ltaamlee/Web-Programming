package vn.iostart.controller.category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iostart.model.Category;
import vn.iostart.service.CategoryService;
import vn.iostart.service.impl.CategoryServiceImpl;
import vn.iostart.utils.Constant;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/category/add")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB lưu tạm bộ nhớ
		maxFileSize = 5 * 1024 * 1024, // 5MB/file
		maxRequestSize = 10 * 1024 * 1024 // 10MB tổng request
)
public class CategoryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService cateService = new CategoryServiceImpl();

	public CategoryAddController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-category.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		Category category = new Category();

		String idStr = req.getParameter("id");
		boolean isEdit = false;
		if (idStr != null && !idStr.isEmpty()) {
			category.setCateid(Integer.parseInt(idStr));
			isEdit = true;
		}
		
		String name = req.getParameter("name");

		// Kiểm tra xem tên danh mục đã tồn tại chưa
		if (cateService.isExistName(name)) {
		    req.setAttribute("errorMsg", "Danh mục đã tồn tại!");
		    req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
		    return;
		}

		category.setCatename(name);

		Part filePart = req.getPart("icon");
		String filename = null;

		if (filePart != null && filePart.getSize() > 0) {
			String uploadDir = Constant.DIR;
			File dir = new File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			String originalFileName = new File(filePart.getSubmittedFileName()).getName();
			int index = originalFileName.lastIndexOf(".");
			String ext = index > 0 ? originalFileName.substring(index + 1) : "";
			filename = System.currentTimeMillis() + (ext.isEmpty() ? "" : "." + ext);

			filePart.write(uploadDir + File.separator + filename);

			category.setIcon(filename);

		} else {
			category.setIcon(null);
		}

		if (isEdit) {
			cateService.edit(category);
		} else {
			cateService.insert(category);
		}
//
//		// Debug: in ra console
//		System.out.println("Tên danh mục: " + name);
//		System.out.println("File lưu server: " + filename);
//		System.out.println("Đường dẫn lưu DB: " + category.getIcon());

		resp.sendRedirect(req.getContextPath() + "/admin/category/list");
	}

}
