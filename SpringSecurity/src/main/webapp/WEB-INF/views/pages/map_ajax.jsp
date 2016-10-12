<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Spring MVC - Ajax</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style>
body {
	background-color: #eee;
	font: helvetica;
}

#container {
	width: 700px;
	background-color: #fff;
	margin: 30px auto;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 5px;
}

.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

label {
	width: 70px;
	display: inline-block;
}

.hide {
	display: none;
}

.error {
	color: red;
	font-size: 0.8em;
}
</style>
<!-- Style pour le tableau listant les personnes depuis la bdd -->
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
</head>
<body>
	<!-- ********************************************************************************* -->
	<div id="map"></div>
	<!-- ************************************************************************************** -->

	<div id="container">
		
		<!-- ************************************************************ -->
		<div id="historique"></div>

		<div id="details">
			<div id="reponse">${reponse}</div>
		</div>
		<br> <br>
		<!-- ************************************************************* -->
		<h1>Page Demo Spring Mvc Ajax</h1>
		<p>
			Cet exemple démontre la puissance de la fonctionnalité Ajax de Spring
			MVC. <br /> Retrouver une personne en utilisant la fonction Random,
			<br /> Retrouver une personne par son id, <br /> ou ajouter une
			nouvelle personne, tout cela sans actualiser la page.
		</p>

		<h2>Générer un Random depuis un tableau</h2>
		<input type="submit" id="randomPerson" value="C'est parti !" /><br />
		<br />
		<div id="personResponse"></div>

		<hr />

		<h2>Retrouver par ID</h2>
		<form id="idForm">
			<div class="error hide" id="idError">Entrez un id valide
				compris entre (valeur_min_id, valeur_max_id)</div>
			<label for="personId">ID (.-...): </label><input name="id"
				id="personId" value="0" type="number" /> <input type="submit"
				value="Valider" /> <br /> <br />
			<div id="personIdResponse"></div>

		</form>

		<hr />

		<h2>Ajouter une nouvelle personne</h2>
		<form id="newPersonForm">
			<label for="nameInput">Nom: </label> <input type="text" name="name"
				id="nameInput" /> <br /> <label for="ageInput">Age: </label> <input
				type="text" name="age" id="ageInput" /> <br /> <label
				for="countryInput">Pays: </label> <input type="text" name="country"
				id="countryInput" /> <br /> <label for="latitudeInput">Latitude:
			</label> <input type="text" name="latitude" id="latitudeInput" /> <br /> <label
				for="longitudeInput">Longitude: </label> <input type="text"
				name="longitude" id="longitudeInput" /> <br /> <input
				type="submit" value="Ajouter" /><br /> <br />
			<div id="personFormResponse" class="green"></div>
		</form>
		<!-- Essayer de rafraichir cette zone en utilisant Ajax pour recup données -->
		<h2>Liste des personnes disponibles dans la bdd</h2>
 <table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">NOM</th>
		<th width="120">PRENOM</th>
		<th width="120">AGE</th>
		<th width="120">EMAIL</th>
		<th width="120">PAYS</th>
		<th width="120">LATITUDE</th>
		<th width="120">LONGITUDE</th>
	</tr>
	<c:forEach items="${personnes}" var="user">
		<tr>
			<td>${user.id}</td>
			<td>${user.lastName}</td>
			<td>${user.firstName}</td>
			<td>${user.age}</td>
			<td>${user.email}</td>
			<td>${user.country}</td>
			<td>${user.latitude}</td>
			<td>${user.longitude}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<!-- *************************************************************************** -->

	<script>
    var map;
    var details;
    var details2 = "";
    var km;
    var id;
    var idClient;
    var prixTotal;
    var destination; 

    function initMap() {
    		var details ="";
            var lille = {lat: 50.634032, lng: 3.061574};
            var bruxelles = {lat: 50.847151, lng: 4.355476};
              map = new google.maps.Map(document.getElementById('map'), {
              center: lille,
              scrollwheel: false,
              zoom: 10
            });
              
              //On gere la géolocalisation
              if (navigator.geolocation) {
                  navigator.geolocation.getCurrentPosition(showPosition);
              } else {
                  document.getElementById("position").innerHTML = "La geolocation n'est pas supportée par votre navigateur.";
              };
              
              //On gere notre position dans une fonction en y ajoutant Marqueurs....
              //**************************************************************************************
              function showPosition(position) {
                  var marker1 = new google.maps.Marker({
                      position: {lat: position.coords.latitude, lng: position.coords.longitude},
                      map: map,
                      title: 'Geolocalisé',
                      icon: '<c:url value="/static/images/marker.png"/>'
                  });
                  var infowindow1 = new google.maps.InfoWindow({
                      content: "Ma position géolocalisée"
                  });
                  marker1.addListener('click', function () {
                      infowindow1.open(map, marker1);
                  });
              }
              //***************************************************************************
				 
				//Test avec marqueur cliquable directement
				 var marker2 = new google.maps.Marker({
                      //Test coordonnées initilisées dans le controleur
					  position: {lat: 50.634032, lng: 3.061574 },
                      map: map,
                      title: '${abdoul.firstName}',
                      icon: '<c:url value="/static/images/car.png"/>'
                  });
                  var infowindow2 = new google.maps.InfoWindow({
                      content: '${abdoul.firstName}'
                    	   			
                  });
                  marker2.addListener('click', function () {
                      infowindow2.open(map, marker2);
                      $("#details").html(details); //Au clic on affiche le détail définit en dessous
                  });
                  //On définit les détails qu'on revoit dans la div correspondante de notre JSP
                  details = details   +'Nom: ${abdoul.firstName} <br/>'
                  					  +'Prenom: ${abdoul.lastName} <br/>'
                  					  +'Age: ${abdoul.age} <br/>'
                					  +'E-mail: ${abdoul.email} <br/>'
					                  +'Pays:  ${abdoul.country} <br/>'
					                  +'Lattitude:  ${abdoul.latitude} <br/>'
					                  +'Longitude:  ${abdoul.longitude} <br/>'
              //*****************************************************************************

          }

    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC95GpgAzzfx4qDEDw-_G76aMlpwtvoSc&callback=initMap"
		async defer>
    </script>
	<!-- ***************************************************************************** -->
	<script type="text/javascript">
   
    $(document).ready(function() {
       
      // Faire un random par un request AJAX 
      $('#randomPerson').click(function() {
        $.getJSON('${pageContext.request.contextPath}/map/person/random', function(person) {
          $('#personResponse').text(person.name + ', age ' + person.age);
        });
      });
       
      // Retrouver une personne par son ID en utilisant  AJAX
      $('#idForm').submit(function(e) {
    	//On recupere la valeur de l'id depuis le formulaire
        var personId = +$('#personId').val();
        if(!validatePersonId(personId)) 
          return false;
        $.get('${pageContext.request.contextPath}/map/person/' + personId, function(person) {
          $('#personIdResponse').text(person.name + ', age ' + person.age);
        });
        e.preventDefault(); // évite le comportement par defaut du Submit---> qui pourrait reloader la page
      });
       
      // Ajouter une personne en utilisant  AJAX
      $('#newPersonForm').submit(function(e) {
        //On envoie les données du formulaire en utilisant la fonction Serialize de jQuery
        $.post('${pageContext.request.contextPath}/map/person', $(this).serialize(), function(response) {
          $('#personFormResponse').text(response);
        });
         
        e.preventDefault(); 
      });
       
    });
     
    function validatePersonId(personId) {
      console.log(personId);
      console.log("test");
      if(personId === undefined || personId < 0 || personId > personId.length) {
        $('#idError').show();
        return false;
      }
      else {
        $('#idError').hide();
        return true;
      }
    }
     
   
  </script>

</body>
</html>