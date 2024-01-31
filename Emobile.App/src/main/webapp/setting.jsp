<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
a {
	text-decoration: name;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #e8e9eb;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container ">

		<h3 class="text-center">Hello, ${userobj.name }</h3>


		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_mobile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary ">
								<i class="fa-solid fa-mobile-screen-button fa-3x"></i>
							</div>
							<h3>Sell Old Mobile</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="old_mobile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary ">
								<i class="fa-solid fa-mobile-screen-button fa-3x"></i>
							</div>
							<h3>Old Mobile</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary ">
								<i class="fa-regular fa-pen-to-square fa-3x"></i>
							</div>
							<h3>(Edit Profile)</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger ">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary ">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24 * 7 Service</p>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>