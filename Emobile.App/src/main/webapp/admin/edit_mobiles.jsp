<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page
	import="com.DAO.mobilesDAOImpl, com.DB.DBconnect, com.entity.MobileDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Mobiles</title>
<%@include file="all_css.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Mobiles</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));

						mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
						MobileDtls m = dao.getMobileById(id);
						%>

						<form action="../edit_mobiles" method="post">
							<input type="hidden" name="id" value="<%=m.getMobileid()%>">
							<div class="form-group">
								<label for="ExampleInputEmail1">Mobile Name</label><input
									name="mname" type="text" class="form-control"
									id="ExampleInputEmail1" aria-describedby="emailHelp"
									value="<%=m.getMobilename()%>">
							</div>

							<div class="form-group">
								<label for="ExampleInputEmail1">Company Name</label><input
									name="company" type="text" class="form-control"
									id="ExampleInputEmail1" aria-describedby="emailHelp"
									value="<%=m.getCampany()%>">
							</div>

							<div class="form-group">
								<label for="ExampleInputEmail1">Price</label><input name="price"
									type="number" class="form-control" id="ExampleInputEmail1"
									aria-describedby="emailHelp" value="<%=m.getPrice()%>">
							</div>



							</select>
					</div>

					<div class="form-group">
						<label for="inputState">Mobile Status</label> <select
							name="mstatus" class="form-control" id="inputState">
							<%
							if ("Active".equals(m.getStatus())) {
							%>
							<option value="Active">Active</option>
							<option value="Inactive">Inactive</option>
							<%
							} else {
							%>
							<option value="Inactive">Inactive</option>

							<option value="Active">Active</option>
							<%
							}
							%>



						</select>
					</div>



					<button type="submit" class="btn btn-primary">Update</button>
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