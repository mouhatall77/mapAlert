<?php 
	
	/**
	 * Crash Even Class
	 */
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


		/**
		 * Create a connection obj
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