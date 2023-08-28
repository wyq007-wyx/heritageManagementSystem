package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.bean.Institution;

import com.dao.InstitutionDao;

@Repository("institutionService")
public class InstitutionServiceImpl implements InstitutionService{
	@Resource
	private InstitutionDao institutionDao;
	@Override
	public List<Institution> getInstitutionList() {
		// TODO Auto-generated method stub
		return institutionDao.selectAllInstitution();
	}
	
}
