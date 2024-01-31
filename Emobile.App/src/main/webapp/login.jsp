<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-mobile login</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class=card-body">

						<h4 class="text-center">login page</h4>
						<c:if test="${not empty failmsg }">
							<h5 class="text-center text-danger">${failmsg }</h5>

							<c:remove var="failmsg" scope="session" />
						</c:if>

						<c:if test="${not empty succmsg }">
							<h5 class="text-center text-danger">${succmsg }</h5>

							<c:remove var="succmsg" scope="session" />
						</c:if>



						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email"
									pattern="[/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" pattern="^(?=.*\d)(?=.*[a-zA-Z]).{8,}$"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="register.jsp">create a new account</a>
							</div>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>