package com.YGame.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.YGame.dao.IManageDao;
import com.YGame.pojo.GameFWQ;
import com.YGame.pojo.GameList;
import com.YGame.pojo.Manage;
import com.YGame.pojo.User;
import com.YGame.service.ManageService;

import com.YGame.pojo.Slider;
import org.springframework.test.context.ContextConfiguration;

@Service

@ContextConfiguration("classpath:/spring/applicationContext.xml")
public class ManageServiceImpl implements ManageService {
	@Autowired
	private IManageDao manageMapper;
	
	@Override
	public List<Manage> userLogin(String manageName, String managePassword){
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IManageDao manageMapper = ac.getBean(IManageDao.class);	
		List<Manage> list = manageMapper.userLogin(manageName,managePassword);
		if( list != null) {
			return list;
		}else {
			return null;
		}
	}
	//查询游戏列表
	@Override
	public List<GameList> selectGameList(){
		List<GameList> list = manageMapper.selectGameList();
		if( list != null) {
			return list;
		}else {
			return null;
		}
	}
	//插入新的游戏
	@Override
	public int addGame(HttpServletRequest request){
		//int id =  Integer.parseInt(request.getParameter("id"));
		String gamename = request.getParameter("gamename");
		String initials = request.getParameter("initials");
		int hot = Integer.parseInt(request.getParameter("hot"));
		String gamelogo = request.getParameter("gamelogo");
		int client = Integer.parseInt(request.getParameter("client"));
		int iosorandroid = Integer.parseInt(request.getParameter("iosorandroid"));
		
		GameList gamelist = new GameList();
		//gamelist.setId(id);
		gamelist.setGamename(gamename);
		gamelist.setInitials(initials);
		gamelist.setHot(hot);
		gamelist.setGamelogo(gamelogo);
		gamelist.setClient(client);
		gamelist.setIosorandroid(iosorandroid);
		
		int result= manageMapper.addGame(gamelist);
		return result;
	}
	
	//修改游戏信息
	@Override
	public int updateGame(HttpServletRequest request){
		int id =  Integer.parseInt(request.getParameter("id"));
		String gamename = request.getParameter("gamename");
		String initials = request.getParameter("initials");
		int hot = Integer.parseInt(request.getParameter("hot"));
		String gamelogo = request.getParameter("gamelogo");
		int client = Integer.parseInt(request.getParameter("client"));
		int iosorandroid = Integer.parseInt(request.getParameter("iosorandroid"));
		
		GameList gamelist = new GameList();
		gamelist.setId(id);
		gamelist.setGamename(gamename);
		gamelist.setInitials(initials);
		gamelist.setHot(hot);
		gamelist.setGamelogo(gamelogo);
		gamelist.setClient(client);
		gamelist.setIosorandroid(iosorandroid);
		
		int result= manageMapper.updateGame(gamelist);
		return result;
	}
	//删除游戏信息
	@Override
	public int deleteGame(HttpServletRequest request){
		int id =  Integer.parseInt(request.getParameter("id"));
	
		int result= manageMapper.deleteGame(id);
		return result;
	}
	//查询服务器信息
	@Override
	public List<GameFWQ> fuwuqiguanli(){
		List<GameFWQ> list = manageMapper.fuwuqiguanli();
		if( list != null) {
			return list;
		}else {
			return null;
		}
	}
	//添加服务器
	@Override
	public int addFWQ(HttpServletRequest request) {
		String gamename = request.getParameter("gamename");
		String gamept = request.getParameter("gamept");
		String gamedq = request.getParameter("gamedq");
		String gamefuwuqi = request.getParameter("gamefuwuqi");

		GameFWQ fwqlist = new GameFWQ();
		fwqlist.setGameName(gamename);
		fwqlist.setGamept(gamept);
		fwqlist.setGamedq(gamedq);
		fwqlist.setGamefuwuqi(gamefuwuqi);	
		int result= manageMapper.addFWQ(fwqlist);
		return result;
	}
	//修改服务器
	@Override
	public int updateFWQ(HttpServletRequest request) {
		int id =  Integer.parseInt(request.getParameter("id"));
		String gamename = request.getParameter("gamename");
		String gamept = request.getParameter("gamept");
		String gamedq = request.getParameter("gamedq");
		String gamefuwuqi = request.getParameter("gamefuwuqi");
		
		GameFWQ fwqlist = new GameFWQ();
		fwqlist.setId(id);
		fwqlist.setGameName(gamename);
		fwqlist.setGamept(gamept);
		fwqlist.setGamedq(gamedq);
		fwqlist.setGamefuwuqi(gamefuwuqi);	
		int result= manageMapper.updateFWQ(fwqlist);
		return result;
	}
	//删除服务器
	@Override
	public int deleteFWQ(HttpServletRequest request) {
		int id =  Integer.parseInt(request.getParameter("id"));
		int result= manageMapper.deleteFWQ(id);
		return result;
	}
	
	//查询用户信息
	@Override
	public List<User> userguanli() {
		List<User> result= manageMapper.userguanli();
		return result;
	}
	//更新用户状态
	@Override
	public int updateusertype(HttpServletRequest request) {
		int id =  Integer.parseInt(request.getParameter("id"));
		String type = request.getParameter("usertype");
		
		int result= manageMapper.updateusertype(id,type);
		return result;
	}
	//删除用户
	@Override
	public int deleteuser(HttpServletRequest request) {
		int id =  Integer.parseInt(request.getParameter("id"));
		
		int result= manageMapper.deleteuser(id);
		return result;
	}
	
	//查询轮播图
	@Override
	public List<Slider> lbtguanli(){
		List<Slider> result= manageMapper.lbtguanli();
		return result;
	}
	//更新轮播图
	public int updatelbt(HttpServletRequest request) {
		int id =  Integer.parseInt(request.getParameter("id"));
		String value =  request.getParameter("value");
		int result1 = manageMapper.updatelbt(id,value);
		int result2 = manageMapper.updatelbt2(id,value);
		if( result1 == 1 && result2 == 1 ) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
}
