package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.mobilesDAOImpl;
import com.DB.DBconnect;
import com.entity.MobileDtls;

/**
 * Servlet implementation class edit_mobileservlet
 */
@WebServlet("/edit_mobiles")
public class edit_mobileservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String mobilename = req.getParameter("mname");
			String campany = req.getParameter("company");
			String price = req.getParameter("price");
			String status = req.getParameter("mstatus");

			MobileDtls m = new MobileDtls();
			m.setMobileid(id);
			m.setMobilename(mobilename);
			m.setCampany(campany);
			m.setPrice(price);
			m.setStatus(status);

			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			boolean f = dao.updateEditMobile(m);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succmsg", "mobile update successful");
				resp.sendRedirect("admin/all_mobiles.jsp");
			} else {
				session.setAttribute("failmsg", "somthing went wrong");
				resp.sendRedirect("admin/all_mobiles.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
