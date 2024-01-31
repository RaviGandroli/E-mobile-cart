<%@page import="com.entity.user"%>
<%@page import="com.entity.MobileDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.mobilesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
	MobileDtls m = dao.getMobileById(bid);
	%>

	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="mobiles/<%=m.getPhoto()%>"
					style="height: 150px; width: 150px"><br>
				<h4 class="mt-3">
					Mobile Name:<span class="text-success"><%=m.getMobilename()%></span>
				</h4>
				<h4>
					Company Name:<span class="text-success"><%=m.getCampany()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"><%=m.getMobilecategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=m.getMobilename()%></h2>

				<%
				if ("Old".equalsIgnoreCase(m.getMobilecategory())) {
				%>
				<h5>Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i>Email:
					<%=m.getEmail()%></h5>

				<%
				}
				%>

				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>

					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equalsIgnoreCase(m.getMobilecategory())) {
				%>
				<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus"></i>Continue Shoping</a> <a
						class="btn btn-danger"><%=m.getPrice()%><i
						class="fa-solid fa-indian-rupee-sign"></i></a>

				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">
					<a href="cart?mid=<%=m.getMobileid()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Add
						Cart</a> <a class="btn btn-danger"> <%=m.getPrice()%> <i
						class="fa-solid fa-indian-rupee-sign"></i></a>

				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>