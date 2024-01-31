<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page
	import="com.DAO.mobilesDAOImpl, com.DB.DBconnect, com.entity.MobileDtls, java.util.ArrayList, java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emobile: index</title>
<%@include file="all_component/all_css.jsp"%>

<style type="text/css">
.back-img {
	background: url(img/mobile.jpg);
	height: 40vh;
	width: 100%;
	background-repeat: no -repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #dae0eb;
}
</style>

</head>
<body style="background-color: #e8e9eb;">

	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">

		<h2 class="text-center text-danger">E-mobile Management System</h2>
	</div>

	<%
	Connection conn = DBconnect.getConn();
	%>

	<!-- recent book -->
	<div class="container">
		<h3 class="text-center">Recent Mobile</h3>
		<div class="row">

			<%
			mobilesDAOImpl dao2 = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list2 = dao2.getRecentMobile();
			for (MobileDtls m : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="mobiles/<%=m.getPhoto()%>"
							style="width: 220px; height: 200px" class="img-thumblin">
						<p>
							Model :
							<%=m.getMobilename()%></p>
						<p>
							Brand :
							<%=m.getCampany()%></p>
						<p>
							<%
							if (m.getMobilecategory().equals("Old")) {
							%>
							categories:
							<%=m.getMobilecategory()%>
						</p>

						<div class="row">

							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="index.jsp" class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						} else {
						%>
						categories:
						<%=m.getMobilecategory()%>
						</p>
						<div class="row ">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?mid=<%=m.getMobileid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ">Add Cart</a>

							<%
							}
							%>

							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a
								class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>

						<%
						}
						%>

					</div>


				</div>

			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_recent_mobile.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!--End recent book -->

	<hr>

	<!-- new mobile -->
	<div class="container">
		<h3 class="text-center">New Mobile</h3>
		<div class="row">


			<%
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list = dao.getNewMobile();
			for (MobileDtls m : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="mobiles/<%=m.getPhoto()%>"
							style="width: 220px; height: 200px" class="img-thumblin">
						<p>
							Model :
							<%=m.getMobilename()%></p>
						<p>
							Brand :
							<%=m.getCampany()%></p>
						<p>
							categories:
							<%=m.getMobilecategory()%>
						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?mid=<%=m.getMobileid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ">Add Cart</a>

							<%
							}
							%>
							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a
								class="btn btn-danger btn-sm ml-1 "><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>


					</div>


				</div>
			</div>

			<%
			}
			%>




		</div>
		<div class="text-center mt-1">
			<a href="all_new_mobile.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!--End new mobile -->

	<hr>

	<!-- old mobile -->
	<div class="container">
		<h3 class="text-center">Old Mobile</h3>
		<div class="row">

			<%
			mobilesDAOImpl dao3 = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list3 = dao3.getOldMobile();
			for (MobileDtls m : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="mobiles/<%=m.getPhoto()%>"
							style="width: 220px; height: 200px" class="img-thumblin">
						<p>
							Model :
							<%=m.getMobilename()%></p>
						<p>
							Brand :
							<%=m.getCampany()%></p>
						<p>
							categories:
							<%=m.getMobilecategory()%>
						</p>
						<div class="row ">

							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a
								class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>


					</div>


				</div>

			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_old_mobile.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!--End old mobile -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>