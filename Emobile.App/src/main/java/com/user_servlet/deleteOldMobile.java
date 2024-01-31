package com.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.mobilesDAOImpl;
import com.DB.DBconnect;

@WebServlet("/delete_old_mobile")
public class deleteOldMobile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String em = req.getParameter("em");
			int id = Integer.parseInt(req.getParameter("id"));
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());

			boolean f = dao.oldBookDelete(em, "Old", id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succmsg", "Old Mobile Deleted Successfully");
				resp.sendRedirect("old_mobile.jsp");
			} else {
				session.setAttribute("failedmsg", "Something wrong on server");
				resp.sendRedirect("old_mobile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
