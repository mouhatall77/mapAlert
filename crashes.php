<?php 
	
	class crashes	{
		private $report_number;
		private $crash_date;
		private $crash_time;
		private $county;
		private $city;
		private $investigating_agency;
		private $on_street;
		private $offset_feet;
		private $offset_direction;
		private $from_intersecting_street;
		private $crash_severity;
		private $lat;
		private $lng;
		private $conn;		//connection object
		private $tableName = "crashevent";	//the name of the table
		private $tableVehicule = "vehicule";
		private $tableDriver = "driver";

		function setReport_number($report_number) { $this->report_number = $report_number; }
		function getReport_number() { return $this->report_number; }
		function setCrash_date($crash_date) { $this->crash_date = $crash_date; }
		function getCrash_date() { return $this->crash_date; }
		function setCrash_time($crash_time) { $this->crash_time = $crash_time; }
		function getCrash_time() { return $this->crash_time; }
		function setCounty($county) { $this->county = $county; }
		function getCounty() { return $this->county; }
		function setCity($city) { $this->city = $city; }
		function getCity() { return $this->city; }
		function setInvestigating_agency($investigating_agency) { $this->investigating_agency = $investigating_agency; }
		function getInvestigating_agency() { return $this->investigating_agency; }
		function setOn_street($on_street) { $this->on_street = $on_street; }
		function getOn_street() { return $this->on_street; }
		function setOffset_feet($offset_feet) { $this->offset_feet = $offset_feet; }
		function getOffset_feet() { return $this->offset_feet; }
		function setOffset_direction($offset_direction) { $this->offset_direction = $offset_direction; }
		function getOffset_direction() { return $this->offset_direction; }
		function setFrom_intersecting_street($from_intersecting_street) { $this->from_intersecting_street = $from_intersecting_street; }
		function getFrom_intersecting_street() { return $this->from_intersecting_street; }
		function setCrash_severity($crash_severity) { $this->crash_severity = $crash_severity; }
		function getCrash_severity() { return $this->crash_severity; }
		function setLat($lat) { $this->lat = $lat; }
		function getLat() { return $this->lat; }
		function setLng($lng) { $this->lng = $lng; }
		function getLng() { return $this->lng; }

		/**
		 * 
		 */
		public function __construct() {
			require_once('db/DbConnect.php');
			$conn = new DbConnect;
			$this->conn = $conn->connect();
		}

		/**
		 * 
		 */
		public function getAllCrashes() {
			$sql = "SELECT * FROM $this->tableName";
			$stmt = $this->conn->prepare($sql);
			$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_ASSOC);

		}

		/**
		 * 
		 */
		public function getAllVehicules() {
			$sql = "SELECT * FROM $this->tableVehicule";
			$stmt = $this->conn->prepare($sql);
			$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_ASSOC);

		}

		/**
		 * 
		 */
		public function getAllDriver() {
			$sql = "SELECT * FROM $this->tableDriver";
			$stmt = $this->conn->prepare($sql);
			$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_ASSOC);

		}
	}

?>