package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Page;
import com.bean.Sample;
import com.dao.SampleDao;
import com.utils.ReadExcelUtil;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	@Resource
	private SampleDao sampleDao;

	@Override
	public List<Sample> getSampleList() {
		return sampleDao.selectAllSample();
	}

	@Override
	public Sample selectBySid(int sid) {
		return sampleDao.selectBySid(sid);
	}

	@Override
	public List<Sample> SelectByWorkplace(String workplace) {
		return sampleDao.selectByWorkplace(workplace);
	}

	@Override
	public String readExcel(MultipartFile file) {
		ReadExcelUtil readExcelUtil = new ReadExcelUtil();
        //解析excel，获取上传的事件单
        List<Sample> sampleList = readExcelUtil.getExcelSampleInfo(file);
        if(sampleList==null) {
        	System.out.print(readExcelUtil.getErrorMsg());
        	return readExcelUtil.getErrorMsg();
        }
        else {
        	for (Sample sample : sampleList){
                Sample sample1 = new Sample();
                sample1.setBelong(sample.getBelong());
                sample1.setSamplename(sample.getSamplename());
                sample1.setOfyear(sample.getOfyear());
                sample1.setPerson(sample.getPerson());
                sample1.setFindplace(sample.getFindplace());
                sample1.setFindtime(sample.getFindtime());
                sample1.setLogtime(sample.getLogtime());
                sample1.setMaterial(sample.getMaterial());
                sample1.setOpen(sample.getOpen());
                sample1.setBorrow_state(sample.getBorrow_state());
                sample1.setImage_url(sample.getImage_url());
                addSample(sample1);
            }
    		return readExcelUtil.getErrorMsg();
        }
        
	}

	@Override
	public int addSample(Sample sample) {
		return sampleDao.addSample(sample);
		
	}

	@Override
	public List<Sample> selectByContent(String content) {
		// TODO Auto-generated method stub
		return sampleDao.selectByContent(content,content,content,content);
	}
	/**
	 * rows:每页有多少行
	 * currentPage:当前页是第几页
	 */
	@Override
	public Page<Sample> searchPageDemo(int rows, int currentPage, String belong) {
		Page<Sample> pageBean=new Page<Sample>();
		int x=sampleDao.findTotalCount(belong);//总数据条数
		int totalPage;
		if ((x%rows)==0){
			totalPage=x/rows;
		}else {
			totalPage=(x/rows)+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setRows(rows);
		if(currentPage<1) {
			currentPage=1;
		}
		if(currentPage>totalPage) {
			currentPage=totalPage;
		}
		pageBean.setCurrentPage(currentPage);
		System.out.println(currentPage);
		pageBean.setNextPage(currentPage+1);
		System.out.println(pageBean.getNextPage());
		pageBean.setPrevPage(currentPage-1);
		System.out.println(pageBean.getPrevPage());
		System.out.println("-------------------------------");
		int index=(currentPage-1)*rows;//起始地址
		pageBean.setList(sampleDao.findPage(index,rows,belong));
		pageBean.setTotalCount(x);
		return pageBean;
	}

	@Override
	public Page<Sample> searchPageDemo2(int rows, int currentPage, String belong, String content) {
		Page<Sample> pageBean=new Page<Sample>();
		int x=sampleDao.findTotalCount2(belong,content,content,content);//总数据条数
		int totalPage;
		if ((x%rows)==0){
			totalPage=x/rows;
		}else {
			totalPage=(x/rows)+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setRows(rows);
		if(currentPage<1) {
			currentPage=1;
		}
		if(currentPage>totalPage) {
			currentPage=totalPage;
		}
		pageBean.setCurrentPage(currentPage);
		System.out.println(currentPage);
		pageBean.setNextPage(currentPage+1);
		System.out.println(pageBean.getNextPage());
		pageBean.setPrevPage(currentPage-1);
		System.out.println(pageBean.getPrevPage());
		System.out.println("-------------------------------");
		int index=(currentPage-1)*rows;//起始地址
		pageBean.setList(sampleDao.findPage2(index,rows,belong,content,content,content));
		pageBean.setTotalCount(x);
		return pageBean;
	}
	
}
