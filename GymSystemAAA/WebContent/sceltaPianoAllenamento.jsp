<%@page import="it.mat.unical.persistence.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List" %>
<%@ page import="it.mat.unical.ingsw.model.Corso" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Gym System</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
	
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Gym System</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="contact.jsp">Chi siamo</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="SchedaOrari">Corsi</a>
          </li>
          <li class="nav-item">
          	<c:if test="${utente == null}">
    			<a class="nav-link" href="loginPage.jsp">Accedi</a>
			</c:if>
			<c:if test="${utente != null}">
				<c:if test="${utente.getClass().getSimpleName().equals('Atleta')}">
    			<a class="nav-link" href="ScadenzaTessera">Il mio profilo</a>
    			</c:if>
    			<c:if test="${utente.getClass().getSimpleName().equals('Trainer')}">
    			<a class="nav-link" href="profiloTrainer.jsp">Il mio profilo</a>
    			</c:if>
    			<c:if test="${utente.getClass().getSimpleName().equals('Admin')}">
    			<a class="nav-link" href="profiloAdmin.jsp">Il mio profilo</a>
    			</c:if>
    			
    			 <li class="nav-item">
    			<a class="nav-link" href="Login?logout=true">Logout</a>
			</c:if>
          </li>

        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcr. -->
    <h1 class="mt-4 mb-3">Selezione Piano</h1>

    	<ol class="breadcrumb">
      		<li class="breadcrumb-item">
        		<a href="index.jsp">Homepage</a>
      		</li>
      		<li class="breadcrumb-item active">Profilo</li>
    	</ol>
    	
    	<div class="my-5 col-md-6">
	  		<h2>Seleziona i corsi da attribuire alla tua tessera:</h2>
	  		<br>

  		</div>
      	
      	<div id="showError" class="col-md-6" style="color: red"><h5>Seleziona esattamente 3 corsi!</h5></div>
      	
      	<form method="POST" action="RegistraPianoAllenamento">
      		<div class="my-5 col-md-12"> 
			    <div class="row">
				  	<%
						List<Corso> corsi = DBManager.getInstance().getCorsoDAO().findAll();
					%>
					
					<%
						for(Corso c: corsi) {
						%>
							<div class="col-5">
							     <div class="form-check form-check-group">
							        <input class="checks" id="checkbox" type="checkbox" name="boxes" value=<%=c.getNome()%>>
							        <label for="checkbox"><b><%=c.getNome()%></b>
							       
							         
							         </label>
							     </div>
						     </div>
						<%
						}
					%>
			  	</div>
	 		</div>
	 	
		 	<div class = "col-md-12 text-center" style="padding-bottom: 20px;">
	    		<button id="submit" type="submit" value="Submit" class="btn btn-primary">Conferma piano</button>
	    	</div>
	  	</form>
			
  	</div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
   <footer class="fixed-bottom py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; GymSystem 2020</p>
    </div>
    <!-- /.container -->
  </footer>
  
  <script>
  $('#submit').prop("disabled", true);
  $('#showError').hide();
  $('input:checkbox').click(function() {
   if ($(this).is(':checked')) {
   $('#submit').prop("disabled", false);
   }
   
   if ($('.checks').filter(':checked').length != 3) {
	   $('#showError').show();
	   $('#submit').attr('disabled',true);
   }
   
   if ($('.checks').filter(':checked').length == 3) {
	   $('#showError').hide();
	   $('#submit').attr('disabled',false);
   }
  });
  </script>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>