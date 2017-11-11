// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
function welcomeMap() {
  
  options = {   
    center: new google.maps.LatLng(16.8638,-99.8816),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var bounds = new google.maps.LatLngBounds();

  var map = new google.maps.Map(document.getElementById('principalMap'), options);
  var infowindow = new google.maps.InfoWindow();

  $.getJSON("welcome/get_locations.json", function( markers ){ 
    
    var marker, i;


    for (i = 0; i < markers.length; i++) { 

      var myLatLng = new google.maps.LatLng(markers[i][1], markers[i][2]);
      bounds.extend(myLatLng);
      
      marker = new google.maps.Marker({
        position: myLatLng,
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(markers[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));

      map.fitBounds(bounds);

    }

  });    

}
