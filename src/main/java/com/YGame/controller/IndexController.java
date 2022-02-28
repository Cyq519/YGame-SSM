package com.YGame.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.YGame.pojo.Slider;
import com.YGame.service.ManageService;

//控制页面跳转
@Controller
public class IndexController {
	@Autowired
	private ManageService manageservice;
	
	@RequestMapping("/index")
	public String showIndex(HttpServletRequest request) {
		//List<Slider> list = manageservice.lbtguanli();
		//HttpSession session = request.getSession();
		//session.setAttribute("lbtlist", list);
		return "jsp/index";
	}
	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	@RequestMapping("/register")
	public String showRegister() {
		return "register";
	}
	@RequestMapping("/mysale")
	public String showMySale() {
		return "jsp/mysale";
	}
	@RequestMapping("/personal")
	public String personalCenter() {
		return "jsp/personal";
	}

	@RequestMapping("/mybuyproduct")
	public String mybuyProduct() {
		return "jsp/mybuyproduct";
	}
	@RequestMapping("/mysaleproduct")
	public String mysaleProduct() {
		return "jsp/mysaleproduct";
	}
	@RequestMapping("/myproduct")
	public String myproduct() {
		return "jsp/myproduct";
	}
	@RequestMapping("/mycollection")
	public String mycollection() {
		return "jsp/mycollection";
	}
	@RequestMapping("/notice")
	public String notice() {
		return "jsp/notice";
	}
	@RequestMapping("/personalcenter")
	public String personalcenter() {
		return "jsp/personalcenter";
	}
	@RequestMapping("/wholeproduct")
	public String wholeProduct() {
		return "jsp/wholeproduct";
	}
	@RequestMapping("/productxq")
	public String productXq() {
		return "jsp/productxq";
	}
	@RequestMapping("/productlist")
	public String productList() {
		return "jsp/productlist";
	}
	@RequestMapping("/notice_index")
	public String notice_Index() {
		return "jsp/notice_index";
	}
	@RequestMapping("/notice1")
	public String notice1() {
		return "jsp/notice1";
	}
	//跳转修改商品页面
	@RequestMapping("/productModify")
	public String productModify() {
		return "jsp/productmodify";
	}
	//跳转修改商品页面
	@RequestMapping("/xiugaimima")
	public String xiugaimima() {
		return "jsp/xiugaimima";
	}
}

