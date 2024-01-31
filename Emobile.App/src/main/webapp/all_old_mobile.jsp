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
	<div class="container-fluid">
		<div class="row p-3">
			<%
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list = dao.getAllOldMobiles();
			for (MobileDtls m : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
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
							category:
							<%=m.getMobilecategory()%>
						</p>
						<div class="row ml-5">

							<a href="view_mobiles.jsp?bid=<%=m.getMobileid()%>"
								class="btn btn-success btn-sm ml-4 ">Details</a> <a
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

	</div>

</body>
</html>