<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<!-- The stylesheet contains specific styles for displaying the map
         on this page. Replace it with your own styles as described in the
         documentation:
         https://developers.google.com/maps/documentation/javascript/tutorial 
         https://developers.google.com/maps/documentation/javascript/demos/demos.css -->
<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
<%-- <script src="<c:url value="/static/js/map.js"/>"></script> --%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<h2>Carte google Map</h2>
	<!--  Test image
   <img src="<c:url value="/static/images/marker.png"/> " ></img> -->
	<!-- ************************************************************ -->
	Details:
	<div id="historique"></div>

	<div id="details">
		<div id="reponse">${reponse}</div>
	</div>
	<br/>
	<h2>R�cup�rer les utilisateurs en bdd</h2>
		<input type="submit" id="recupUsers" value="C'est parti !" /><br />
		<br />
		<div id="usersResponse"></div>
	<br/>
	<!-- ************************************************************* -->
	<div id="map"></div>
	<script>
	//Mettre les variables en dehors des fonctions nous permet de les reutiliser dans une autre fonction
	  // Global scope....
		var marker;
		var infowindow;
		var marker1;
		var infowindow1;
		var details = "Oui ";
		var map;
		
		//***********************************************************************************************
		function initMap() {
			    map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : {
					lat : 50.634032,
					lng : 3.061574
				}
			});
			//On gere la g�olocalisation en sp�cifiant la fonction qui la g�re
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(afficherMarkers);
			} else {
				document.getElementById("position").innerHTML = "La geolocation n'est pas support�e par votre navigateur.";
			};

		}//Fin fonction initMap()
			
		//On recupere la position g�olocalis�
			function afficherMarkers(position) {
				//marker g�olocalis�
				marker = new google.maps.Marker({
					map : map,
					position : {
						lat : 50.630183,
						lng : 3.094569
					},
				});
				marker.addListener('click', clicMarkerGeoloc);
				//marker personnalis�
				marker1 = new google.maps.Marker({
					map : map,
					draggable : true,
					position : {
						lat : 50.630618,
						lng : 3.137142
					},
				});
				marker1.addListener('click', clicMarkerPersonnalise);
				//On d�finit l'info window correspondant ici pour �viter qu'il s'afficher en boucle
				infowindow1 = new google.maps.InfoWindow({
					content : "Position personnalis�e"});
			}//fin fonction afficherMarkers()
			
			//On g�re le clic sur le marker g�olocalis�
			function clicMarkerGeoloc(){
				infowindow = new google.maps.InfoWindow({
					content : "Ma position g�olocalis�e"});
				infowindow.open(map, marker);
			}// fin fonction clicMarkerGeoloc()
			
			
			//On g�re le clic sur le marker personnalis�
			function clicMarkerPersonnalise(){
				
				infowindow1.open(map, marker1);
				
				$("#details").html(details);
				
				
			}// fin fonction clicMarkerGeoloc()

			 details = details    +'Nom: ${listUsers} <br/>'
								  +'Prenom: ${abdoul.lastName} <br/>'
								  +'Age: ${abdoul.age} <br/>'
								  +'E-mail: ${abdoul.email} <br/>'
				                  +'Pays:  ${abdoul.country} <br/>'
				                  +'Lattitude:  ${abdoul.latitude} <br/>'
				                  +'Longitude:  ${abdoul.longitude} <br/>'
	</script>
	<script type="text/javascript">
       $(document).ready(function(){
    	   
		$("#recupUsers").click(function(e) {

			// On evite le comportement par defaut du submit.
			e.preventDefault();
			recupViaAjax();

		});
	});

	function recupViaAjax() {
		//On initialise la variable de donn�es qu'on recuperera dans un tableau vide
		var donnees = [];
		
		//On lance une requete ajax pour recuperer les donn�es
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/map/users/liste",
			dataType : 'json',
			//timeout : 100000,
			//Si tout se passe bien on le g�re ici
			success : function(donnees) {
				  //pour chaque donn�e on r�cup�re l'index et l'utilisateur correspondant
				  $.each(donnees, function(index, user) {
			             console.log(user.lastName, user.latitude, user.longitude);
			            
			         });  
			},
			//S'il y a erreur ...
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			//Quand tout est fini
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC95GpgAzzfx4qDEDw-_G76aMlpwtvoSc&callback=initMap"
		async defer>
		
	</script>
	<%--     <script src="<c:url value="/static/js/testMap.js"/>"></script>  --%>
</body>
</html>