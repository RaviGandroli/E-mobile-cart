<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Mobiles</title>
<%@include file="all_css.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Mobiles</h4>
						<c:if test="${not empty succmsg }">
							<p class="text-center text-success">${succmsg }</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failmsg }">
							<p class="text-center text-danger">${failmsg }</p>
							<c:remove var="failmsg" scope="session" />
						</c:if>


						<form action="../add_mobiles" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="M_name">Mobile Name</label><input name="mname"
									type="text" class="form-control" id="M_name">
							</div>

							<div class="form-group">
								<label for="C_name">Company Name</label><input name="company"
									type="text" class="form-control" id="C_name">
							</div>

							<div class="form-group">
								<label for="price">Price</label><input name="price"
									type="number" class="form-control" id="price"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="inputState">Mobile Categories</label> <select
									name="mcategories" class="form-control" id="inputState">
									<option selected>--select--</option>
									<option value="new">New Mobile</option>
									<option value="Old">old Mobile</option>

								</select>

							</div>

							<div class="form-group">
								<label for="inputState">Mobile Status</label> <select
									name="mstatus" class="form-control" id="inputState">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">uplod photo</label> <input
									name="mimg" class="form-control-file" type="file"
									id="exampleFormControlFile1" enctype="multipart/form-data">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>

				</div>

			</div>

		</div>


	</div>

	<div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>