package com.YGame.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.YGame.pojo.GameFWQ;
import com.YGame.pojo.GameList;
import com.YGame.pojo.Manage;
import com.YGame.pojo.Slider;
import com.YGame.pojo.User;

public interface IManageDao {
	 List<Manage> userLogin(@Param(value="manageName") String manageName, @Param(value="managePassword") String managePassword);
	 List<GameList> selectGameList();
	 int addGame(GameList gamelist);
	 int updateGame(GameList gamelist);
	 int deleteGame(int id);
	 List<GameFWQ> fuwuqiguanli();
	 int addFWQ(GameFWQ gamefwq);
	 int updateFWQ(GameFWQ gamefwq);
	 int deleteFWQ(int id);
	 List<User> userguanli();
	 int updateusertype(@Param(value="id") int id, @Param(value="type") String type);
	 int deleteuser(int id);
	 List<Slider> lbtguanli();
	 int updatelbt(@Param(value="id") int id, @Param(value="value") String value);
	 int updatelbt2(@Param(value="id") int id, @Param(value="value") String value);
}
