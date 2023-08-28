package com.controller;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Borrow;
import com.bean.Page;
import com.bean.Sample;
import com.bean.SampleBorrow;
import com.bean.User;
import com.dao.SampleBorrowDao;
import com.dao.SampleDao;
import com.service.SampleService;

@Controller("SampleController")
@SessionAttributes(value= {"okMsg","errorMsg","choosedSample","samplelist"})
public class SampleController {
	@Resource 
	private SampleService sampleService;
	@Resource
	private SampleDao sampleDao;
	@Resource
	private SampleBorrowDao sampleBorrowDao;
	//添加标本请求
	@RequestMapping("/sampleAdd.do")
	public void addSample(HttpServletRequest req,Model model,HttpServletResponse resp) throws IOException {
		Sample sample=createSample(req,resp,model);
		//Sample result_sample=sampleDao.selectByName(sample.getSamplename());
		if(sample!=null) {
		//向数据库中的sample表中添加一条记录
			sampleDao.addSample(sample);
			model.addAttribute("okMsg", "添加成功");
			//跳转工作人员标本管理页面
			resp.sendRedirect("/homework/staff/sampleManagement/sampleManagement.jsp");
			//return "redirect:/admin/sampleManagement.jsp";
		}else {
			//model.addAttribute("errorMsg","标本名称已存在");
			//返回添加页面
			resp.sendRedirect("/homework/staff/sampleManagement/addsample.jsp");
			//return "redirect:/admin/sample/addsample.jsp";
		}
	}
	//处理管理员的标本修改请求
	@RequestMapping("/sampleChange.do")
	public void changeSample(HttpServletRequest req,Model model,HttpServletResponse resp) throws IOException {
		Sample sample=createSample(req,resp,model);
		System.out.println(sample);
		if(sample==null) {
			resp.sendRedirect("/homework/admin/sample/samplechange.jsp");
		}else {
			sampleDao.updateSample(sample);
			model.addAttribute("okMsg", "修改成功");
			resp.sendRedirect("/homework/admin/sampleManagement.jsp");
		}
		//return "redirect:/admin/sampleManagement.jsp";
	}
	//管理员的标本管理请求
	@RequestMapping("/sampleManage.do")
	public void SampleManageMent(String type,String sid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		Sample resultSample= sampleDao.selectBySid(Integer.valueOf(sid));
		model.addAttribute("choosedSample",resultSample);
		System.out.println("选中的标本:"+resultSample);
		if(type.equals("detail")) {
			resp.sendRedirect("/homework/admin/sample/sampledetail.jsp");
		}else if(type.equals("change")) {
			resp.sendRedirect("/homework/admin/sample/samplechange.jsp");
		}else {
			//删除标本记录
			if(resultSample.getBorrow_state()==Sample.UNBORROWABLE) {
				model.addAttribute("errorMsg", "当前标本已借出，不可删除");
			}else {
				sampleDao.deleteSample(Integer.valueOf(sid));
				model.addAttribute("okMsg", "删除成功");
			}
			resp.sendRedirect("/homework/admin/sampleManagement.jsp");
			//return "redirect:/admin/userManagement.jsp";
		}
	}
	
	//处理工作人员的标本修改请求
	@RequestMapping("/sampleChange2.do")
	public void changeSample2(HttpServletRequest req,Model model,HttpServletResponse resp) throws IOException {
		Sample sample=createSample(req,resp,model);
		System.out.println(sample);
		if(sample==null) {
			resp.sendRedirect("/homework/staff/sampleManagement/samplechange.jsp");
		}else {
			sampleDao.updateSample2(sample);
			model.addAttribute("okMsg", "修改成功");
			resp.sendRedirect("/homework/staff/sampleManagement/sampleManagement.jsp");
		}
		//return "redirect:/admin/sampleManagement.jsp";
	}
	//工作人员的标本管理请求
	@RequestMapping("/sampleManage2.do")
	public void SampleManageMent2(String type,String sid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		Sample resultSample= sampleDao.selectBySid(Integer.valueOf(sid));
		model.addAttribute("choosedSample",resultSample);
		System.out.println("选中的标本:"+resultSample);
		if(type.equals("detail")) {
			resp.sendRedirect("/homework/staff/sampleManagement/sampledetail.jsp");
		}else if(type.equals("change")) {
			resp.sendRedirect("/homework/staff/sampleManagement/samplechange.jsp");
		}else {
			//删除标本记录
			System.out.println(resultSample.getBorrow_state());
			System.out.println(Sample.UNBORROWABLE);
			if(resultSample.getBorrow_state()==Sample.UNBORROWABLE) {
				model.addAttribute("errorMsg", "当前标本已借出，不可删除");
			}else {
				sampleDao.deleteSample(Integer.valueOf(sid));
				model.addAttribute("okMsg", "删除成功");
			}
			resp.sendRedirect("/homework/staff/sampleManagement/sampleManagement.jsp");
			//return "redirect:/admin/userManagement.jsp";
		}
	}
	//跳转到工作人员借阅信息填写界面
	@RequestMapping("/borrowInput.do")
	public void borrowInput(String belong,int sid,Model model,HttpServletResponse resp) throws IOException{
		Sample resultSample= sampleDao.selectBySid(sid);
		model.addAttribute("choosedSample",resultSample);
		System.out.println("选中的标本:"+resultSample);
		resp.sendRedirect("/homework/staff/sampleBorrow/borrowInput.jsp");
	}
	//游客查看
	@RequestMapping("/sampleLook.do")
	public void VisitorLook(String sid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		Sample resultSample= sampleDao.selectBySid(Integer.valueOf(sid));
		model.addAttribute("choosedSample",resultSample);
		System.out.println("选中的单位:"+resultSample);
		resp.sendRedirect("/homework/visitor/sampledetail.jsp");
	}
	//工作人员借阅请求
	@RequestMapping("/sampleBorrow.do")
	public void staffBorrow(SampleBorrow sampleBorrow,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		System.out.println("sampleBorrow"+sampleBorrow);
		if(sampleBorrow.getPerson()==null||sampleBorrow.getPerson().equals("")) {
			model.addAttribute("errorMsg","借阅人姓名不能为空！");
			resp.sendRedirect("/homework/staff/sampleBorrow/borrowInput.jsp");
		}else if(sampleBorrow.getTel()==null||sampleBorrow.getTel().equals("")){
			System.out.println("zhelisdajhdjk");
			model.addAttribute("errorMsg","联系方式不能为空！");
			resp.sendRedirect("/homework/staff/sampleBorrow/borrowInput.jsp");
		}else if(!FormatCheck.isValidPhoneNumber(sampleBorrow.getTel())){
			model.addAttribute("errorMsg","电话格式错误！");
			resp.sendRedirect("/homework/staff/sampleBorrow/borrowInput.jsp");
		}else {
			model.addAttribute("okMsg","请求已发送，等待审核！");
			sampleBorrowDao.addBorrow(sampleBorrow);
			resp.sendRedirect("/homework/staff/sampleBorrow/borrowInput.jsp");
		}
	}
	@RequestMapping("borrowManage.do")
	public void borrowManage(@Param("type")String type,@Param("bid")String bid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		if(type.equals("1")) {
			model.addAttribute("okMsg","归还请求已发送，等待确认");
			sampleBorrowDao.updateBorrowState(Integer.valueOf(bid),Borrow.WAIT_BACK_RESPONSE);
			resp.sendRedirect("/homework/staff/borrowManagement/borrowManagement.jsp");
		}else if(type.equals("2")){
			model.addAttribute("okMsg","删除成功！");
			sampleBorrowDao.deleteBorrow(Integer.valueOf(bid));
			resp.sendRedirect("/homework/staff/borrowManagement/borrowManagement.jsp");
		}
	}
	@RequestMapping("lendManage.do")
	public void lendManage(@Param("type")String type,@Param("bid")String bid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		if(type.equals("1")) {//通过审核
			SampleBorrow sampleBorrow=sampleBorrowDao.selectByBid(Integer.valueOf(bid));
			Sample sample=sampleDao.selectBySid(sampleBorrow.getSid());
			if(sample.getBorrow_state()==Sample.UNBORROWABLE) {
				model.addAttribute("errorMsg","当前标本已借出，不在本单位");
				resp.sendRedirect("/homework/staff/lendManagement/lendManagement.jsp");
			}else {
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String strdate=sdf.format(date);
				sampleBorrowDao.updateBorrow_time(Integer.valueOf(bid),strdate);
				sampleDao.updateBorrowState(sampleBorrow.getSid(),Sample.UNBORROWABLE);
				sampleBorrowDao.updateBorrowState(Integer.valueOf(bid),Borrow.CHECKED);
				resp.sendRedirect("/homework/staff/lendManagement/lendManagement.jsp");
			}
		}else if(type.equals("2")){//拒绝借阅
			sampleBorrowDao.updateBorrowState(Integer.valueOf(bid),Borrow.END);
			resp.sendRedirect("/homework/staff/lendManagement/lendManagement.jsp");
		}else if(type.equals("3")){//归还确认
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String strdate=sdf.format(date);
			sampleBorrowDao.updateBack_time(Integer.valueOf(bid),strdate);
			SampleBorrow sampleBorrow=sampleBorrowDao.selectByBid(Integer.valueOf(bid));
			sampleDao.updateBorrowState(sampleBorrow.getSid(),Sample.BORROWABLE);
			sampleBorrowDao.updateBorrowState(Integer.valueOf(bid),Borrow.END);
			resp.sendRedirect("/homework/staff/lendManagement/lendManagement.jsp");
		}else if(type.equals("4")){//拒绝归还
			sampleBorrowDao.updateBorrowState(Integer.valueOf(bid),Borrow.CHECKED);
			resp.sendRedirect("/homework/staff/lendManagement/lendManagement.jsp");
		}
	}
	//某一年统计分析
	@RequestMapping("/borrowStatistic.do")
	public String borrowStatistic(String year,String workplace,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		List<SampleBorrow> borrowlist=sampleBorrowDao.selectByYear(year+"%",workplace);
		List<String> months=new ArrayList<String>();
		List<Integer> borrow_numbers=new ArrayList<Integer>();
		Map<String,Integer> monthMap=new HashMap<String,Integer>();
		for(int i=1;i<=12;i++) {
			
			if(i<10) {
				//01,02,03,04,....11,12
				monthMap.put("0"+String.valueOf(i), 0);
				months.add("0"+String.valueOf(i));
			}else {
				monthMap.put(String.valueOf(i), 0);
				months.add(String.valueOf(i));
			}
		}
		for(SampleBorrow sb:borrowlist) {
			//2000-01-02
			String month=sb.getBorrow_time().substring(5,7);
			System.out.println("month"+month);
			int count=monthMap.get(month)+1;
			monthMap.put(month, count);
		}
		for(String month:months) {
			borrow_numbers.add(monthMap.get(month));
		}
		model.addAttribute("year",year);
		model.addAttribute("type","months");
		model.addAttribute("x_data", months);
		model.addAttribute("y_data", borrow_numbers);
		return "staff/statisticManagement/borrowData";
	}
	//全部统计分析
	@RequestMapping("/allborrowStatistic.do")
	public String allBorrowStatistic(String workplace,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		List<SampleBorrow> allborrowlist=sampleBorrowDao.selectByWorkplace(workplace);
		List<String> years=new ArrayList<String>();
		List<Integer> borrow_numbers=new ArrayList<Integer>();
		Map<String,Integer> yearMap=new HashMap<String,Integer>();
		for(SampleBorrow sb:allborrowlist) {
			String year=sb.getBorrow_time().substring(0,4);
			if(!yearMap.containsKey(year)) {
				yearMap.put(year, 1);
				years.add(year);
			}else {
				int count=yearMap.get(year)+1;
				yearMap.put(year, count);
			}
		}
		Collections.sort(years);
		for(String year:years) {
			if(yearMap.containsKey(year)) {
				borrow_numbers.add(yearMap.get(year));
			}
				
		}
		model.addAttribute("type","years");
		model.addAttribute("x_data", years);
		model.addAttribute("y_data",borrow_numbers);
		return "staff/statisticManagement/borrowData";
	}
	@RequestMapping("/import.do")
	public void excelImport(@RequestParam("xlsFile")MultipartFile mFile,Model model,HttpServletResponse resp) throws IOException {
		try {
            String errorMsg=sampleService.readExcel(mFile);
            System.out.println("errorMsg:"+errorMsg);
            if(errorMsg==null||errorMsg.equals("")) {
            	model.addAttribute("okMsg","上传成功");
            }else {
            	model.addAttribute("errorMsg",errorMsg);
            }
            resp.sendRedirect("/homework/staff/sampleManagement/autoAdd.jsp");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
	}
	@RequestMapping("/sampleCheck.do")
	public void sampleCheck(String content,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		List<Sample>  samplelist=sampleService.selectByContent("%"+content+"%");
		model.addAttribute("samplelist", samplelist);
		resp.sendRedirect("/homework/staff/sampleManagement/sampleManagement.jsp");

	}
	@RequestMapping("/sampleCheck2.do")
	public void sampleCheck2(Model model,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		//System.out.println("执行了");
		int currentPage;
		if (req.getParameter("currentPage") == null){
		    currentPage = 1;
		}else {
		    /*获取当前页*/
		    currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		String content=req.getParameter("content");
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("currentUser");
		String belong=user.getWorkplace();
		//假设显示的条数设置为5条，即可以直接这么写
		Page<Sample> pageBean = sampleService.searchPageDemo2(5,currentPage,belong,"%"+content+"%");
		
		//把每页显示的数据集合单独拿出来，方便遍历，化简代码
		List<Sample> list = pageBean.getList();

		//把页码个数放在pages集合里，方便操作，简化代码
		List<Integer> pages = new ArrayList<>();

		for (int i = 1; i <= pageBean.getTotalPage(); i++) {
			pages.add(i);
		}
		req.setAttribute("list",list);
		req.setAttribute("pageBean",pageBean);
		req.setAttribute("pages",pages);
		req.getRequestDispatcher("/staff/sampleManagement/showPic.jsp").forward(req,resp);
		//resp.sendRedirect("/homework/staff/sampleManagement/sampleManagement.jsp");

	}
	@RequestMapping("/splitPage.do")
	public void splitPage(Model model,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		int currentPage;
		if (req.getParameter("currentPage") == null){
		    currentPage = 1;
		}else {
		    /*获取当前页*/
		    currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		String belong=req.getParameter("belong");
		//假设显示的条数设置为5条，即可以直接这么写
		Page<Sample> pageBean = sampleService.searchPageDemo(5,currentPage,belong);
		
		//把每页显示的数据集合单独拿出来，方便遍历，化简代码
		List<Sample> list = pageBean.getList();

		//把页码个数放在pages集合里，方便操作，简化代码
		List<Integer> pages = new ArrayList<>();

		for (int i = 1; i <= pageBean.getTotalPage(); i++) {
			pages.add(i);
		}
		req.setAttribute("list",list);
		req.setAttribute("pageBean",pageBean);
		req.setAttribute("pages",pages);
		req.getRequestDispatcher("/staff/sampleManagement/showPic.jsp").forward(req,resp);


	}
	//将二进制数据封装为Sample类
	public Sample createSample(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException {
		Sample sample=new Sample();
		if(ServletFileUpload.isMultipartContent(req)) {
			//创建工厂实现类，用于解析上传数据的工具类
			FileItemFactory fileItemFactory=new DiskFileItemFactory();
			ServletFileUpload servletFileUpload=new ServletFileUpload(fileItemFactory);
			List<FileItem> list = null;
			try {
				list = servletFileUpload.parseRequest(req);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			FileItem pictureItem=null;
			List<String> sampleField=new ArrayList<String>();
			List<String> sampleFieldValue=new ArrayList<String>();
			for(FileItem fileItem :list) {
				if(fileItem.isFormField()) {
					System.out.println("表单的属性名:"+fileItem.getFieldName());
					System.out.println("表单的属性值:"+fileItem.getString("UTF-8"));
					sampleField.add(fileItem.getFieldName());
					sampleFieldValue.add(fileItem.getString("UTF-8"));
				}else {
					pictureItem=fileItem;
				}
			}
			System.out.println(pictureItem.getName());
			if(!getDataFromBytes(pictureItem, sampleField, sampleFieldValue, sample, model)) return null;
			//如果正确获得数据，将文件写入服务器
			if(getDataFromBytes(pictureItem,sampleField,sampleFieldValue,sample,model)&&pictureItem.getName()!=null&&!pictureItem.getName().equals("")) {
				
				String imgtype = pictureItem.getName().substring( pictureItem.getName().lastIndexOf("."));
				// 给文件重新命名防止重复
				String imgName = UUID.randomUUID() + imgtype;
				System.out.println("新文件名："+imgName);
				//保存路径为服务器的根路径WEB-INF/images
				String savePath = req.getSession().getServletContext().getRealPath("/images/sample_images");
				String sqlPath=null;
				sqlPath = "/images/sample_images/" + imgName;
				System.out.println("访问路径：" + sqlPath);
				sample.setImage_url(sqlPath);
				try {
					File img_dir=new File(savePath);
					if(!img_dir.exists()) {
						img_dir.mkdirs();
					}
					pictureItem.write(new File(savePath,imgName));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return sample;
		}else {
			System.out.println("返回一个空值");
			return null;
		}
			
	}
	
	//从字节流中获取数据
	public boolean getDataFromBytes(FileItem fileItem,List<String> fields,List<String> values,Sample sample,Model model) {
		for(int i=0;i<fields.size();i++) {
			String key=fields.get(i);
			String value=values.get(i);
			if("sid".equals(key)) {
				sample.setSid(Integer.valueOf(value));
			}else if("samplename".equals(key)) {
				if(!FormatCheck.isValidUserName(value)) {
					model.addAttribute("errorMsg","标本名称不能为空");
					System.out.println("标本名称为空");
					//sample=null;
					return false;
				}
				if(sampleDao.selectByName(value)!=null) {
					model.addAttribute("errorMsg","标本名称已存在");
					//sample=null;
					return false;
				}
				sample.setSamplename(value);
			}else if("belong".equals(key)) {
				sample.setBelong(value);
			}else if("open".equals(key)) {
				sample.setOpen(Integer.valueOf(value));
			}else if("borrow_state".equals(key)) {
				sample.setBorrow_state(Integer.valueOf(value));
			}else if("findplace".equals(key)) {
				sample.setFindplace(value);
			}else if("findtime".equals(key)) {
				sample.setFindtime(value);
			}else if("material".equals(key)) {
				sample.setMaterial(value);
			}else if("ofyear".equals(key)) {
				sample.setOfyear(value);
			}else if("person".equals(key)) {
				sample.setPerson(value);
			}else if("description".equals(key)) {
				sample.setDescription(value);
			}else if("logtime".equals(key)) {
				sample.setLogtime(value);
			}else if("image_url2".equals(key)) {
				System.out.println(value);
				if(value!=null&&!value.equals("")) {
					sample.setImage_url(value);
				}
			}
		}
		// 文件类型	
		// 获取文件后缀名
		//System.out.print(fileItem.getName().length());
		if(fileItem.getName()==null||fileItem.getName().equals("")) return true;
			String imgtype = fileItem.getName().substring(fileItem.getName().lastIndexOf("."));
			if(!imgtype.equalsIgnoreCase(".jpg")&&!imgtype.equalsIgnoreCase(".bmp")&&!imgtype.equalsIgnoreCase(".jpeg")&&!imgtype.equalsIgnoreCase(".png")&&!imgtype.equalsIgnoreCase(".gif")) {
				model.addAttribute("errorMsg","图片格式错误");
				return false;
			}
			return true;
	}
		
}
