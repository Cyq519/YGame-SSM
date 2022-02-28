package com.YGame.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.YGame.pojo.GameFWQ;
import com.YGame.pojo.GameList;
import com.YGame.pojo.Manage;
import com.YGame.pojo.Slider;
import com.YGame.pojo.User;

public interface ManageService {
	List<Manage> userLogin(String manageName, String managePassword);
	List<GameList> selectGameList();
	int addGame(HttpServletRequest request);
	int updateGame(HttpServletRequest request);
	int deleteGame(HttpServletRequest request);
	List<GameFWQ> fuwuqiguanli();
	int addFWQ(HttpServletRequest request);
	int updateFWQ(HttpServletRequest request);
	int deleteFWQ(HttpServletRequest request);
	
	List<User> userguanli();
	int updateusertype(HttpServletRequest request);
	int deleteuser(HttpServletRequest request);
	List<Slider> lbtguanli();
	int updatelbt(HttpServletRequest request);
}
