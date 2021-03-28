<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="resources/CSS/Apprenant.css">
<title>Apprenant</title>
</head>
<body>
<%--
//delete cash
response.setHeader("Cache-Control","no-cache, no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

    //if sesion is null redirection
    if (session.getAttribute("id") == null){
        response.sendRedirect("index.jsp");
    }
--%>

<section class="reservationSection">
		<form action="reservation" >
		<h1>Apprenant ${ apprenant.nom } ${ apprenant.prenom }</h1>
		
			<input type="date" name="date"><br><br>
			<select name="t_reservation">
			<option value="">--Please choose an option--</option>
			<option value="Weekend">Weekend</option>
			<option value="Normal">Normal</option>
			</select><br><br>
			<input type="submit">
		</form>
</section>

  <!------------------ History Table -------------------->
<section>

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
</section>


<script type="text/javascript">
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>

</body>
</html>