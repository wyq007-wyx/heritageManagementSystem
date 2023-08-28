package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.bean.SampleBorrow;

@Repository("sampleBorrowDao")//声明一个可以注入的实例
@Mapper
public interface SampleBorrowDao {
	//增加一条标本借阅记录
	int addBorrow(SampleBorrow sampleBorrow);
	//根据标本借阅单位和借阅的审核状态查询标本
	List<SampleBorrow> selectByCheckStateAndFrom(@Param("check_state")int check_state,@Param("from")String from);
	//根据标本所属单位和借阅的审核状态查询标本
	List<SampleBorrow> selectByCheckStateAndSrc(@Param("check_state")int check_state,@Param("src")String src);
	//根据借阅id删除标本
	void deleteBorrow(int bid);
	//更新标本借阅表中标本的审核状态
	void updateBorrowState(@Param("bid") int bid, @Param("borrow_state") int borrow_state);
	//更新标本借阅表中标本的借阅时间
	void updateBorrow_time(@Param("bid") int bid,  @Param("borrow_time")String borrow_time);
	//更新标本借阅表中标本的归还时间
	void updateBack_time(@Param("bid") int bid,  @Param("back_time")String back_time);
	//根据借阅id查找借阅信息
	SampleBorrow selectByBid(int bid);
	//根据年份查询标本借阅信息
	List<SampleBorrow> selectByYear(@Param("year")String year, @Param("belong")String belong);
	//根据工作单位查询标本借阅信息
	List<SampleBorrow> selectByWorkplace(@Param("belong")String belong);
}
