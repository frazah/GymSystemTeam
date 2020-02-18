<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="js/mostraNotifiche.js"></script>
  <script src="js/nascondiNotifiche.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Gym System</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/ProfiloAdmin.css" rel="stylesheet" type="text/css">
  

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
	
  <!-- Navigation -->
  <c:if test="${utente.getClass().getSimpleName().equals('Admin')}">
  	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" style = "background-color:#45008a;">
  </c:if>
    
  <c:if test="${!utente.getClass().getSimpleName().equals('Admin')}">
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  </c:if>
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

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Profilo
      <small>${utente.getNome()} ${utente.getCognome()}</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.jsp">Homepage</a>
      </li>
      <li class="breadcrumb-item active">Profilo</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-2">
        <img class="img-fluid" src="${utente.getFotoProfilo()}" alt="">
        <div class = "my-2">
    	<button type="button" class="btn btn-primary" >Carica foto profilo</button>
		</div>
      </div> 
     
      
      
      <div class="col-md-6">
        <h2>Le mie informazioni</h2>
        	<b>Nome: </b>
        	<a>${utente.getNome()}</a>
        	<br>
        	<b>Cognome: </b>
        	<a>${utente.getCognome()}</a>
        	<br>
        	<b>Mail: </b>
        	<a>${utente.getMail()}</a>

      </div>
      
      
		<div class="col-md-3">
		
      		<h3 class = "my-3">Gestione sistema</h3>
      		<div class="my-3">
      			<button type="button" class="btn btn-primary" onclick = "window.location.href = 'GestioneCorsiAdmin';">Gestisci corsi e trainer</button>
      		</div>
      		
     	</div> 
      

    </div>
    <!-- /.row -->
    <div id = "notifiche" class = "my-5 col-md-6">
    <button type="button" class="btn btn-primary" onclick="mostraNotifiche()">Mostra notifiche</button>
    </div>
    
    

  </div>
  <!-- /.container -->

  <!-- Footer -->
   <c:if test="${utente.getClass().getSimpleName().equals('Admin')}">
  	<footer class="fixed-bottom py-5 "style = "background-color:#45008a;">
  </c:if>
    
  <c:if test="${!utente.getClass().getSimpleName().equals('Admin')}">
  <footer class="fixed-bottom py-5 bg-dark">
  </c:if>
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; GymSystem 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
