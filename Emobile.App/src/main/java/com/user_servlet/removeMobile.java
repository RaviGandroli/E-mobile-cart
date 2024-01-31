package com.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOImpl;
import com.DB.DBconnect;

/**
 * Servlet implementation class removeMobile
 */
@WebServlet("/remove_Mobile")
public class removeMobile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int mid = Integer.parseInt(req.getParameter("mid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
		boolean f = dao.deleteMobile(mid, uid, cid);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succmsg", "Mobile Removed from cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedmsg", "Something wrong on server");
			resp.sendRedirect("checkout.jsp");
		}
	}

}
