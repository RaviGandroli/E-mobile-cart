<%@page import="com.entity.MobileDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.mobilesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Mobile</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succmsg }">
		<div class="alert alert-success text-center">${succmsg }</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>


	<div class="container p-5">

		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>

					<th scope="col">Mobile Name</th>
					<th scope="col">Company</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				user u = (user) session.getAttribute("userobj");
				String email = u.getEmail();
				mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
				List<MobileDtls> list = dao.getMobileByOld(email, "Old");
				for (MobileDtls m : list) {
				%>

				<tr>
					<td><%=m.getMobilename()%></td>
					<td><%=m.getCampany()%></td>
					<td><%=m.getPrice()%></td>
					<td><%=m.getMobilecategory()%></td>


					<td><a
						href="delete_old_mobile?em=<%=email%>&&id=<%=m.getMobileid()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>



			</tbody>
		</table>

	</div>

</body>
</html>