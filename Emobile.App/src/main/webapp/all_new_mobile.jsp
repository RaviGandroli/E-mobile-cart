<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DAO.mobilesDAOImpl, com.DB.DBconnect, com.entity.MobileDtls, java.util.ArrayList, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Mobile</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body>

	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>


		<c:remove var="someVariable" scope="session" />

	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			List<MobileDtls> list = dao.getAllNewMobiles();
			for (MobileDtls m : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="image is not loaded" src="mobiles/<%=m.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p>
							Model :
							<%=m.getMobilename()%></p>
						<p>
							Brand :
							<%=m.getCampany()%></p>
						<p>
							category :
							<%=m.getMobilecategory()%>
						</p>
						<div class="row ml-3">
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

	</div>

</body>
</html>