var map;

function loadMap() {
	var gainesville = {lat: 29.6516, lng: -82.3248};
  map = new google.maps.Map(document.getElementById('map'), {
      zoom: 13,
      center: gainesville
    });

    var marker = new google.maps.Marker({
      position: gainesville,
      map: map
    });
    
    //Manipulation of database attributes
    var allData = JSON.parse(document.getElementById('allData').innerHTML);
    var driverData = JSON.parse(document.getElementById('allVehicule').innerHTML);
    var vehiculeData = JSON.parse(document.getElementById('allDriver').innerHTML);

    showAllCrashes(allData);
    console.log(allData);
}

/**
 * Function to display markers on the map
 * @param {*} allData 
 */
function showAllCrashes(allData) {
  var infoWind = new google.maps.InfoWindow;
    Array.prototype.forEach.call(allData, function(data) {
        var content = document.createElement('div');
        var strong = document.createElement('strong');
        strong.textContent = "Driver county: " + data.county + "; \n" + 
                              "Crash severity: " + data.crash_severity + "; \n" + 
                              "Crash time: " + data.crash_time;
        content.appendChild(strong);

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(data.lat, data.lng),
          map: map
        });

        marker.addListener('click', function() {
            infoWind.setContent(content);
            infoWind.open(map, marker);
        })
    })
}