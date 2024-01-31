<%@page import="com.entity.Mobile_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.mobileOrderDAOImpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #e8e9eb;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>



	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Mobile Name</th>
					<th scope="col">Company</th>
					<th scope="col">Price</th>
					<th scope="col">Payment type</th>


				</tr>
			</thead>
			<tbody>

				<%
				user u = (user) session.getAttribute("userobj");
				mobileOrderDAOImpl dao = new mobileOrderDAOImpl(DBconnect.getConn());
				List<Mobile_order> list = dao.getMobile(u.getEmail());
				for (Mobile_order m : list) {
				%>

				<tr>
					<th scope="row"><%=m.getOrderId()%></th>
					<td><%=m.getUsername()%></td>
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

	</div>
	</div>


</body>
</html>