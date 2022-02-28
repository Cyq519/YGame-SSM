package com.YGame.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.pojo.User;

public interface UserService {
	
	int userRegister(String userName,String password);
	List<User> userLogin(String userName,String password);
	int updataUserInfo(HttpServletRequest request, MultipartFile file);
	User selectUserInfo(Integer userid);
	int xiugaimima(Integer id, String newpassword);
}
