<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="all_css.jsp" %>
<style type="text/css">
a{
text-decoration:none;
color:black;

}
a:hover{
text-decoration:none;
color:black;


}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
  <c:if test="${empty userobj }">
  <c:redirect url="../login.jsp"></c:redirect>
  </c:if>

   <div class="container">
      <div class="row p-5">
        <div class="col-md-3">
             <a href="add_mobiles.jsp">
                  <div class="card">
                  <div class="card-body text-center">
                  <i class="fa-regular fa-square-plus fa-3x text-primary"></i>
                  <h4>Add Mobiles</h4>
                     --------
                  </div>
                  </div>
             </a>
        </div>
        
        <div class="col-md-3">
          <a href="all_mobiles.jsp">
             <div class="card">
             <div class="card-body text-center">
             <i class="fa-solid fa-mobile fa-3x text-danger"></i>
             <h4>All Mobiles</h4>
              --------
             </div>
             </div>
          </a>
        </div>
        
      <div class="col-md-3">
          <a href="orders.jsp">
             <div class="card">
             <div class="card-body text-center">
             <i class="fa-solid fa-mobile fa-3x text-warning"></i>
             <h4>Orders</h4>
              --------
             </div>
             </div>
          </a>
        </div>
        
        <div class="col-md-3">
       <a data-toggle="modal" data-target="#exampleModalCenter">
        <div class="card">
        <div class="card-body text-center">
        <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
        <h4>Logout</h4>
        --------
       </a>
        </div>
        </div>
        </div>
      </div>
      
   </div>
   
   <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do you want to logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       <a href="../logo"  type="button" class="btn btn-primary text=white">logout</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
   
  <div>
   <%@include file="footer.jsp" %>
  </div>
</body>
</html>