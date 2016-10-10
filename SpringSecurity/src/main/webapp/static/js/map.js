function initMap() {
        var lille = {lat: 50.634032, lng: 3.061574};
        var bruxelles = {lat: 50.847151, lng: 4.355476};

        var map = new google.maps.Map(document.getElementById('map'), {
          center: lille,
          scrollwheel: false,
          zoom: 7
        });

        var directionsDisplay = new google.maps.DirectionsRenderer({
          map: map
        });

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
