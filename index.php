<!DOCTYPE html>
<html>
<head>
	<title>MapAlert - Traffic Crashes Location</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="css/chart.min.js">
	<script type="text/javascript" src="css/jquery.min.js"></script>

	<!--<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>-->
	<script type="text/javascript" src="js/googlemap.js"></script>	
	<style type="text/css">
		.container {
			height: 450px;
		}
		#map {
			width: 90%;
			height: 90%;
			border: 1px solid blue;
		}
		#allVehicule, #allData, #allDriver {
			display: none;
		}
		#canvas {
			width: 10;
			height: 10;
		}
	</style>
</head>
<body>
	
	<div class="container">
		<center><h2>MapAlert - Recent Traffic Crashes Location</h2></center>
		<?php
			require 'crashes.php';
			$crashes = new crashes;

			$allData = $crashes->getAllCrashes();
			$allData = json_encode($allData, true);
			echo '<div id="allData">' . $allData . '</div>';

			$allVehicule = $crashes->getAllVehicules();
			$allVehicule = json_encode($allVehicule, true);
			echo '<div id="allVehicule">' . $allVehicule . '</div>';

			$allDriver = $crashes->getAllVehicules();
			$allDriver = json_encode($allDriver, true);
			echo '<div id="allDriver">' . $allDriver . '</div>';
		?>
		<div id="map"></div>
		<p><strong>Description:</strong></p>
		<p>MapAlert allows you to track current traffic crashes reported and registered in our database.<br>
		For your convinience, click on the markers to display additional information.<br>
		</p>

	<div class="container">
	<canvas id="mychart" width="100" height="100">Hello</canvas>
</body>

<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkBpe3zjWO7CuY2G8kOzzd_kA5DRalIbY&callback=loadMap">
</script>
	
</html>