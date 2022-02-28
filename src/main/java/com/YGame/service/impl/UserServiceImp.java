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
		userinfo.setNicheng("�û�"+userName);
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
		//ȡ��ǰ�˴����Ĳ��� ����ֵ��һ��user����
		User user = new User();
		user.setNicheng(usernc);
		user.setSex(usersex);
		user.setIphonenumber(userphone);
		user.setEmail(usermail);
		user.setUserName(userName);
		
		if( file.getSize() == 0 ) {
			user.setImage(nowimg);
		}else {
			//��ȡ�ļ���
			//s.substring(s.indexOf("."))
			String s =file.getOriginalFilename();
			//��ȡ�ļ���׺
			String suffix = s.substring(s.indexOf("."));
			//�������uuid�� ��ֹ����
			String uuid = UUID.randomUUID().toString();
			//ƴ�ӳ��µ��ļ���
			String filename = uuid+suffix;
			//��ʵ���·��
			String realPath = "D:/YGame-Image/userimage/" + filename;
			//tomcat����·�� ��������src ��������ļ�
			String xuniPath = "/userimg/"+filename;
			user.setImage(xuniPath);
			//�����ļ�
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
		//���ݴ洢�����ݿ�
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
	//��ѯ�û���Ϣ
	public User selectUserInfo(Integer userid) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		IUserDao userMapper = ac.getBean(IUserDao.class);
		User result = userMapper.selectUserInfo(userid);
		return result;
	}
	//�޸�����
	public int xiugaimima(Integer id, String newpassword) {
		int result = userMapper.xiugaimima(id,newpassword);
		return result;
	}

}
