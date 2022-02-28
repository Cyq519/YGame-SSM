package com.YGame.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.dao.IProductDao;
import com.YGame.interceptor.LoginInterceptor;
import com.YGame.pojo.GameList;
import com.YGame.pojo.MysaleSelectExample;
import com.YGame.pojo.Product;
import com.YGame.pojo.TTransaction;
import com.YGame.pojo.User;
import com.YGame.service.ProductService;

import net.sf.json.JSONArray;



@Controller
public class ProductController {
	@Autowired
	private ProductService productservice;
	
	@RequestMapping( value="/addproduct.action" , method=RequestMethod.POST)
	@ResponseBody
	public int  addProduct(@RequestParam("prodFile") MultipartFile[] files ,HttpServletRequest request) {

		int result = productservice.addProduct(request, files);
		return result;
		
	}
	
	@RequestMapping( value="/JZSelect" , method=RequestMethod.POST)
	@ResponseBody
	public List<GameList> JiaZaiSelect() {
		
		try {
			List<GameList> selectList = productservice.selectList();
			return selectList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	@RequestMapping( value="/JZSelect2" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> JiaZaiSelect2(@RequestParam("SDL") String DaFenLei) {

		try {
			List<String> selectList = productservice.selectList2(DaFenLei);
			return selectList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	@RequestMapping( value="/indexselectimage" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> indexSelectImage(){
		List<Product> imglist = productservice.indexSelectImage();
		
		return imglist;
	}
	
	@RequestMapping( value="/selectProductXq" , method=RequestMethod.POST)
	@ResponseBody
	public Product selectProductXq(@RequestParam("id") String id){
		Product product = productservice.selectProductXq(id);
		
		return product;
	}
	@RequestMapping( value="/selectgamelist" , method=RequestMethod.POST)
	@ResponseBody
	public List<GameList> selectGameList(@RequestParam("datavalue") String datavalue,@RequestParam("rmyx") String rmyx,@RequestParam("gamekhd") String gamekhd){
		List<GameList> gamelist = productservice.selectGameList(datavalue,rmyx,gamekhd);
		
		return gamelist;
	}
	@RequestMapping( value="/selecthotgame" , method=RequestMethod.POST)
	@ResponseBody
	public List<GameList> selectHotGame(@RequestParam("datavalue") String datavalue){
		List<GameList> gamelist = productservice.selectHotGame(datavalue);
		
		return gamelist;
	}
	@RequestMapping( value="/selectgameinfo" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectGameInfo(@RequestParam("gamename") String gamename){
		List<String> pro = productservice.selectGameInfo(gamename);

		return pro;
	}
	@RequestMapping( value="/selectgameinfo2" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectGameInfo2(@RequestParam("gamename") String gamename){
		List<String> pro = productservice.selectGameInfo2(gamename);
		return pro;
	}
	
	@RequestMapping( value="/selectproductinfo3" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> selectproductinfo3(@RequestParam("type1") String type1,@RequestParam("type2") String type2,@RequestParam("sort") String sort){
		List<Product> pro = productservice.selectGameInfo3(type1,type2,sort);
		return pro;
	}
	//搜索游戏平台
//	@RequestMapping( value="/selectPT" , method=RequestMethod.POST)
//	@ResponseBody
//	public List<String> selectPT(@RequestParam("DL") String gamename){
//		List<String> list = productservice.selectPT(gamename);
//		return list;
//	}
	
	//搜索游大区
	@RequestMapping( value="/selectDQ" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectDQ(@RequestParam("DL") String gamename){
		List<String> pro = productservice.selectDQ(gamename);
		return pro;
	}
	
	//搜索游戏服务器
	@RequestMapping( value="/selectFwq" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectFWQ(@RequestParam("type1") String type1,@RequestParam("DQ") String dq,@RequestParam("pt") String pt){
		List<String> pro = productservice.selectFWQ(type1,dq,pt);
		return pro;
	}
	
	//搜索我的产品
	@RequestMapping( value="/selectMyProduct" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> selectMyProduct(@RequestParam("myid") String id,@RequestParam("pxfs") String pxfs){
		List<Product> list = productservice.selectMyProduct(id,pxfs);
		return list;
	}
		
	//修改商品 包括 信息和图片的修改
	@RequestMapping( value="/updateProduct" , method=RequestMethod.POST)
	@ResponseBody
	public int updateProduct(@RequestParam("prodFile") MultipartFile[] files ,HttpServletRequest request){
		int result = productservice.updateProduct(request, files);
		return result;
	}
	//删除我的产品   或者购买后数量为0也删除
	@RequestMapping( value="/deleteMyProduct" , method=RequestMethod.POST)
	@ResponseBody
	public int deleteMyProduct(@RequestParam("id") String id){
		int result = productservice.deleteMyProduct(id);
		return result;
	}
	
	//购买商品  商品数量对应减少
	@RequestMapping( value="/reduceMyProductNum" , method=RequestMethod.POST)
	@ResponseBody
	public int reduceMyProductNum(@RequestParam("id") String id,@RequestParam("num") Integer num){
		int result = productservice.reduceMyProductNum(id,num);
		return result;
	}
	//下单未支付 对应的未支付列加上对应的数量
	@RequestMapping( value="/addUnPaid" , method=RequestMethod.POST)
	@ResponseBody
	public int addUnPaid(@RequestParam("id") String id,@RequestParam("buynum") String buynum){
		int result = productservice.addUnPaid(id,buynum);
		return result;
	}
	
	//购买商品  交易信息表增加对应内容
	@RequestMapping( value="/addTransAction" , method=RequestMethod.POST)
	@ResponseBody
	public int addTransAction(@RequestParam("id") String id,@RequestParam("loginid") String loginid,@RequestParam("num") String num,@RequestParam("usernc") String usernc,@RequestParam("state") String state){
		int result = productservice.addTransAction(id,loginid,num,usernc,state);
		return result;
	}	
	//查询我购买的产品的信息
	@RequestMapping( value="/myBuyProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public List<TTransaction> myBuyProductInfo(@RequestParam("myid") String userid,@RequestParam("pxfs") String pxfs){
		List<TTransaction> trans = productservice.myBuyProductInfo(userid,pxfs);
		return trans;
	}
	//删除我购买的订单信息
	@RequestMapping( value="/deleteMyBuyProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public int deleteMyBuyProductInfo(@RequestParam("id") String listid){
		int result = productservice.deleteMyBuyProductInfo(listid);
		return result;
	}
	//查询我卖出的产品的信息
	@RequestMapping( value="/mySaleProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public List<TTransaction> mySaleProductInfo(@RequestParam("myid") String userid){
		List<TTransaction> trans = productservice.mySaleProductInfo(userid);
		return trans;
	}
	//删除我卖出的商品 订单信息
	@RequestMapping( value="/deleteMySaleProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public int deleteMySaleProductInfo(@RequestParam("id") String listid){
		int result = productservice.deleteMySaleProductInfo(listid);
		return result;
	}

	//添加收藏
	@RequestMapping( value="/addCollection" , method=RequestMethod.POST)
	@ResponseBody
	public int addCollection(@RequestParam("id") String id , @RequestParam("loginid") String loginid){
		int result = productservice.addCollection( id, loginid);
		return result;
	}
	// 查询 我收藏的产品的详细信息
	@RequestMapping( value="/selectMyCollectionProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> selectMyCollectionProductInfo(@RequestParam("myid") String myid){
		List<Product> result = productservice.selectMyCollectionProductInfo(myid);
		return result;
	}
	//删除收藏
	@RequestMapping( value="/deleteMyCollection" , method=RequestMethod.POST)
	@ResponseBody
	public int deleteMyCollection(@RequestParam("goodsid") String goodsid , @RequestParam("userid") String userid){
		int result = productservice.deleteMyCollection( goodsid, userid);
		return result;
	}
	//修改商品状态 上架下架
	@RequestMapping( value="/changeProductState" , method=RequestMethod.POST)
	@ResponseBody
	public int changeProductState(@RequestParam("state") String state,@RequestParam("id") String goodsid){
		int result = productservice.changeProductState( state,goodsid);
		return result;
	}
	//修改我购买商品的交易状态 比如 生成订单未付款 付款后状态改为已付款
	@RequestMapping( value="/updateMyBuyProductInfo" , method=RequestMethod.POST)
	@ResponseBody
	public int updateMyBuyProductInfo(@RequestParam("ddid") String ddid){
		int result = productservice.updateMyBuyProductInfo( ddid );
		return result;
	}
	//取消订单
	@RequestMapping( value="/cancelOrder" , method=RequestMethod.POST)
	@ResponseBody
	public int cancelOrder(@RequestParam("ddid") String ddid ,@RequestParam("goodsid") String goodsid,@RequestParam("buynum") String buynum){
		int result = productservice.cancelOrder( ddid,goodsid,buynum );
		return result;
	}
	//确认收货
	@RequestMapping( value="/confirmReceipt" , method=RequestMethod.POST)
	@ResponseBody
	public int confirmReceipt(@RequestParam("ddid") String ddid,@RequestParam("userid") Integer userid,@RequestParam("myid") Integer myid){
		int result = productservice.confirmReceipt( ddid ,userid,myid);
		return result;
	}
	
	//申请退款
	@RequestMapping( value="/applyRrefund" , method=RequestMethod.POST)
	@ResponseBody
	public int applyRrefund(@RequestParam("ddid") String ddid,@RequestParam("type") String type,@RequestParam("reason") String reason){
		
		int result = productservice.applyRrefund( ddid,type,reason );
		return result;
	}
	//根据订单编号 查询订单信息
	@RequestMapping( value="/selectDDById" , method=RequestMethod.POST)
	@ResponseBody
	public TTransaction selectDDById(@RequestParam("ddid")String ddid) {
		TTransaction t = productservice.selectDDById(ddid);
		return t;
	}
	//同意退款
	@RequestMapping( value="/agreeRefund" , method=RequestMethod.POST)
	@ResponseBody
	public int agreeRefund(@RequestParam("ddId") String ddId,@RequestParam("myid") Integer myid){
		int result = productservice.agreeRefund( ddId ,myid);
		return result;
	}
	//拒绝退款
	@RequestMapping( value="/refuseRefund" , method=RequestMethod.POST)
	@ResponseBody
	public int refuseRefund(@RequestParam("ddId") String ddId){
		int result = productservice.refuseRefund( ddId );
		return result;
	}
	//搜索我上架商品有哪些种类
	@RequestMapping( value="/selectMyProductType" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectMyProductType(@RequestParam("myid") Integer myid){
		List<String> result = productservice.selectMyProductType( myid );
		return result;
	}
	
	//根据游戏种类搜索我售卖的商品
	@RequestMapping( value="/selectMyByGameType1" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> selectMyByGameType1(@RequestParam("type") String type,@RequestParam("myid") Integer myid){
		List<Product> result = productservice.selectMyByGameType1( type ,myid);
		return result;
	}
	//根据游戏种类搜索我售卖的商品
	@RequestMapping( value="/selectMyByGameType2" , method=RequestMethod.POST)
	@ResponseBody
	public List<Product> selectMyByGameType2(@RequestParam("type") String type,@RequestParam("type2") String type2,@RequestParam("myid") Integer myid){
		List<Product> result = productservice.selectMyByGameType2( type ,type2,myid);
		return result;
	}
	//我购买产品页面 初始化加载商品种类
	@RequestMapping( value="/selectTypeByJY" , method=RequestMethod.POST)
	@ResponseBody
	public List<String> selectTypeByJY(@RequestParam("myid") Integer myid){
		List<String> result = productservice.selectTypeByJY(myid);
		return result;
	}
	//我购买产品页面 点击分类切换
	@RequestMapping( value="/mybuyByGoodsType" , method=RequestMethod.POST)
	@ResponseBody
	public List<TTransaction> mybuyByGoodsType(@RequestParam("myid") Integer myid,@RequestParam("type") String type,@RequestParam("pxfs") String pxfs){
		List<TTransaction> result = productservice.mybuyByGoodsType(myid,type,pxfs);
		return result;
	}
	
}
