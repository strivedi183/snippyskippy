var map;
var markers = [];

function display_map(lat, long, zoom)
{
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_client_marker(client_lat, client_long, client_name)
{
  var latlng = new google.maps.LatLng(client_lat, client_long, client_name);
  var marker = new google.maps.Marker({position: latlng, map: map, title: client_name});
  markers.push(marker);
}

function add_salon_marker(salon_lat, salon_long, salon_name)
{
  var latlng = new google.maps.LatLng(salon_lat, salon_long, salon_name);
  var marker = new google.maps.Marker({position: latlng, map: map, title: salon_name});
  markers.push(marker);
}

function add_path(lat1, lon1, lat2, lon2)
{
  var coordinates = [
    new google.maps.LatLng(lat1, lon1),
    new google.maps.LatLng(lat2, lon2)
  ];

  var path = new google.maps.Polyline({
    path: coordinates,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  path.setMap(map);
}

function clear_markers()
{
  _.each(markers, function(m){m.setMap(null);});
  markers = [];
}