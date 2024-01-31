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

@WebServlet("/delete")
public class mobilesDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			boolean f = dao.deleteMobiles(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succmsg", "Mobile Delete Successfully");
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
