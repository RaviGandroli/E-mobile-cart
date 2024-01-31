
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>


<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-mobile-screen-button"></i><a>E-mobiles</a>
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>


		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="checkout.jsp"><i
					class="fa-solid fa-cart-shopping fa-2x "></i></a> <a href="login.jsp"
					class="btn btn-success"><i class="fa-solid fa-user-check"></i>
					${userobj.name} </a> <a href="logo" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket"></i>Logout</a>
			</div>

		</c:if>


		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i>login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-check"></i>Register</a>
			</div>
		</c:if>
	</div>
</div>






<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>



			<li class="nav-item active"><a class="nav-link"
				href="all_recent_mobile.jsp"><i
					class="fa-solid fa-mobile-screen"></i>Recent Mobile</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_new_mobile.jsp"><i class="fa-solid fa-mobile-screen"></i>New
					Mobile</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_mobile.jsp"><i class="fa-solid fa-mobile-screen"></i>Old
					Mobile</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 mL-1"
				type="submit"><i class="fa-solid fa-gear "></i>Setting</a> <a
				href="contactus.jsp" class="btn btn-light my-2 my-sm-0 mL-1"
				type="submit"><i class="fa-solid fa-phone "></i>Contact Us</a>
		</form>
	</div>
</nav>