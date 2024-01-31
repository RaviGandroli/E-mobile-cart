package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.mobilesDAOImpl;
import com.DB.DBconnect;
import com.entity.MobileDtls;


@WebServlet("/add_mobiles")
@MultipartConfig
public class MobilesAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public MobilesAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String mobilename = req.getParameter("mname");
			String campany = req.getParameter("company");
			String price = req.getParameter("price");
			String categories = req.getParameter("mcategories");
			String status = req.getParameter("mstatus");
			Part part = req.getPart("mimg");
			String fileName = part.getSubmittedFileName();

			MobileDtls m = new MobileDtls(mobilename, campany, price, categories, status, fileName, "admin");

			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());

			boolean f = dao.addMobiles(m);
			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "mobiles";
				File F = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succmsg", "mobile added successfully");
				resp.sendRedirect("admin/add_mobiles.jsp");
			} else {
				session.setAttribute("failmsg", "something went wrong");
				resp.sendRedirect("admin/add_mobiles.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
