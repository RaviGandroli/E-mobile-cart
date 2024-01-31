<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DAO.mobilesDAOImpl, com.DB.DBconnect, com.entity.MobileDtls, java.util.ArrayList, java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Mobile</title>
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
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			mobilesDAOImpl dao2 = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list2 = dao2.getAllRecentMobiles();
			for (MobileDtls m : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="mobiles/<%=m.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
							category:
							<%=m.getMobilecategory()%>
						</p>

						<div class="row ml-5">

							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-3">View Details</a> <a
								class="btn btn-danger btn-sm ml-1"><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						} else {
						%>
						category:
						<%=m.getMobilecategory()%>
						</p>
						<div class="row  ml-5">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?mid=<%=m.getMobileid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-3 ">Add Cart</a>

							<%
							}
							%>
							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
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

	</div>

</body>
</html>