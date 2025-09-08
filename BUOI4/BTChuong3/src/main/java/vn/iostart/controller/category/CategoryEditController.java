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
import java.util.List;

@WebServlet(urlPatterns = { "/admin/category/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB lưu tạm bộ nhớ
		maxFileSize = 5 * 1024 * 1024, // 5MB/file
		maxRequestSize = 10 * 1024 * 1024 // 10MB tổng request
)

public class CategoryEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService cateService = new CategoryServiceImpl();

	public CategoryEditController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Category category = cateService.get(Integer.parseInt(id));
		req.setAttribute("cate", category);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-category.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String idStr = req.getParameter("id");
		if (idStr == null || idStr.isEmpty()) {
			resp.sendRedirect(req.getContextPath() + "/admin/category/list");
			return;
		}

		int id = Integer.parseInt(idStr);
		Category oldCategory = cateService.get(id); 
		Category category = new Category();
		category.setCateid(id);
		category.setCatename(req.getParameter("name"));

		Part filePart = req.getPart("icon");
		if (filePart != null && filePart.getSize() > 0) {
			String uploadDir = Constant.DIR;
			File dir = new File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			String originalFileName = new File(filePart.getSubmittedFileName()).getName();
			int index = originalFileName.lastIndexOf(".");
			String ext = index > 0 ? originalFileName.substring(index + 1) : "";
			String fileName = System.currentTimeMillis() + (ext.isEmpty() ? "" : "." + ext);

			filePart.write(uploadDir + File.separator + fileName);
			category.setIcon(fileName);

			String oldFile = oldCategory.getIcon();
			if (oldFile != null) {
				File f = new File(uploadDir + File.separator + oldFile);
				if (f.exists())
					f.delete();
			}

		} else {
			category.setIcon(oldCategory.getIcon());
		}

		cateService.edit(category);
		
		resp.sendRedirect(req.getContextPath() + "/admin/category/list");
	}
}
