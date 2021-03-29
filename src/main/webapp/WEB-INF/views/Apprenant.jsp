<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" type="text/css" href="resources/CSS/Apprenant.css">
<title>Apprenant</title>
</head>
<body>
<%
//delete cash
response.setHeader("Cache-Control","no-cache, no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

    //if sesion is null redirection
    if (session.getAttribute("id") == null){
        response.sendRedirect("index.jsp");
    }
%>




<section class="reservationSection">
		<h1>Apprenant: <br> ${ apprenant.nom } ${ apprenant.prenom }</h1>

		<form class="reservForm" action="reservation" >
		
			<select class="form-control mr-sm-2" name="t_reservation">
			<option value="">--Please choose an option--</option>
			<option value="Weekend">Weekend</option>
			<option value="Normal">Normal</option>
			</select><br><br>
			<input class="form-control mr-sm-2" type="date" name="date"><br><br>

			<input type="submit" class="btn btn-success">
		</form>
</section>

  <!------------------ History Table -------------------->
<section>
<!-- ------- Main Navbar ---------- -->
	<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark" style="	background-color: #000000();">
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="Dashboard">
	          <i class="fa fa-home"></i>
	          Home
	          <span class="sr-only">(current)</span>
	          </a>
	      </li>
	      <li>
	      	   <form class="form-inline my-2">
			      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    </form>
	      </li>
	    </ul>
	    <ul class="navbar-nav ">
	      <li class="nav-item">
	        <a class="nav-link" href="#">
	          <i class="fa fa-bell">
	            <span class="badge badge-info">11</span>
	          </i>
	          Notification
	        </a>
	      </li>
		  <li class="nav-item">
		        <a class="nav-link" href="#">
		          <i class="fa fa-envelope-o">
		            <span class="badge badge-danger">11</span>
		          </i>
		          Messages
		        </a>
		      </li>
	    </ul>
	      <a href="logout"><button class="btn btn-danger my-2 my-sm-0" type="submit">Logout</button></a>
	  </div>
	</nav>
<!-- ------- End Main Navbar ---------- -->


	<main>
		  <h1>${ apprenant.nom } ${ apprenant.prenom } Historique</h1>
		  <div class="tbl-header">
		    <table cellpadding="0" cellspacing="0" border="0">
		      <thead>
		        <tr>
		          <th>Nom</th>
		          <th>Date</th>
		          <th>Type de Résérvation</th>
		          <th>Confirmation</th>
		        </tr>
		      </thead>
		    </table>
		  </div>
		  <div class="tbl-content">
		    <table cellpadding="0" cellspacing="0" border="0">
		      <tbody>
		 
		        <c:forEach  items="${reservation}" var="reservation">
		        <tr>
		                <td>${ reservation.id_apprenant.nom } ${ reservation.id_apprenant.prenom }</td>
		                <td>${reservation.date}</td>
		                <td>${reservation.type_reservation.type_reservation}</td>
		                <td>${reservation.confirmé}</td>
		                
		       </tr>
		        </c:forEach> 
		        
		      </tbody>
		    </table>
		  </div>
	  </main>
</section>




	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>

</body>
</html>