<%@page import="com.entity.cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.cartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
taglib prefix="c" url="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart page</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succmsg }">
		<div class="alert alert-success" role="alert">${succmsg}</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>


	<c:if test="${not empty failedmsg }">
		<div class="alert alert-danger text-center" role="alert">
			${failedmsg}</div>
		<c:remove var="failedmsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Mobile Name</th>
									<th scope="col">Company</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userobj");

								cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
								List<cart> ca = dao.getMobileByUser(u.getId());

								int totalPrice = 0;
								for (cart c : ca) {

									totalPrice = (int) (c.getTotalPrice());
								%>
								<tr>
									<th scope="row"><%=c.getMobileName()%></th>
									<td><%=c.getCompany()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_Mobile?mid=<%=c.getmid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order">

							<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="${userobj.name }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										placeholder="email" value="${userobj.email }" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone no</label> <input type="number"
										name="phoneno" class="form-control" id="inputEmail4"
										value="${userobj.phoneno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">---select---</option>
									<option value="cod">cash on delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>