var map;

function loadMap() {
	var gainesville = {lat: 29.6516, lng: -82.3248};    //29.6516° N, 82.3248° W
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
    var driverData = JSON.parse(document.getElementById('allDriver').innerHTML);
    var vehiculeData = JSON.parse(document.getElementById('allVehicule').innerHTML);

    showAllCrashes(allData);
    showSomething();
}

function showSomething () {
      var allData = JSON.parse(document.getElementById('allData').innerHTML);
      var driverData = JSON.parse(document.getElementById('allDriver').innerHTML);

      console.log(driverData);
      console.log(allData);

      var name = [];
      var marks = [];
      var ageGroup = [];
      var ageGroupInt = [];
      var age15_19 = 0;
      var age20_24 = 0;
      var age25_34 = 0;
      var age35_44 = 0;
      var age45_54 = 0;
      var age55_64 = 0;
      var age65_up = 0;

          Array.prototype.forEach.call(allData, function(data) {
            name.push(data.lat);
          })

          //Get the age groups
          Array.prototype.forEach.call(driverData, function(data) {
            ageGroup.push(data.age)
          })

          for(let i=0; i<ageGroup.length; i++){
            let c = ageGroup[i].toString();
            ageGroupInt.push(parseInt(c));
          }

          for(let i=0; i<ageGroupInt.length; i++){
            if(ageGroupInt[i] >= 15 && ageGroupInt[i] < 20){
              age15_19++;
            }
            else if(ageGroupInt[i] >=20 && ageGroupInt[i] <= 24){
              age20_24++;
            }
            else if(ageGroupInt[i] >= 25 && ageGroupInt[i] <= 34){
              age25_34++;
            }
            else if(ageGroupInt[i] >= 35 && ageGroupInt[i] <= 44){
              age35_44++;
            }
            else if(ageGroupInt[i] >= 45 && ageGroupInt[i] <= 54)
              age45_54++;
            else if(ageGroupInt[i] >= 55 && ageGroupInt[i] <= 64)
              age55_64++;
            else
              age65_up++;
          }

      
      var chartdata = {
        labels: name,
        datasets: [
                {
                    label: 'AGE GROUPS',
                    backgroundColor: '#49e2ff',
                    borderColor: '#46d5f1',
                    hoverBackgroundColor: '#CCCCCC',
                    hoverBorderColor: '#666666',
                    data: marks
                }
            ]
        };

        var graphTarget = $("#graphCanvas");

        var barGraph = new Chart(graphTarget, {
            type: 'bar',
            data: chartdata
        });
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