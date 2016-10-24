  var map;
    var details;
    var details2 = "";
    var km;
    var id;
    var idClient;
    var prixTotal;
    var destination; 

    function initMap() {
    		var details = "";
            var lille = {lat: 50.634032, lng: 3.061574};
            var bruxelles = {lat: 50.847151, lng: 4.355476};

              map = new google.maps.Map(document.getElementById('map'), {
              center: lille,
              scrollwheel: false,
              zoom: 8
            });
              
              //On gere la géolocalisation
              if (navigator.geolocation) {
                  navigator.geolocation.getCurrentPosition(showPosition);
              } else {
                  document.getElementById("position").innerHTML = "La geolocation n'est pas supportée par votre navigateur.";
              };
              
              //On gere notre position en y ajoutant Marqueurs....
              function showPosition(position) {
                  var marker = new google.maps.Marker({
                      position: {lat: position.coords.latitude, lng: position.coords.longitude},
                      map: map,
                      title: 'moi',
                      icon: '<c:url value="/static/images/marker.png"/>'
                  });
                  var infowindow = new google.maps.InfoWindow({
                      content: "Ma position"
                  });
                  marker.addListener('click', function () {
                      infowindow.open(map, marker);
                  });
              }

//            var directionsDisplay = new google.maps.DirectionsRenderer({
//              map: map
//            });

            // Set destination, origin and travel mode.
            var request = {
              destination: bruxelles,
              origin: lille,
              travelMode: 'DRIVING'
            };

            // Pass the directions request to the directions service.
            var directionsService = new google.maps.DirectionsService();
            directionsService.route(request, function(response, status) {
              if (status == 'OK') {
                // Display the route on the map.
                directionsDisplay.setDirections(response);
              }
            });
          }