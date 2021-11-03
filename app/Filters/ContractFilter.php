<?php

namespace App\Filters;

class ContractFilter extends QueryFilter
{
	public function institution($institution = null) {
		return $this->builder->when($institution, function($query) use ($institution) {
			$query->where('institution_id', $institution);
		});
	}

	public function type_contract($type_contract = null) {
		return $this->builder->when($type_contract, function($query) use ($type_contract) {
			$query->where('type_contract', $type_contract);
		});
	}

	public function contract_date($contract_date = null) {		
		return $this->builder->when($contract_date, function($query) use ($contract_date) {
			$query->where('contract_date', $contract_date);
		});
	}

	public function revision($revision = null) {
		$revision = intval($revision);
		return $this->builder->when($revision, function($query) use ($revision) {
			$query->where('revision', $revision);
		});
	}


}