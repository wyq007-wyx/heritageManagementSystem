package com.service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.bean.*;
import com.dao.SampleBorrowDao;

@Service("sampleBorrowService")
public class SampleBorrowServiceImpl implements SampleBorrowService{
	@Resource
	private SampleBorrowDao sampleBorrowDao;
	@Override
	public List<SampleBorrow> selectByCheckStateAndFrom(int check_state,String from) {
		return sampleBorrowDao.selectByCheckStateAndFrom(check_state,from);
	}
	@Override
	public List<SampleBorrow> selectByCheckStateAndSrc(int check_state, String src) {
		return sampleBorrowDao.selectByCheckStateAndSrc(check_state,src);
	}
}
