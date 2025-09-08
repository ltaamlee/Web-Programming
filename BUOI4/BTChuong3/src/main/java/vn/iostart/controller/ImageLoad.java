package vn.iostart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iostart.utils.Constant;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Servlet implementation class ImageLoad
 */
@WebServlet("/image")
public class ImageLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageLoad() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String fname = req.getParameter("fname");
		if (fname == null || fname.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Filename is required");
			return;
		}
		System.out.println("Requested fname: " + fname);
		File file = new File(Constant.DIR, fname);
		System.out.println("Full path: " + file.getAbsolutePath());
		System.out.println("Exists? " + file.exists());

//		File file = new File(Constant.DIR, fname);
//		if (!file.exists()) {
//			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
//			return;
//		}

		// Set content type theo file
		String mimeType = getServletContext().getMimeType(fname);
		if (mimeType == null)
			mimeType = "application/octet-stream";
		resp.setContentType(mimeType);

		try (FileInputStream in = new FileInputStream(file); ServletOutputStream out = resp.getOutputStream()) {
			in.transferTo(out);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
