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
	<br>
	<br>
	<!-- ************************************************************* -->
	<div id="map"></div>
	<script>
		var marker;
		var infowindow;
		var marker1;
		var infowindow1;
		var details;
		function initMap() {
			var details = "";
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 13,
				center : {
					lat : 50.634032,
					lng : 3.061574
				}
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
					position : {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					},
					map : map,
					title : 'Geolocalisé',
				});
				infowindow1 = new google.maps.InfoWindow({
					content : "Ma position géolocalisée"
				});
				marker1.addListener('click', function() {
					infowindow1.open(map, marker1);
				});
			}
			infowindow = new google.maps.InfoWindow({
				content : "Position prédéfinie"
			});
			marker = new google.maps.Marker({
				map : map,
				draggable : true,
				content : 'Contenu',
				animation : google.maps.Animation.DROP,
				position : {
					lat : 50.634032,
					lng : 3.061574
				},
			});
			marker.addListener('click', clicMarker);

		}

		function clicMarker() {
			infowindow.open(map, marker);

		}

		details = details + 'Nom: ${listUsers} <br/>'
				+ 'Prenom: ${abdoul.lastName} <br/>'
				+ 'Age: ${abdoul.age} <br/>' + 'E-mail: ${abdoul.email} <br/>'
				+ 'Pays:  ${abdoul.country} <br/>'
				+ 'Lattitude:  ${abdoul.latitude} <br/>'
				+ 'Longitude:  ${abdoul.longitude} <br/>'
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC95GpgAzzfx4qDEDw-_G76aMlpwtvoSc&callback=initMap"
		async defer>
		
	</script>
	<%--     <script src="<c:url value="/static/js/testMap.js"/>"></script>  --%>
</body>
</html>