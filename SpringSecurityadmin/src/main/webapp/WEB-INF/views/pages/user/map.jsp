
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<link href="<c:url value='/static/css/map.css' />" rel="stylesheet"></link>

 <div id="map"></div>
 
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
			var recupMarker; //Markers avec coordon�es recup�r�es en bdd viaAjax

			function initMap () {
				//var details ="";
					if ( navigator.geolocation ) {
						navigator.geolocation.getCurrentPosition( function ( position ) {
							initialLocation = new google.maps.LatLng( position.coords.latitude , position.coords.longitude );
							map.setCenter( initialLocation );
						} );
					}

					map = new google.maps.Map( document.getElementById( 'map' ) ,
						{
							scrollwheel : false ,
							zoom : 12
						} );

					//On gere la g�olocalisation
					if ( navigator.geolocation ) {
						navigator.geolocation.getCurrentPosition( showPosition );
					}
					else {
						document.getElementById( "position" ).innerHTML = "La geolocation n'est pas support�e par votre navigateur.";
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
								title : 'Geolocalis�' ,
								icon : '<c:url value="/static/images/user_m.jpg"/>'
							} );
						var infowindow1 = new google.maps.InfoWindow(
							{
								content : "Ma position g�olocalis�e"
							} );
						marker1.addListener( 'click' , function () {
							infowindow1.open( map , marker1 );
						} );
					}
					//***************************************************************************

					//On lance une requete ajax pour recuperer les donn�es
					$.ajax(
						{
							type : "GET" ,
							contentType : "application/json" ,
							url : "${pageContext.request.contextPath}/map/users/liste" ,
							dataType : 'json' ,
							//timeout : 100000,
							//Si tout se passe bien on le g�re ici
							success : function ( donnees ) {

								//pour chaque donn�e on r�cup�re l'index et l'utilisateur correspondant
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
											draggable : false ,
											icon : '<c:url value="/static/images/user_f.jpg"/>'

										} );

									recupMarker.addListener( 'click' , function () {
										$( "#details" ).html( details ); //Au clic on affiche le d�tail d�finit en dessous

										//detail � revoir
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
 