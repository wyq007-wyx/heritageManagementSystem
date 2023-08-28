package com.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bean.Page;
import com.bean.Sample;


public interface SampleService {
	//获取所有文物标本
	List<Sample> getSampleList();
	//根据标本id查询标本
	Sample selectBySid(int sid);
	//根据标本所属单位查询标本
	List<Sample> SelectByWorkplace(String workplace);
	//获取excel数据
	String readExcel(MultipartFile mFile);
	//添加条标本记录
	int addSample(Sample sample);
	//模糊查询标本
	List<Sample> selectByContent(String content);
	//获取一页的标本信息，参数为每页有多少条记录，当前是第几页，哪个单位的标本
	Page<Sample> searchPageDemo(int i, int currentPage,String belong);
	//获取一页的标本信息，参数为每页有多少条记录，当前是第几页，哪个单位的标本,模糊查询的条件
	Page<Sample> searchPageDemo2(int i, int currentPage, String belong, String content);
}
