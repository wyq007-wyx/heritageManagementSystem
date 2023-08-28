package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bean.Role;
import com.bean.User;
import com.dao.UserDao;
import com.service.UserService;
import com.utils.SendEmail;

/*
 * 
 * 处理登录,注册请求
 *
 */
@Controller("userController")
@SessionAttributes(value= {"currentUser","okMsg","errorMsg","choosedUser","role"})
public class UserController {
	
	@Resource
	//按照名称注入
	private UserDao userDao;
	@Resource
	private UserService userService;
	//处理登录请求
	@RequestMapping("/login.do")
	public void Login(String username,String pwd,String role,Model model,HttpServletResponse resp) throws IOException {
		int userRole;
		if(role.equals("admin")){
			userRole=Role.ADMIN;
		}else if(role.equals("staff")) {
			userRole=Role.STAFF;
		}else {
			userRole=Role.VISITOR;
		}
		User resultUser=userDao.userLogin(username,pwd,userRole);
		if(resultUser==null) {
			model.addAttribute("errorMsg", "用户名或者密码错误");
			resp.sendRedirect("/homework/login.jsp");
			//return "login";
		}else {
			//更新登录状态
			userDao.updateUserState(resultUser.getUid(),1);
			model.addAttribute("currentUser",resultUser);
			model.addAttribute("role",role);
			if(role.equals("admin")) {
				//如果是管理员，跳转到管理员首页
				resp.sendRedirect("/homework/admin/admin_index.jsp");
				//return "admin/menu";
			}else if(role.equals("visitor")) {
				System.out.println(resultUser);
				//如果是游客，跳转到游客首页
				resp.sendRedirect("/homework/visitor/visitor_index.jsp");
				//return "visitor/menu";
			}else {
				//如果是工作人员，跳转到工作人员首页
				resp.sendRedirect("/homework/staff/staff_index.jsp");
				//return "staff/menu";
			}
			
		}
	}
	
	//密码重置
	@RequestMapping("/pwdReset.do")
	public void pwdReset(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException, ServletException{
	        //1.设置编码、输出类
	        req.setCharacterEncoding("utf-8");
	        resp.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = resp.getWriter();
	        //2.1获取用户的用户名
	        String username = req.getParameter("username");
	        //2.1.1把用户名保存在session中，方便后续判断
	        req.getSession().setAttribute("username1",username);
	        //2.2获取用户的邮箱
	        String email = req.getParameter("email");
	        //3.创建一个空的用户对象
	        User user = null;
	        //4.通过邮箱找到用户信息
	        user = userService.findUserByUsernameAndEamil(username,email);
	        //5.判断用户名与邮箱是否匹配
	        if (user != null){
	            //服务器通知浏览器不要缓存
	            resp.setHeader("pragma","no-cache");
	            resp.setHeader("cache-control","no-cache");
	            resp.setHeader("expires","0");
	 
	            String base = "0123456789ABCDEFGHIJKLMNOPQRSDUVWXYZabcdefghijklmnopqrsduvwxyz";
	            int size = base.length();
	            Random r = new Random();
	            StringBuilder code = new StringBuilder();
	            for(int i=1;i<=4;i++){
	                //产生0到size-1的随机值
	                int index = r.nextInt(size);
	                //在base字符串中获取下标为index的字符
	                char c = base.charAt(index);
	                //将c放入到StringBuffer中去
	                code.append(c);
	            }
	            //把验证码保存在session中，方便后续判断
	            req.getSession().setAttribute("EmailCode",code.toString());
	 
	            //实例化一个发送邮件的对象
	            SendEmail mySendMail = new SendEmail();
	            //发送邮件
	            mySendMail.sendMail(email, "您正在找回密码，验证码为：" + code.toString() +"\n只有一次输入机会，请正确输入！如非本人操作，请忽略。");
	            //跳转页面
	            out.println("<script>alert('验证码已发送至邮箱，请注意查收！');window.location.href='pwdreset2.jsp'</script>");
	        }else {
	            model.addAttribute("errorMsg","用户名与邮箱不匹配，请重新输入！");
	            resp.sendRedirect("/homework/pwdreset.jsp");
	            //req.getRequestDispatcher("/pwdreset.jsp").forward(req,resp);
	        }
	}
	//密码重置第二步
	@RequestMapping("/pwdReset2.do")
	public void pwdReset2(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException, ServletException{
		    req.setCharacterEncoding("utf-8");
		    resp.setContentType("text/html;charset=UTF-8");
		    PrintWriter out = resp.getWriter();
		    String code=(String)req.getParameter("ecode");
		    HttpSession session=req.getSession();
		    String true_code=(String)session.getAttribute("EmailCode");
		    System.out.println(true_code);
		    System.out.println(code);
		    if(true_code.equals(code)) {
		    	out.println("<script>alert('验证码正确！请重新设置密码！');window.location.href='pwdreset3.jsp'</script>");
		    }else {
		    	model.addAttribute("errorMsg","验证码错误，请重新输入！");
		    	resp.sendRedirect("/homework/pwdreset2.jsp");
	            //req.getRequestDispatcher("/pwdreset2.jsp").forward(req,resp);
		    }
	}
	//密码重置第三步
	@RequestMapping("/pwdReset3.do")
	public void pwdReset3(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException, ServletException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String pwd=req.getParameter("password");
		String repwd=req.getParameter("repassword");
		if(!FormatCheck.isValidUserPassword(pwd)) {
		   model.addAttribute("errorMsg", "密码输入不合法");
		   resp.sendRedirect("/homework/pwdreset3.jsp");
		   //req.getRequestDispatcher("/pwdreset3.jsp").forward(req,resp);
		}else if(!FormatCheck.isValidConfirmPassword(pwd, repwd)) {
		   model.addAttribute("errorMsg", "两次密码不一致");
		   resp.sendRedirect("/homework/pwdreset3.jsp");
		   //req.getRequestDispatcher("/pwdreset3.jsp").forward(req,resp);
		}else {
		    //model.addAttribute("okMsg","密码重置成功！");
		    HttpSession session=req.getSession();
		    //User user=(User)session.getAttribute("currentUser");
		    
		    String username=(String) session.getAttribute("username1");
		        
		    userService.updatePwd(username, repwd);
		    String role=(String)session.getAttribute("role");
		    //userService.updatePwd(user.getUid(),repwd);
		    if(role==null) {
		    	out.println("<script>alert('密码重置成功！');window.location.href='login.jsp'</script>");
		    	resp.sendRedirect("/homework/login.jsp");
		    }else if(role.equals("admin")) {
		    	out.println("<script>alert('密码重置成功！');window.location.href='admin/nowuser.jsp'</script>");
		    	//resp.sendRedirect("/homework/admin/nowuser.jsp");
		    }else if(role.equals("staff")) {
		    	out.println("<script>alert('密码重置成功！');window.location.href='staff/nowuser.jsp'</script>");
		    	//resp.sendRedirect("/homework/staff/nowuser.jsp");
		    }else {
		    	out.println("<script>alert('密码重置成功！');window.location.href='visitor/nowuser.jsp'</script>");
		    	//resp.sendRedirect("/homework/visitor/nowuser.jsp");
		    }
		 }
	}
	//处理游客注册请求
	@RequestMapping("/register.do")
	public void Register(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException {
		User user=createUser(req,resp,model);
		HttpSession session=req.getSession();
		System.out.println("dsahdlkjlaskjdlakj"+session.getAttribute("errorMsg"));
		if(user==null) {
			resp.sendRedirect("/homework/register.jsp");
		}else {
			User resultUser=userDao.register(user.getUsername());
			if(resultUser==null) {
				//添加数据到数据库
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String strDate=sdf.format(date);
				//加入创建时间,本次登录时间
				user.setCreatetime(strDate);
				user.setLast_logintime(strDate);
				//加入注册状态和登录状态-->已注册，已登录
				user.setRegister_state(1);
				user.setUser_state(1);
				//向数据库中的user表中添加一条记录
				userDao.addVisitor(user);
				int uid=user.getUid();
				//向数据库中的user_role添加一条记录
				userDao.addUserRole(uid,Role.VISITOR);
				//添加到session中
				model.addAttribute("currentUser", user);
				//跳转到游客首页
				resp.sendRedirect("/homework/visitor/visitor_index.jsp");
				//return "visitor/menu";
			}else {
				model.addAttribute("errorMsg","用户名已存在");
				//返回注册页面
				resp.sendRedirect("/homework/register.jsp");
				//return "register";
			}
		}
	}
	//管理员的用户管理请求
	@RequestMapping("/userManage.do")
	public void UserManageMent(String type,String username,Model model,HttpServletResponse resp) throws IOException {
		//System.out.println("执行了");
		User resultUser=userDao.register(username);
		model.addAttribute("choosedUser", resultUser);
		System.out.println(resultUser);
		if(type.equals("detail")) {
			resp.sendRedirect("/homework/admin/user/userdetail.jsp");
		}else if(type.equals("change")) {
			resp.sendRedirect("/homework/admin/user/userchange.jsp");
		}else {
			//删除用户记录
			userDao.deleteUser(resultUser.getUid());
			//删除用户角色记录
			userDao.deleteUserRole(resultUser.getUid());
			model.addAttribute("okMsg", "删除成功");
			resp.sendRedirect("/homework/admin/userManagement.jsp");
			//return "redirect:/admin/userManagement.jsp";
		}
	}
	//处理管理员修改请求
	@RequestMapping("/userChange.do")
	public void changeUser(User user,Model model,HttpServletResponse resp) throws IOException {
		System.out.println(user);
		if(!checkChangeMessage(user,model)) {
			resp.sendRedirect("/homework/admin/user/userchange.jsp");
		}else {
			userDao.updateUser(user);
			model.addAttribute("okMsg", "修改成功");
			resp.sendRedirect("/homework/admin/userManagement.jsp");
		}
		//return "redirect:/admin/userManagement.jsp";
	}
	//处理头像修改请求
	@RequestMapping("/imageChange.do")
	public void imageChange(Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException {
		User user=createUser(req,resp,model);
		System.out.println(user);
		userDao.updateUserImage(user.getUid(),user.getImage_url());
		model.addAttribute("currentUser",userDao.selectByUid(user.getUid()));
		model.addAttribute("okMsg", "修改成功");
		int rid=userDao.getUserRole(user.getUid());
		if(rid==Role.ADMIN) resp.sendRedirect("/homework/admin/nowuser.jsp");
		else if(rid==Role.STAFF) resp.sendRedirect("/homework/staff/nowuser.jsp");
		else resp.sendRedirect("/homework/visitor/nowuser.jsp");
		//return "redirect:/admin/userManagement.jsp";
	}
	//添加工作人员请求
	@RequestMapping("/staffAdd.do")
	public void addStaff(User user,@RequestParam("repassword")String repassword,Model model,HttpServletResponse resp) throws IOException {
		System.out.println(user);
		if(FormatCheck.isBlank(user.getUsername(), user.getPassword())) {
			model.addAttribute("errorMsg","用户名或密码不能为空");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else if(!FormatCheck.isValidUserName(user.getUsername())) {
			model.addAttribute("errorMsg","用户名长度大于0小于20");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else if(!FormatCheck.isValidUserPassword(user.getPassword())) {
			model.addAttribute("errorMsg","密码长度大于0小于20");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else if(!FormatCheck.isValidConfirmPassword(user.getPassword(),repassword)) {
			model.addAttribute("errorMsg","两次密码不一致");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else if(!FormatCheck.isValidPhoneNumber(user.getTel())) {
			model.addAttribute("errorMsg","电话格式错误");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else if(!FormatCheck.isValidEmail(user.getEmail())) {
			model.addAttribute("errorMsg","邮箱格式错误");
			//返回添加员工页面
			resp.sendRedirect("/homework/admin/user/addstaff.jsp");
			//return "redirect:/admin/user/addstaff.jsp";
		}else {
			User resultUser=userDao.register(user.getUsername());
			if(resultUser==null) {
				//添加数据到数据库
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd hh:mm:ss");
				String strDate=sdf.format(date);
				//加入创建时间,本次登录时间
				user.setCreatetime(strDate);
				//user.setLast_logintime(strDate);
				//加入注册状态和登录状态-->已注册，未登录
				user.setRegister_state(1);
				user.setUser_state(0);
				//向数据库中的user表中添加一条记录
				userDao.addStaff(user);
				int uid=user.getUid();
				//向数据库中的user_role添加一条记录
				userDao.addUserRole(uid,Role.STAFF);
				model.addAttribute("okMsg", "添加成功");
				//跳转用户管理页面
				//System.out.println("这里执行了");
				resp.sendRedirect("/homework/admin/userManagement.jsp");
				//return "redirect:/admin/userManagement.jsp";
			}else {
				model.addAttribute("errorMsg","用户名已存在");
				resp.sendRedirect("/homework/admin/user/addstaff.jsp");
				//返回注册页面
				//return "redirect:/admin/user/addstaff).jsp";
			}
		}
	}
	//处理修改自己请求
	@RequestMapping("/selfChange.do")
	public void changeSelf(User user,Model model,HttpServletResponse resp) throws IOException {
		System.out.println(user);
		int rid=userDao.getUserRole(user.getUid());
		if(!checkChangeMessage(user,model)) {
			if(rid==Role.ADMIN) resp.sendRedirect("/homework/admin/userchange.jsp");
			else if(rid==Role.STAFF) resp.sendRedirect("/homework/staff/userchange.jsp");
			else resp.sendRedirect("/homework/visitor/userchange.jsp");
		}else {
			userDao.updateUser(user);
			model.addAttribute("currentUser",userDao.selectByUid(user.getUid()));
			model.addAttribute("okMsg", "修改成功");
			if(rid==Role.ADMIN) resp.sendRedirect("/homework/admin/nowuser.jsp");
			else if(rid==Role.STAFF) resp.sendRedirect("/homework/staff/nowuser.jsp");
			else resp.sendRedirect("/homework/visitor/nowuser.jsp");
			//return "redirect:/admin/userManagement.jsp";
		}	
	}
	//将二进制数据封装为User类
	public User createUser(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException {
		User user=new User();
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
			List<String> userField=new ArrayList<String>();
			List<String> userFieldValue=new ArrayList<String>();
			System.out.println(list);
			for(FileItem fileItem :list) {
				System.out.println(fileItem);
				if(fileItem.isFormField()) {
					System.out.println("表单的属性名:"+fileItem.getFieldName());
					System.out.println("表单的属性值:"+fileItem.getString("UTF-8"));
					userField.add(fileItem.getFieldName());
					userFieldValue.add(fileItem.getString("UTF-8"));
				}else {
					pictureItem=fileItem;
					System.out.println("收到了硕大的");
				}
			}
			if(!getDataFromBytes(pictureItem, userField, userFieldValue, user, model)) return null;
			//如果正确获得数据，将文件写入服务器
			if(getDataFromBytes(pictureItem,userField,userFieldValue,user,model)&&pictureItem.getName()!=null&&!pictureItem.getName().equals("")) {
				String imgtype = pictureItem.getName().substring( pictureItem.getName().lastIndexOf("."));
				// 给文件重新命名防止重复
				String imgName = UUID.randomUUID() + imgtype;
				System.out.println("新文件名："+imgName);
				//保存路径为服务器的根路径WEB-INF/images
				String savePath = req.getSession().getServletContext().getRealPath("/images/user_images");
				String sqlPath=null;
				sqlPath = "/images/user_images/" + imgName;
				System.out.println("访问路径：" + sqlPath);
				user.setImage_url(sqlPath);
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
			return user;
			//return user;
		}else {
			return null;
		}
		
	}
	//从字节流中获取数据
	public boolean getDataFromBytes(FileItem fileItem,List<String> fields,List<String> values,User user,Model model) {
		for(int i=0;i<fields.size();i++) {
			String key=fields.get(i);
			String value=values.get(i);
			if("uid".equals(key)) {
				user.setUid(Integer.valueOf(value));
			}else if("username".equals(key)) {
				if(!FormatCheck.isValidUserName(value)) {
					model.addAttribute("errorMsg","用户名不能为空");
					//user=null;
					return false;
				}
				if(userDao.register(value)!=null) {
					model.addAttribute("errorMsg","用户名已存在");
					//user=null;
					return false;
				}
				user.setUsername(value);
			}else if("password".equals(key)) {
				if(!FormatCheck.isValidUserPassword(value)) {
					model.addAttribute("errorMsg","密码长度必须大于0，小于20");
					//user=null;
					return false;
				}
				user.setPassword(value);
			}else if("realname".equals(key)) {
				user.setRealname(value);
			}else if("sex".equals(key)) {
				user.setSex(value);
			}else if("tel".equals(key)) {
				if(!FormatCheck.isValidPhoneNumber(value)) {
					model.addAttribute("errorMsg","电话格式错误");
					//user=null;
					return false;
				}
				user.setTel(value);
			}else if("email".equals(key)) {
				if(!FormatCheck.isValidEmail(value)) {
					model.addAttribute("errorMsg","邮箱格式错误");
					//user=null;
					return false;
				}
				user.setEmail(value);
			}else if("addr".equals(key)) {
				user.setAddr(value);
			}else if("workplace".equals(key)) {
				user.setWorkplace(value);
			}else if("register_state".equals(key)){
				user.setRegister_state(Integer.valueOf(value));
			}else if("user_state".equals(key)){
				user.setUser_state(Integer.valueOf(value));
			}else if("createtime".equals(key)){
				user.setCreatetime(value);
			}else if("last_logintime".equals(key)){
				user.setLast_logintime(value);
			}else {
				//检查两次密码是否一致
				if(!FormatCheck.isValidConfirmPassword(user.getPassword(), value)){
					model.addAttribute("errorMsg","两次密码不一致");
					//user=null;
					return false;
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
			//user=null;
			return false;
			//返回注册页面
			//resp.sendRedirect("/homework/register.jsp");
		}
		return true;
	}
	public boolean checkChangeMessage(User user,Model model) {
		if(!FormatCheck.isValidEmail(user.getEmail())) {
			model.addAttribute("errorMsg","邮箱格式错误");
			return false;
		}else if(!FormatCheck.isValidPhoneNumber(user.getTel())) {
			model.addAttribute("errorMsg","电话格式错误");
			return false;
		}
		return true;
	}
	
}
