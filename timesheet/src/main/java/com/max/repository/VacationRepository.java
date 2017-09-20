package com.max.repository;

import com.max.domain.Leave;

public interface VacationRepository {

	public void submitApply(Leave leave);
	
	public Leave findByBusinessKey(String businessKey);
}
