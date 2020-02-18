<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  <link href="css/uploadFotocss.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  
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
 

 <div class="profile-img">
 <c:if test="${utente.getFotoProfilo() == null}">
  <img class="profile-thumb" src="https://tinyurl.com/kdc5vlp" id="bannerImg" />
  </c:if>
  
  <c:if test="${utente.getFotoProfilo() != null}">
  <img class="profile-thumb" src="${utente.getFotoProfilo()}" id="bannerImg" />
  </c:if>
  
  <div class="upload">
    <div class="upload-button"><img src="https://tinyurl.com/mrphx9r" alt="" /></div>
    <input type="hidden" id = "nomeUtente" value = "${utente.getMail()}"></input>
    <script src="js/uploadFoto.js"></script>

  </div>
</div>



     <!--<div class="col-md-2">
        <img class="img-fluid" src="${utente.getFotoProfilo()}" alt="">
        <div class = "my-2">
    	<button type="button" class="btn btn-primary" >Carica foto profilo</button>
		</div>
      </div>   --> 
     
    
      
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
      
      <div class="col-md-4">
      	<h3>Il mio abbonamento</h3>

      	<c:if test="${utente.getTessera() == null }">

    		<button type="button" class="btn btn-primary" onclick = "window.location.href = 'pricing.jsp';">Attiva abbonamento</button>

		</c:if>
		<c:if test="${utente.getTessera() != null}">
    		<b>ID: </b>
        	<a>${utente.getTessera().getID()}</a>
        	<br>
        	<b>Data di iscrizione: </b>
        	<a>${utente.getTessera().getIscrizione()}</a>
        	<br>
        	<b>Data di scadenza: </b>
        	<a>${utente.getTessera().getScadenza()}</a>
        	<br>
		</c:if>
		
		

		<c:if test="${utente.getTessera() != null}">
		<div class="my-3">

      		<h3>I corsi che segui:</h3>
      		<c:if test="${utente.getTessera().getCorsi().isEmpty()}">
      		<div class="my-4"> 
      			<br>
      			<a>Non segui alcun corso</a>
      			<br>
      			<!-- <button type="button" class="btn btn-primary" onclick = "window.location.href = 'index.jsp';">Visualizza corsi disponibili</button>  -->
      		</div>
      		</c:if>
      		<c:if test="${!utente.getTessera().getCorsi().isEmpty()}">
      			 <c:forEach items="${utente.getTessera().getCorsi()}" var="corso">
    				<table class="table table-bordered table-dark mx-0 my-2 text-center container" style=" width: 300px; height : 50px">
						<thead>
							<tr>
								<th  scope="col">
								<a href="ReindirizzaCorso?corso=${corso.getNome()}" style = "color: yellow;">${corso.getNome()}</a>	
									</th>
								
		    										
		    				</tr>
		    				
								
						</thead>
 					</table>
 				</c:forEach>
      		</c:if>
      		</div>
      	</c:if>
			
      </div>
      
      <div class="my-5 col-md-6"> 
      	
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

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
