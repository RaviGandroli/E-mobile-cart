<%@page import="com.entity.Mobile_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.mobileOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Orders</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">ph no</th>
				<th scope="col">mobile Name</th>
				<th scope="col">company</th>
				<th scope="col">price</th>
				<th scope="col">payment type</th>



			</tr>
		</thead>
		<tbody>

			<%
			mobileOrderDAOImpl dao = new mobileOrderDAOImpl(DBconnect.getConn());
			List<Mobile_order> list = dao.getAllMobile();
			for (Mobile_order m : list) {
			%>

			<tr>
				<th scope="row"><%=m.getOrderId()%></th>
				<td><%=m.getUsername()%></td>
				<td><%=m.getEmail()%></td>
				<td><%=m.getFulladd()%></td>
				<td><%=m.getPhoneno()%></td>
				<td><%=m.getMobilename()%></td>
				<td><%=m.getCompany()%></td>
				<td><%=m.getPrice()%></td>
				<td><%=m.getPaymentType()%></td>

			</tr>

			<%
			}
			%>



		</tbody>
	</table>

	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%>
	</div>



</body>
</html>