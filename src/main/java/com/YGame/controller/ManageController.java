package com.YGame.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.YGame.pojo.GameFWQ;
import com.YGame.pojo.GameList;
import com.YGame.pojo.Manage;
import com.YGame.pojo.Slider;
import com.YGame.pojo.User;
import com.YGame.service.ManageService;


@Controller
public class ManageController {
	
	@Autowired
	private ManageService manageservice;

	//管理员登录界面的跳转
	@RequestMapping("/manage")
	public String manageIndex() {
		return "jsp/manage";
	}
	//管理中心界面的跳转
	@RequestMapping("/managecenter")
	public String manageCenter() {
		return "jsp/managecenter";
	}
	
	//游戏管理的跳转
	@RequestMapping("/gameguanli")
	public String gameguanli(HttpServletRequest request) {
		List<GameList> list = manageservice.selectGameList();
		HttpSession session = request.getSession();
		session.setAttribute("gamelist", list);
		return "jsp/gameguanli";
	}
	
	//登录功能
	@RequestMapping( value="/manageLogin" , method=RequestMethod.POST)
	@ResponseBody
	public int manageLogin(@RequestParam("manageName") String manageName,@RequestParam("managePassword") String managePassword,HttpServletRequest request) {
		
		List<Manage> list = manageservice.userLogin(manageName, managePassword);
		HttpSession session = request.getSession();
		if( list.size() != 0) {
			Manage manage = list.get(0);
			session.setAttribute("manage", manage);
			return 1;
		}else {
			return 0;
		}
	}
	//添加游戏
	@RequestMapping( value="/addGame" , method=RequestMethod.POST)
	@ResponseBody
	public int addGame(HttpServletRequest request) {
		int result = manageservice.addGame(request);
		return result;
	}
	//更新游戏
	@RequestMapping( value="/updateGame" , method=RequestMethod.POST)
	@ResponseBody
	public int updateGame(HttpServletRequest request) {
		int result = manageservice.updateGame(request);
		return result;
	}
	//删除游戏
	@RequestMapping( value="/deleteGame" , method=RequestMethod.POST)
	@ResponseBody
	public int deleteGame(HttpServletRequest request) {
		int result = manageservice.deleteGame(request);
		return result;
	}
	
	
	//服务器管理界面跳转
	@RequestMapping("/fuwuqiguanli")
	public String fuwuqiguanli(HttpServletRequest request) {
		List<GameFWQ> list = manageservice.fuwuqiguanli();
		HttpSession session = request.getSession();
		session.setAttribute("fwqlist", list);
		return "jsp/fuwuqiguanli";
	}
	//添加服务器
	@RequestMapping("/addFWQ")
	@ResponseBody
	public int addFWQ(HttpServletRequest request) {
		int result = manageservice.addFWQ(request);
		return result;
	}
	//修改服务器
	@RequestMapping("/updateFWQ")
	@ResponseBody
	public int updateFWQ(HttpServletRequest request) {
		int result = manageservice.updateFWQ(request);
		return result;
	}
	//删除服务器
	@RequestMapping("/deleteFWQ")
	@ResponseBody
	public int deleteFWQ(HttpServletRequest request) {
		int result = manageservice.deleteFWQ(request);
		return result;
	}
	
	
	//用户管理界面跳转
	@RequestMapping("/userguanli")
	public String userguanli(HttpServletRequest request) {
		List<User> list = manageservice.userguanli();
		HttpSession session = request.getSession();
		session.setAttribute("userlist", list);
		return "jsp/userguanli";
	}
	//更新用户状态
	@RequestMapping("/updateusertype")
	@ResponseBody
	public int updateusertype(HttpServletRequest request) {
		int result = manageservice.updateusertype(request);
		return result;
	}
	//删除用户
	@RequestMapping("/deleteuser")
	@ResponseBody
	public int deleteuser(HttpServletRequest request) {
		int result = manageservice.deleteuser(request);
		return result;
	}
	
	
	
	//轮播图管理界面跳转
	@RequestMapping("/lbtguanli")
	public String lbtguanli(HttpServletRequest request) {
		List<Slider> list = manageservice.lbtguanli();
		HttpSession session = request.getSession();
		session.setAttribute("lbtlist", list);
		return "jsp/lbtguanli";
	}
	//更新轮播图显示
	@RequestMapping("/updatelbt")
	@ResponseBody
	public int updatelbt(HttpServletRequest request) {
		int result = manageservice.updatelbt(request);
		return result;
	}
	
}
