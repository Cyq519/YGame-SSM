package com.YGame.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.YGame.pojo.GameList;
import com.YGame.pojo.MysaleSelectExample;
import com.YGame.pojo.Product;
import com.YGame.pojo.TTransaction;
import com.YGame.pojo.User;

public interface IProductDao {
	List<GameList> SelectLists() ;
	List<String> SelectLists2(String DaFenLei) ;
	String storeAddress(String type1);
	int insertProduct(Product prodcutinfo);
	List<Product> indexSelectImg();
	Product selectProductXq(String id);
	List<GameList> selectGameList(@Param(value="gamekhd") String gamekhd,@Param(value="rmyx") String rmyx,@Param(value="datavalue")String datavalue);
	List<GameList> selectHotGame(String datavalue);
	List<String> selectGameInfo(String gamename);
	List<String> selectGameInfo2(String gamename);
	List<Product> selectGameInfo3(@Param(value="type1")String type1,@Param(value="type2")String type2,@Param(value="sort")String sort);
	List<String> selectDQ(String gamename);
	List<String> selectFWQ(@Param(value="type1")String type1,@Param(value="dq")String dq,@Param(value="pt")String pt);
	List<Product> selectMyProduct(@Param(value="id")String id,@Param(value="pxfs")String pxfs);

	int updateProduct(Product product);
	int deleteMyProduct(String id);
	int addUnPaid(@Param(value="id")String id,@Param(value="buynum")String buynum);
	int selectUnPaidNum(String id);
	int reduceMyProductNum(@Param(value="id")String id,@Param(value="num")String num);
	int addTransAction(TTransaction transaction);
	int addTransAction2(TTransaction transaction);
	List<TTransaction> myBuyProductInfo(@Param(value="userid")String userid,@Param(value="pxfs")String pxfs);
	int deleteMyBuyProductInfo(String userid);
	List<TTransaction> mySaleProductInfo(String userid);
	int deleteMySaleProductInfo(String listid);
	int addCollection(@Param(value="id")String id, @Param(value="loginid")String loginid);
	Integer selectCollectionInfo(@Param(value="id")String id,@Param(value="loginid")String loginid);
	
	List<Integer> selectMyCollectionProductId(String myid);
	List<Product> selectMyCollectionProductInfo(List<Integer> idList);
	int deleteMyCollection(@Param(value="goodsid")String goodsid, @Param(value="userid")String userid);
	int changeProductState(@Param(value="state")int state,@Param(value="goodsid")String goodsid);
	int updateMyBuyProductInfo(String ddid);
	int updateMySaleProductInfo(String ddid);
	
	int cancelOrder(String ddid);
	int cancelOrder2(String ddid);
	int cancelOrderAddProductNumber(@Param(value="goodsid" )String goodsid,@Param(value="buynum") String buynum);
	int confirmReceipt(@Param(value="ddid" ) String ddid, @Param(value="T" )String T);
	int applyRrefund(@Param(value="ddid" ) String ddid,@Param(value="type" )String type,@Param(value="reason" )String reason, @Param(value="Param" )String Param);
	
	TTransaction selectDDById(String ddid);
	int agreeRefund(@Param(value="ddId" ) String ddId, @Param(value="Param" )String Param);
	int refuseRefund(@Param(value="ddId" ) String ddId, @Param(value="Param" )String Param);
	
	List<String> selectMyProductType(Integer myid);
	List<Product> selectMyByGameType1( @Param(value="type" )String type ,  @Param(value="myid" )Integer myid);
	List<Product> selectMyByGameType2(@Param(value="type" )String type , @Param(value="type2" )String type2 , @Param(value="myid" )Integer myid);
	List<String> selectTypeByJY(Integer myid);
	List<TTransaction> mybuyByGoodsType( @Param(value="myid" )Integer myid,@Param(value="type" )String type ,@Param(value="pxfs" )String pxfs);
	
}
