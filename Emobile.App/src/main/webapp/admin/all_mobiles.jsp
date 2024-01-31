<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DAO.mobilesDAOImpl, com.DB.DBconnect, com.entity.MobileDtls, java.util.ArrayList, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Mobiles</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succmsg }"></c:if>
	<h5 class="text-center text-success">${succmsg }</h5>
	<c:remove var="succmsg" scope="session" />

	<c:if test="${not empty failmsg }"></c:if>
	<h5 class="text-center text-danger">${failmsg }</h5>
	<c:remove var="failmsg" scope="session" />

	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Mobile Name</th>
				<th scope="col">Company</th>
				<th scope="col">Price</th>
				<th scope="col">category</th>

				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list = dao.getAllMobiles();
			for (MobileDtls m : list) {
			%>

			<tr>
				<td><%=m.getMobileid()%></td>
				<td><img src="../mobiles/<%=m.getPhoto()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=m.getMobilename()%></td>
				<td><%=m.getCampany()%></td>
				<td><%=m.getPrice()%></td>
				<td><%=m.getMobilecategory()%></td>
				<td><%=m.getStatus()%></td>


				<td><a href="edit_mobiles.jsp?id=<%=m.getMobileid()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i>Edit</a> <a
					href="../delete?id=<%=m.getMobileid()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>
				</td>

			</tr>


			<%
			}
			%>


		</tbody>
	</table>

	<div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>