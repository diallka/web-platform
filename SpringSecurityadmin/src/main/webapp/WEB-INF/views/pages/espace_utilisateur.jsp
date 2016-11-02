<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenue dans votre espace personnel</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="success">
		<div style="float: right">
			<a href="<c:url value="/logout" />">Déconnexion</a>
		</div>
		Date d'inscription: ${user.date_inscription} <br /> Hello <strong>${utilisateur}</strong>: ${bienvenue} <br /> Test: ${test} <br />
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
			var details1 = "";
			var details2 = "";
			var km;
			var id;
			var idClient;
			var prixTotal;
			var destination;
			var marker1;
			var marker2;
			var recupMarker; //Markers avec coordonées recupérées en bdd viaAjax

			function initMap () {
				//var details ="";
				var lille =
					{
						lat : 50.634032 ,
						lng : 3.061574
					};
				var bruxelles =
					{
						lat : 50.847151 ,
						lng : 4.355476
					};
				map = new google.maps.Map( document.getElementById( 'map' ) ,
					{
						center : lille ,
						scrollwheel : false ,
						zoom : 13
					} );

				//On gere la géolocalisation
				if ( navigator.geolocation ) {
					navigator.geolocation.getCurrentPosition( showPosition );
				}
				else {
					document.getElementById( "position" ).innerHTML = "La geolocation n'est pas supportée par votre navigateur.";
				}
				;

				//On gere notre position dans une fonction en y ajoutant Marqueurs....
				//**************************************************************************************
				function showPosition ( position ) {
					marker1 = new google.maps.Marker(
						{
							position :
								{
									lat : position.coords.latitude ,
									lng : position.coords.longitude
								} ,
							map : map ,
							title : 'Geolocalisé' ,
							icon : '<c:url value="/static/images/marker.png"/>'
						} );
					var infowindow1 = new google.maps.InfoWindow(
						{
							content : "Ma position géolocalisée"
						} );
					marker1.addListener( 'click' , function () {
						infowindow1.open( map , marker1 );
					} );
				}
				//***************************************************************************

				//               function test(){
				//               						 $.getJSON('${pageContext.request.contextPath}/map/users/liste', function(donnees) {
				//               							 $.each(donnees, function(index, user) {
				//               								 //index = (index + 1) % donnees.length ;
				// 			          			             	console.log(user.id, user.firstName, user.latitude, user.longitude);
				// 			          			              details1 = details1 
				// 								          	                    + "Nom: " + user.lastName + " Prenom: " + user.firstName + " Age: " + user.age + " ans " + "<br>";

				// 			          			             $('#details').html(details1);

				// //			          			             
				// 										function addMarker(location) {
				// 			          			                recupMarker = new google.maps.Marker({
				// 			          			                position: location,
				// 			          			                map: map,
				// 			          			                title: '',
				// 			          			              	animation: google.maps.Animation.DROP, //Animation marqueurs
				// 			          			              	draggable: true,
				// 			          			                icon: '<c:url value="/static/images/car.png"/>'

				// 										  });
				// 										}

				// 										 var infowindow5 = new google.maps.InfoWindow({
				// 								                content:
				// 								                        'test'

				// 								            });
				// 						   //**********************************************************************************
				// 										function TestMarker() {
				// 									           emplacement = new google.maps.LatLng(user.latitude, user.longitude);
				// 									           addMarker(emplacement);
				// 									    }

				// 						   //************************************************************************************
				// 						   				//On exécute la fonction
				// 										TestMarker();  

				// 										recupMarker.addListener('click', function () {

				//  		          		                    		console.log(details2);

				// 		          		                    		details2 = details2
				// 					          		                    		+ user.firstName
				// 					                    					  	+ user.latitude
				// 					                    					  	+ user.longitude

				// 		          		                  });
				// 							//**********************************************************************************			 
				// 			          			            });
				// 								        });
				//               						 }
				//               						 test();

				//On lance une requete ajax pour recuperer les données
				$.ajax(
					{
						type : "GET" ,
						contentType : "application/json" ,
						url : "${pageContext.request.contextPath}/map/users/liste" ,
						dataType : 'json' ,
						//timeout : 100000,
						//Si tout se passe bien on le gère ici
						success : function ( donnees ) {

							//pour chaque donnée on récupère l'index et l'utilisateur correspondant
							$.each( donnees , function ( index , user ) {

								console.log( user.lastName , user.latitude , user.longitude );
								recupMarker = new google.maps.Marker(
									{
										position :
											{
												lat : user.latitude ,
												lng : user.longitude
											} ,
										map : map ,
										title : '' ,
										animation : google.maps.Animation.DROP , //Animation marqueurs
										draggable : true ,
										icon : '<c:url value="/static/images/car.png"/>'

									} );

								recupMarker.addListener( 'click' , function () {
									$( "#details" ).html( details ); //Au clic on affiche le détail définit en dessous

									//detail à revoir
									details = details + user.lastName + user.latitude + user.longitude
									console.log( details );
								} );
							} );

						} ,
						//S'il y a erreur ...
						error : function ( e ) {
							console.log( "Erreur: " , e );
							display( e );
						} ,
						//Quand tout est fini
						done : function ( e ) {
							console.log( "Ok!" );
						}
					} );

				//*******************************************************************************

			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC95GpgAzzfx4qDEDw-_G76aMlpwtvoSc&callback=initMap" async defer>
			
		</script>
		<!-- ***************************************************************************** -->
</body>
</html>