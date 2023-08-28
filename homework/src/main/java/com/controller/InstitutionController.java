package com.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bean.Institution;

import com.dao.InstitutionDao;

@Controller
@SessionAttributes(value= {"okMsg","errorMsg","choosedInstitution","institutionlist"})
public class InstitutionController {
	@Resource
	private InstitutionDao institutionDao;
	//管理员的单位管理请求
	@RequestMapping("/institutionManage.do")
	public void UserManageMent(String type,String wid,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		Institution resultInstitution= institutionDao.selectByWid(Integer.valueOf(wid));
		model.addAttribute("choosedInstitution",resultInstitution);
		System.out.println("选中的单位:"+resultInstitution);
		if(type.equals("detail")) {
			resp.sendRedirect("/homework/admin/institution/institutiondetail.jsp");
		}else if(type.equals("change")) {
			resp.sendRedirect("/homework/admin/institution/institutionchange.jsp");
		}else {
			//删除用户记录
			institutionDao.deleteInstitution(Integer.valueOf(wid));
			model.addAttribute("okMsg", "删除成功");
			resp.sendRedirect("/homework/admin/companyManagement.jsp");
			//return "redirect:/admin/userManagement.jsp";
		}
	}
	//处理单位的模糊查询
	@RequestMapping("/workPlaceCheck.do")
	public void WorkPlaceCheck(String checkname,HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException {
		System.out.println("hell");
		System.out.println(checkname);
		List<Institution> list=institutionDao.selectByPartName("%"+checkname+"%");
		System.out.println(list);
		model.addAttribute("institutionlist", list);
		resp.sendRedirect("/homework/admin/companyManagement.jsp");
	}
	
	//处理单位修改请求
	@RequestMapping("/institutionChange.do")
	public String changeUser(Institution institution,Model model) {
		System.out.println(institution);
		if(institution.getManager()==null||institution.getManager().equals("")){
			model.addAttribute("errorMsg","负责人不能为空");
			//返回添加单位页面
			return "redirect:/admin/institution/institutionchange.jsp";
		}else if(!FormatCheck.isValidPhoneNumber(institution.getTel())){
			model.addAttribute("errorMsg","电话格式错误");
			//返回添加单位页面
			return "redirect:/admin/institution/institutionchange.jsp";
		}else if(!FormatCheck.isValidEmail(institution.getEmail())){
			model.addAttribute("errorMsg","邮箱格式错误");
			//返回添加单位页面
			return "redirect:/admin/institution/institutionchange.jsp";
		}else {
			institutionDao.updateInstitution(institution);
			model.addAttribute("okMsg", "修改成功");
			return "redirect:/admin/companyManagement.jsp";
		}
	}
	//添加单位请求
	@RequestMapping("/institutionAdd.do")
	public String addInstitution(Institution institution,Model model,HttpServletResponse resp) {
		System.out.println(institution);
		if(institution.getName()==null) {
			model.addAttribute("errorMsg","单位名不能为空");
			//返回添加单位页面
			return "redirect:/admin/institution/addinstitution.jsp";
		}else if("".equals(institution.getName())) {
			model.addAttribute("errorMsg","单位名不能为空");
			//返回添加单位页面
			return "redirect:/admin/institution/addinstitution.jsp";
		}else if(institution.getManager()==null||institution.getManager().equals("")){
			model.addAttribute("errorMsg","负责人不能为空");
			//返回添加单位页面
			return "redirect:/admin/institution/addinstitution.jsp";
		}else if(!FormatCheck.isValidPhoneNumber(institution.getTel())){
			model.addAttribute("errorMsg","电话格式错误");
			//返回添加单位页面
			return "redirect:/admin/institution/addinstitution.jsp";
		}else if(!FormatCheck.isValidEmail(institution.getEmail())){
			model.addAttribute("errorMsg","邮箱格式错误");
			//返回添加单位页面
			return "redirect:/admin/institution/addinstitution.jsp";
		}else {
			Institution result_institution=institutionDao.selectByName(institution.getName());
			if(result_institution==null) {
				//向数据库中的user表中添加一条记录
				institutionDao.addInstitution(institution);
				model.addAttribute("okMsg", "添加成功");
				//跳转管理页面
				return "redirect:/admin/companyManagement.jsp";
			}else {
				model.addAttribute("errorMsg","单位名称已存在");
				//返回注册页面
				return "redirect:/admin/institution/addinstitution.jsp";
			}
		}
	}
}
