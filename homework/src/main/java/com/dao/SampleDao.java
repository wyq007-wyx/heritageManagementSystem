package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Repository;

import com.bean.Sample;


@Repository("sampleDao")
@Mapper
public interface SampleDao {
	//查询所有标本
	List<Sample> selectAllSample();
	//根据标本名称查询标本
	Sample selectByName(String samplename);
	//添加一条标本记录
	int addSample(Sample sample);
	//更新标本记录
	int updateSample(Sample sample);
	//根据sid查询标本
	Sample selectBySid(int sid);
	//根据sid删除标本
	void deleteSample(int sid);

	int updateSample2(Sample sample);
	//更新标本公开信息
	void updateOpen(@Param("sid") int sid,@Param("open") int open);
	//更新标本借阅状态
	void updateBorrowState(@Param("sid") int sid,@Param("borrow_state") int borrow_state);
	//根据所属单位查询标本
	List<Sample> selectByWorkplace(String workplace);
	//模糊查询
	List<Sample> selectByContent(@Param("samplename")String name,@Param("findplace")String findplace,@Param("material")String material,@Param("belong")String belong);
	//根据每页数据条数，当前页面编号，所属单位查询标本:
	List<Sample> findPage(@Param("index") int index, @Param("number")int number, @Param("belong")String belong);
	//根据所属单位，查找标本总数
	int findTotalCount(String belong);
	//根据所属单位，标本名称，出土地，材料模糊查询标本总数:
	int findTotalCount2( @Param("belong")String belong,@Param("samplename")String name,@Param("findplace")String findplace,@Param("material")String material);
	//根据所属单位，标本名称，出土地，材料模糊查询某一页标本:
	List<Sample> findPage2(@Param("index")int index, @Param("number")int rows,  @Param("belong")String belong, @Param("samplename")String name,@Param("findplace")String findplace,@Param("material")String material);
	
}
