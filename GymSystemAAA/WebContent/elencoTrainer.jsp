<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

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

    

   

    <!-- Team Members -->
    <div class="py-3">
      <h2>I nostri Trainer</h2>
    </div>

	<div class="card-deck " >
	<div class = "row">
	<c:forEach items="${trainer}" var="trainer">

      <div class = "col-md-6 mb-4">
        <div class="card h-200 text-center">
          <img class="card-img-top" src="${trainer.getFotoProfilo()}" alt="">
          <div class="card-body" >
            <h4 class="card-title">${trainer.getNome()} ${trainer.getCognome()}</h4>
            <c:if test="${trainer.getCorso() != null}">
            <h6 class="card-subtitle mb-2 text-muted"> <a href="ReindirizzaCorso?corso=${trainer.getCorso().getNome()}"> ${trainer.getCorso().getNome()}</a> </h6>
            </c:if>
          </div>
          <div class="card-footer">
            <a href="mailto:${trainer.getMail()}">${trainer.getMail()}</a>
          </div>
        </div>
     </div>
      </c:forEach>
      </div>
       </div>
   



  </div>
  <!-- /.container -->

<!-- Footer -->
<c:if test="${utente.getClass().getSimpleName().equals('Admin')}">
  	<footer class=" py-5 "style = "background-color:#45008a;">
  </c:if>
    
  <c:if test="${!utente.getClass().getSimpleName().equals('Admin')}">
  <footer class=" py-5 bg-dark">
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