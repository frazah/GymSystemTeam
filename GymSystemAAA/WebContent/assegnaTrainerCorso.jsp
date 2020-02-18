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




<div class="my-5 text-center container" style="width: 500px; height: 500px">
    <form method="POST" action="AssegnaTrainerCorso" onsubmit="return confirm('Sei sicuro di voler assegnare questo trainer al corso?')">
        <div class="form-group col-xl-auto" >
        <h1>Seleziona Trainer da assegnare:</h1>
        <c:if test = "${trainerDisponibili.isEmpty()}">
        <a> Nessun Trainer libero disponibile </a>
        </c:if>
        <select name="trainer">
        <c:forEach items="${trainer}" var="trainer" varStatus="loop">
        	<c:if test="${trainer.getCorso() == null}">
        		<option value="${loop.index}">${trainer.getNome()} ${trainer.getCognome()}</option>
        	</c:if>
        </c:forEach>
        </select>
        </div>
        <div class="form-group col-xl-auto">
        <input type = "hidden" name = "corso" value = ${param.corso} >
            <button type="submit" class="btn btn-primary">Assegna trainer</button>
        </div>
    </form>
    

</div>





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
