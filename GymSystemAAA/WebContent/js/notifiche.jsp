
    	<div class = "my-3">
    	<h2>Richieste:</h2>
    	</div>
    		<c:if test="${utente.getRichieste().isEmpty()}">
    		<a>Non ci sono richieste</a>
    		</c:if>
    		<c:if test="${utente.getRichieste().size() > 0}">
    		<b class = "nMessaggio" id = "1">Messaggio pi� recente: </b>
    		<div> <a class = "messaggio">${utente.getRichieste().get(utente.getRichieste().size()-1)}</a></div>
    		</c:if>
    		<c:if test="${utente.getRichieste().size() > 1}">
    		<br>
    		<b class = "nMessaggio" id = "2">Messaggio 2: </b>
    		<div> <a class = "messaggio">${utente.getRichieste().get(utente.getRichieste().size()-2)}</a></div>
    		</c:if>
    		<c:if test="${utente.getRichieste().size() > 2}">
    		<br>
    		<b class = "nMessaggio" id = "3">Messaggio 3: </b>
    		<div> <a class = "messaggio">${utente.getRichieste().get(utente.getRichieste().size()-3)}</a></div>
    		</c:if>
