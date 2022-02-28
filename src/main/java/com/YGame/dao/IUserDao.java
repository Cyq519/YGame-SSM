package com.YGame.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.YGame.pojo.User;

public interface IUserDao {
	List<User> usersLogin(@Param(value="userName") String userName,@Param(value="password") String password);
	int userRegister(User userinfo);
	List<User> checkUserName(String userName);
	int updataUserInfo(User user);
	User updateSession(String userName);
	int saleNumAdd(Integer userid);
	int cancelNumAdd(Integer myid);
	User selectUserInfo(Integer userid);
	int addBuyNum(Integer one);
	int xiugaimima(@Param(value="id") Integer id,@Param(value="newpassword") String newpassword);
}
