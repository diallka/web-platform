<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenue dans votre espace personnel</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
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
	<div class="success">
		<div style="float: right">
			<a href="<c:url value="/accueil" />">Accueil</a>
		</div>
		Hello <strong>${utilisateur}</strong>: ${bienvenue} <br /> Test:
		${test} <br /> <a href="<c:url value="/logout" />">Déconnexion</a>
	</div>

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

		<script>
    var map;
    var details;
    var details2 = "";
    var km;
    var id;
    var idClient;
    var prixTotal;
    var destination; 
    var marker1;
    var marker2;
    var recupMarker; //Markers avec coordonées recupérées en bdd viaAjax

    function initMap() {
    	   var details ="";
            var lille = {lat: 50.634032, lng: 3.061574};
            var bruxelles = {lat: 50.847151, lng: 4.355476};
              map = new google.maps.Map(document.getElementById('map'), {
              center: lille,
              scrollwheel: false,
              zoom: 13
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
                      marker1 = new google.maps.Marker({
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
              function test(){		
              						 $.getJSON('${pageContext.request.contextPath}/map/users/liste', function(donnees) {
              							
              							 console.log(donnees.length); //Nombre d'objets recupérés
              							
              							
              							 $(donnees).each(function(index, user) {
              								
                   								$('#details').html(user.firstName + user.latitude + user.longitude );
                   							
              								
			          			             console.log(user.firstName, user.latitude, user.longitude);
			          			              

							//**************************************************************************

										function addMarker(location) {
			          			                recupMarker = new google.maps.Marker({
			          			                position: location,
			          			                map: map,
			          			                title: '',
			          			              	animation: google.maps.Animation.DROP, //Animation marqueurs
			          			              	draggable: true,
			          			                icon: '<c:url value="/static/images/car.png"/>'
			          			                
			          			                
										  });
										}
										
										 var infowindow5 = new google.maps.InfoWindow({
								                content:
								                        'test'
								                       
								            });
						   //**********************************************************************************
										function TestMarker() {
									           emplacement = new google.maps.LatLng(user.latitude, user.longitude);
									           addMarker(emplacement);
									    }
										//detail à revoir
          		                    	details = details + user.firstName
                    					  + user.latitude
                    					  + user.longitude
						   //************************************************************************************
						   				//On exécute la fonction
										TestMarker();  
										recupMarker.addListener('click', function () {
		          		                     //$("#details").html(details); //Au clic on affiche le détail définit en dessous
		          		                    	console.log(details);
		          		                      
											infowindow5.open(map, recupMarker);
											
		          		                  });
										
							//**********************************************************************************			 
			          			            });
              							 
								        });
              						 
              						 }
              
              						 test();
              						
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