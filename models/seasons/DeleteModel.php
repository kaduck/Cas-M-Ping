<?php

	/*
	 * Model for seasons modifications
	 * This class handles the delete of a seasons
	 *
	 * @author Bastien VAUTIER
	 * @version 0.0.1
	 * @copyright 2015 3iL
	 */

	public class deleteModel extends seasonModel{

		/**
		 * Delete a specified season
		 *
		 * @param seas_id, season's name
		 * @return 0 without errors, exception message any others cases
		 */
		public function delete_season($seas_id) {
			try {

				
				$qry = $this->db->prepare('DELETE FROM season 
												   INNER JOIN link_season_location ON  season.seas_id = ? and season.seas_id = link_season_location.link_seas_id');
				
				$qry->bindValue(1, $seas_id, PDO::PARAM_INT);
				$qry->execute();
				$qry->closeCursor();
				return 0;
			} catch(Exception $e) {
				return $e->getMessage();
			}
		}
	}

?>