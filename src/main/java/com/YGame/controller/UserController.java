package com.YGame.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.dao.IUserDao;
import com.YGame.pojo.User;
import com.YGame.service.ProductService;
import com.YGame.service.UserService;
import com.aliyun.credentials.http.HttpResponse;





@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value="/inlogin.action",method=RequestMethod.POST)
	@ResponseBody
	public int userLogin(@RequestParam("UserName") String userName,@RequestParam("PassWord") String password,HttpServletRequest request) {
		List<User> list = userservice.userLogin(userName, password);
		HttpSession session = request.getSession();
		
		if( list.size() != 0) {
			User user = list.get(0);
			if( user.getUsertype().equals("Õý³£")) {
				session.setAttribute("user", user);
				return 1;
			}else {
				return 9;
			}
			
		}else {
			return 0;
		}
	}
		
	@RequestMapping(value="/exit")
	public String userExit(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		session.removeAttribute("user");
		response.sendRedirect("http://localhost:8080/YGame/");
		return "jsp/index";
	}
	
	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	@ResponseBody
	public String[] register(@RequestParam("UserName") String userName,@RequestParam("PassWord") String password) {
		String[] re = {"false"};
		int result = userservice.userRegister(userName, password);
		if( result == 1 ) {
			re[0] = "success";
			return re;
		}else if( result == 2){
			re[0] = "shibai";
			return re;
		}else {
			return re;
		}

	}
	@RequestMapping(value="/updatauserinfo",method=RequestMethod.POST)
	@ResponseBody
	public int updataUserInfo(@RequestParam("tximage") MultipartFile file ,HttpServletRequest request, HttpServletResponse response) {
		
		int result = userservice.updataUserInfo(request, file);
		return result;

	}
	@RequestMapping(value="/selectUserInfo",method=RequestMethod.POST)
	@ResponseBody
	public User selectUserInfo(@RequestParam("userid") Integer userid ) {
		
		User result = userservice.selectUserInfo( userid );
		return result;

	}
	//ÐÞ¸ÄÃÜÂë
	@RequestMapping(value="/xiugaimima",method=RequestMethod.POST)
	@ResponseBody
	public int xiugaimima(@RequestParam("id") Integer id, @RequestParam("newpassword") String newpassword ) {
		
		int result = userservice.xiugaimima( id, newpassword);
		return result;

	}

}
