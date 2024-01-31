<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #e8e9eb;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>

						<c:if test="${not empty failedmsg }">
							<h5 class="text-center text-danger">${failedmsg }</h5>

							<c:remove var="failedmsg" scope="session" />
						</c:if>

						<c:if test="${not empty succmsg }">
							<h5 class="text-center text-success">${succmsg }</h5>

							<c:remove var="succmsg" scope="session" />
						</c:if>

						<form action="update_profile" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exname">Enter Full Name</label> <input type="text"
									class="form-control" id="exname" aria-describedby="nameHelp"
									placeholder="Enter full name" required="required" name="fname"
									value="${userobj.name }">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email"
									pattern="[/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email" value="${userobj.email }">

							</div>
							<div class="form-group">
								<label for="phono">Phone No</label> <input type="text"
									class="form-control" id="phono" pattern="[6789][0-9]{9}"
									placeholder="enter phono no" required="required" name="phoneno"
									value="${userobj.phoneno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" pattern="^(?=.*\d)(?=.*[a-zA-Z]).{8,}$"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>