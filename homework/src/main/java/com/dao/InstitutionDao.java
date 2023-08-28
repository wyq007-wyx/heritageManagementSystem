package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bean.Institution;

@Repository("institutionDao")//声明一个可以注入的实例
@Mapper
public interface InstitutionDao {
	//查询所有工作单位
	List<Institution> selectAllInstitution();
	//根据单位id查询单位
	Institution selectByWid(int wid);
	//根据单位id删除单位
	void deleteInstitution(int wid);
	//根据单位名称查询单位
	Institution selectByName(String name);
	//添加一条单位
	int addInstitution(Institution institution);
	//更新单位
	int updateInstitution(Institution institution);
	//根据单位名称进行模糊查询
	List<Institution> selectByPartName(String checkname);
}
