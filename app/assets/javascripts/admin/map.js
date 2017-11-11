// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
function initMap() {
  
  var map, myLatlng, myOptions, marker;
  var currentLocation = window.location.href.split("/");

  if ( currentLocation[4] == 'places' 
          && currentLocation[6] == 'edit' ) {

    var latitude = document.getElementById("place_latitude").value;
    var longitude = document.getElementById("place_longitude").value;
    
    myLatlng = new google.maps.LatLng( latitude, longitude);

    myOptions = {
        zoom: 16,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById("map"), myOptions);
    
    marker = new google.maps.Marker({
        draggable: true,
        position: myLatlng,
        map: map,
        title: "Mi Ubicación"
    });

    google.maps.event.addListener(marker, 'drag', function (event) {
      document.getElementById("place_latitude").value = event.latLng.lat();
      document.getElementById("place_longitude").value = event.latLng.lng();
    });

  }else{
    myLatlng = new google.maps.LatLng(16.85933, -99.87224);

    myOptions = {
        zoom: 14,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map"), myOptions);
  }
  


  // Autocompletar
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {

    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }
      
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      document.getElementById("place_latitude").value = place.geometry.location.lat();
      document.getElementById("place_longitude").value = place.geometry.location.lng();
      document.getElementById("place_direccion").value = place.formatted_address;
      document.getElementById("place_lugar").value = place.name;

      var newMarker = new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        draggable: true,
        position: place.geometry.location
      });

      markers.push( newMarker );

      google.maps.event.addListener(newMarker, 'drag', function (event) {
        document.getElementById("place_latitude").value = event.latLng.lat();
        document.getElementById("place_longitude").value = event.latLng.lng();
      });

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });

    map.fitBounds(bounds);
    
  });
  
  // Previniendo el Enter
  google.maps.event.addDomListener(input, 'keydown', function(event) { 
    if (event.keyCode == 13) { 
        event.preventDefault(); 
        event.stopPropagation();
    }
  }); 

}
