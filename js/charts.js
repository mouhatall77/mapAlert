let driverData = JSON.parse(document.getElementById('allVehicule').innerHTML);
let vehiculeData = JSON.parse(document.getElementById('allDriver').innerHTML);


var ctx = document.getElementById('mychart');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: [
            'Red',
            'Blue',
            'Yellow'
          ],
          datasets: [{
            label: 'My First Dataset',
            data: [300, 50, 100],
            backgroundColor: [
              'rgb(255, 99, 132)',
              'rgb(54, 162, 235)',
              'rgb(255, 205, 86)'
            ],
            hoverOffset: 4
          }]
        },
    options: {
        maintainAspectRatio: false,
    }
});