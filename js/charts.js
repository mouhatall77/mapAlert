var allData = JSON.parse(document.getElementById('allData').innerHTML);
var driverData = JSON.parse(document.getElementById('allDriver').innerHTML);

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


//Get the age groups
Array.prototype.forEach.call(driverData, function (data) {
  ageGroup.push(data.age)
})

for (let i = 0; i < ageGroup.length; i++) {
  let c = ageGroup[i].toString();
  ageGroupInt.push(parseInt(c));
}

for (let i = 0; i < ageGroupInt.length; i++) {
  if (ageGroupInt[i] >= 15 && ageGroupInt[i] <= 19) {
    age15_19++;
  }
  else if (ageGroupInt[i] >= 20 && ageGroupInt[i] <= 24) {
    age20_24++;
  }
  else if (ageGroupInt[i] >= 25 && ageGroupInt[i] <= 34) {
    age25_34++;
  }
  else if (ageGroupInt[i] >= 35 && ageGroupInt[i] <= 44) {
    age35_44++;
  }
  else if (ageGroupInt[i] >= 45 && ageGroupInt[i] <= 54)
    age45_54++;
  else if (ageGroupInt[i] >= 55 && ageGroupInt[i] <= 64)
    age55_64++;
  else
    age65_up++;
}


var ctx = document.getElementById('mychart');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: [
      '15-19',
      '20-24',
      '25-34',
      '35-44',
      '45-54',
      '55-64',
      '65+'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [age15_19, age20_24, age25_34, age35_44, age45_54, age55_64, age65_up],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(153, 51, 102)',
        'rgb(255, 205, 86)',
        'rgb(51, 51, 0)',
        'rgb(153, 102, 0)',
        'rgb(0, 0, 102)'
      ],
      hoverOffset: 4
    }]
  },
  options: {
    maintainAspectRatio: false,
  }
});