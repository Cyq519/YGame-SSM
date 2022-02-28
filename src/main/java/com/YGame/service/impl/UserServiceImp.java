package com.YGame.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.dao.IUserDao;
import com.YGame.pojo.User;
import com.YGame.service.ManageService;
import com.YGame.service.UserService;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	private IUserDao userMapper;
	@Override
	public int userRegister(String userName, String password) {
		// TODO Auto-generated method stub
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		IUserDao userMapper = ac.getBean(IUserDao.class);
		List<User> checklist = new ArrayList<User>();
		checklist = userMapper.checkUserName(userName);
		if( checklist.size() != 0 ) {	
			return 0;
		}
		User userinfo = new User();
		userinfo.setUserName(userName);
		userinfo.setPassword(password);
		userinfo.setNicheng("用户"+userName);
		userinfo.setImage("./image/user-mr-image.png");
		userinfo.setUsertype("ptuser");
		userinfo.setEmail("null");
		userinfo.setGexingqianming("null");
		userinfo.setSex("null");
		userinfo.setIphonenumber("null");
		userinfo.setSaleNum(0);
		userinfo.setCansleNum(0);
		userinfo.setBuyNum(0);
		int result = userMapper.userRegister(userinfo);
		
		if( result == 1) {
			return 1;
		}else {			
			return 2;
		}		
	}
	@Override
	public List<User> userLogin(String userName,String password){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		IUserDao userMapper = ac.getBean(IUserDao.class);	
		List<User> list = userMapper.usersLogin(userName,password);
		if( list != null) {
			return list;
		}else {
			return null;
		}
	}
	@Override
	public int updataUserInfo(HttpServletRequest request, MultipartFile file){
		
		String usernc    = request.getParameter("usernc");
		String usersex    = request.getParameter("usersex");
		String userphone    = request.getParameter("userphone");
		String usermail    = request.getParameter("usermail");
		String userName = request.getParameter("useryhm");
		String nowimg =  request.getParameter("nowimg");
		//取出前端传来的参数 并赋值给一个user对象
		User user = new User();
		user.setNicheng(usernc);
		user.setSex(usersex);
		user.setIphonenumber(userphone);
		user.setEmail(usermail);
		user.setUserName(userName);
		
		if( file.getSize() == 0 ) {
			user.setImage(nowimg);
		}else {
			//获取文件名
			//s.substring(s.indexOf("."))
			String s =file.getOriginalFilename();
			//获取文件后缀
			String suffix = s.substring(s.indexOf("."));
			//生成随机uuid码 防止重名
			String uuid = UUID.randomUUID().toString();
			//拼接成新的文件名
			String filename = uuid+suffix;
			//真实存放路径
			String realPath = "D:/YGame-Image/userimage/" + filename;
			//tomcat虚拟路径 用来配置src 方便访问文件
			String xuniPath = "/userimg/"+filename;
			user.setImage(xuniPath);
			//储存文件
			try {
				file.transferTo(new File(realPath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//数据存储到数据库
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		IUserDao userMapper = ac.getBean(IUserDao.class);
		int result = userMapper.updataUserInfo(user);
		if( result == 1 ) {
			HttpSession session = request.getSession(false);
			User users = userMapper.updateSession(user.getUserName());
			session.setAttribute("user", users);
			return result;
		}else {
			return 0;
		}
		
	}
	//查询用户信息
	public User selectUserInfo(Integer userid) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		IUserDao userMapper = ac.getBean(IUserDao.class);
		User result = userMapper.selectUserInfo(userid);
		return result;
	}
	//修改密码
	public int xiugaimima(Integer id, String newpassword) {
		int result = userMapper.xiugaimima(id,newpassword);
		return result;
	}

}
