function mostraInfoCorso() {
	
	var asyncRequest;    
	var nomeCorso = document.getElementById("nomeCorso").value;

	function start(){
	    try
	    {
	        asyncRequest = new XMLHttpRequest();
	        asyncRequest.addEventListener("readystatechange", stateChange, false);
	        asyncRequest.open('GET', 'InfoCorso?corso=' + nomeCorso, true);    
	        asyncRequest.send(null);
	    }
	    catch(exception)
	   {
	    alert("Request failed");
	   }
	}

	function stateChange(){
	if(asyncRequest.readyState == 4 && asyncRequest.status == 200)
	    {
	    var text = document.getElementById("infoCorso"); 
	    
	    text.innerHTML = asyncRequest.responseText;         
	    }
	}

	window.addEventListener("load", start(), false);
	
}