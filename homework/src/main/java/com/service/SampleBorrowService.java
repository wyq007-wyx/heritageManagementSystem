package com.service;

import java.util.List;

import com.bean.SampleBorrow;

public interface SampleBorrowService {
	//根据借阅表的审核状态和申请借阅的单位，查询借阅记录
	List<SampleBorrow> selectByCheckStateAndFrom(int check_state,String from);
	//根据借阅表的审核状态和标本所属的单位，查询借阅记录
	List<SampleBorrow> selectByCheckStateAndSrc(int check_state,String src);
	
}
