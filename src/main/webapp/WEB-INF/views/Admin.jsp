<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/CSS/admin.css">
    <title>Admin</title>
</head>
<body>
<%
//delete cash
response.setHeader("Cache-Control","no-cache, no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

    //if sesion is null redirection
    if (request.getSession().getAttribute("id") == null){
        response.sendRedirect("index.jsp");
    }
%>
<header>
    <h1>Admin  ${admin.username}</h1>
    <a href="#">Acceuil</a>
    <a href="History">Historique Des Résérvations</a>
    <a href="#">Demandes D'inscription</a>
    <a href="#">Evenement</a>
</header>
<main>

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
	      <a href="logout"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></a>
	  </div>
	</nav>
<!-- ------- End Main Navbar ---------- -->


    <div class="container">
        <div class="greeting">
            <h1>Bonjour ${admin.username}</h1>
            <p class="greetingp">gérez toutes Les Résérvations à partir de cette application, et restez à l'écoute de toutes les actualités</p>
<%--
            <img src="images/greeting.jpg">
--%>
        </div>


            <div class="reservations">
                <!------------------ History Table -------------------->
<section>

  <h1>Résérvations d'aujoud'hui</h1>
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
    
  </div><br><br>
         <a href="dayReservation?weekReservation=smtn"   onclick="if(!(confirm('Accéppter les 30 premiers Résérvations!!')))return false"><button class="btn btn-success">Gérer les Résérvations d'aujourd'hui</i></button></a>
  
</section>

            </div>


        <div class="Inscriptions">
            <h1>Inscriptions</h1>
            <ol>
        <c:forEach  items="${preInsc}" var="preInscription">
                <li>${ preInscription.nom } ${ preInscription.prenom }
 </li>
                <span><a href="Dashboard?id_accepteInscription=${ preInscription.idUtilisateur }"onclick="if(!(confirm('Est ce que vous êtes sure d'accépter cette inscription??')))return false"><button class="btn btn-success"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></button></a> <a href="Dashboard?id_rejectInscription=${ preInscription.idUtilisateur }" onclick="if(!(confirm('Est ce que vous êtes sure de Rejeter cette inscription??')))return false"><button class="btn btn-danger"><i class="fa fa-times-circle-o" aria-hidden="true"></i></button></a></span>
<br>
<br>
        </c:forEach> 
            </ol>
        </div>

    </div>
</main>




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
