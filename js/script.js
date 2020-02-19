var toulon = { lat: 43.125494, lng: 5.926464 };

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: toulon,
        zoom: 15
    });
    var marker = new google.maps.Marker({ position: toulon, map: map });
}