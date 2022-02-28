package com.YGame.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.pojo.GameList;
import com.YGame.pojo.MysaleSelectExample;
import com.YGame.pojo.Product;
import com.YGame.pojo.TTransaction;

public interface ProductService {
	
	
	int addProduct(HttpServletRequest request, MultipartFile[] files);

	List<GameList> selectList();
	List<String> selectList2(String DaFenLei);
	List<Product> indexSelectImage();
	Product selectProductXq(String id);
	List<GameList> selectGameList(String datavalue,String rmyx,String gamekhd);
	List<GameList> selectHotGame(String datavalue);
	List<String> selectGameInfo(String gamename);
	List<String> selectGameInfo2(String gamename);
	List<Product> selectGameInfo3(String type1,String type2,String sort);
	List<String> selectDQ(String gamename);
	List<String> selectFWQ(String type1,String dq,String pt);
	List<Product> selectMyProduct(String id,String pxfs);
	
	int updateProduct(HttpServletRequest request, MultipartFile[] files);
	int deleteMyProduct(String id);
	int reduceMyProductNum(String id,Integer num);
	int addUnPaid(String id,String buynum);
	int addTransAction(String id,String loginid,String num,String usernc,String state);
	
	List<TTransaction> myBuyProductInfo(String userid,String pxfs);
	int deleteMyBuyProductInfo(String listid);
	List<TTransaction> mySaleProductInfo(String userid);
	int addCollection(String id, String loginid);
	int deleteMySaleProductInfo(String listid); 
	List<Product> selectMyCollectionProductInfo(String myid);
	int deleteMyCollection(String goodsid,String userid);
	
	int changeProductState(String state,String goodsid);
	int updateMyBuyProductInfo(String ddid);
	int cancelOrder(String ddid,String goodsid,String buynum);
	int confirmReceipt(String ddid,Integer userid,Integer myid);
	int applyRrefund(String ddid,String type,String reason);
	TTransaction selectDDById(String ddid);
	
	int agreeRefund(String ddId,Integer myid);
	int refuseRefund(String ddId);
	
	List<String> selectMyProductType(Integer myid);
	List<Product> selectMyByGameType1(String type,Integer myid);
	List<Product> selectMyByGameType2(String type,String type2,Integer myid);
	List<String> selectTypeByJY(Integer myid);
	List<TTransaction> mybuyByGoodsType(Integer myid,String type,String pxfs);
}
