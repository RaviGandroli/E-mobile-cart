<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell mobile</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #e8e9eb;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">

						<h5 class="text-center text-primary p-1">Sell Old Mobile</h5>

						<c:if test="${not empty succmsg }">
							<p class="text-center text-success">${succmsg }</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failmsg }">
							<p class="text-center text-danger">${failmsg }</p>
							<c:remove var="failmsg" scope="session" />
						</c:if>

						<form action="add_old_mobile" method="post"
							enctype="multipart/form-data">



							<input type="hidden" value="${userobj.email }" name="user">
							<div class="form-group">
								<label for="ExampleInputEmail1">Mobile Name</label><input
									name="mname" type="text" class="form-control"
									id="ExampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="ExampleInputEmail1">Company Name</label><input
									name="company" type="text" class="form-control"
									id="ExampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="ExampleInputEmail1">Price</label><input name="price"
									type="number" class="form-control" id="ExampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">uplod photo</label> <input
									name="mimg" class="form-control-file" type="file"
									id="exampleFormControlFile1" enctype="multipart/form-data">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>