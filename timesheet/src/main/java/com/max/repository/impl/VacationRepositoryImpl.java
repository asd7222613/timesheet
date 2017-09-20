package com.max.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.max.base.BaseRepository;
import com.max.domain.Leave;
import com.max.repository.VacationRepository;

@Repository
public class VacationRepositoryImpl implements VacationRepository{

	@Autowired
	BaseRepository<Leave> baseRepository;
	
	@Override
	public void submitApply(Leave leave) {
		baseRepository.save(leave);		
	}

	@Override
	public Leave findByBusinessKey(String businessKey) {
		return baseRepository.find(Leave.class, new Long(businessKey));
	}

}
