package com.YGame.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.YGame.dao.IProductDao;
import com.YGame.dao.IUserDao;
import com.YGame.pojo.GameList;
import com.YGame.pojo.MysaleSelectExample;
import com.YGame.pojo.Product;
import com.YGame.pojo.TTransaction;
import com.YGame.service.ManageService;


@Service
public class ProductService implements com.YGame.service.ProductService {
	@Autowired
	private IProductDao IPDMapper;
	
	@Autowired
	private IUserDao userMapper;
	
	//�����Ʒ
	public int addProduct(HttpServletRequest request , MultipartFile[] files) {
		Product productinfo = new Product();
		String goodsName    = request.getParameter("goodsName");
		String goodsPrice   = request.getParameter("goodsPrice");
		String goodsJieShao = request.getParameter("goodsJieShao");
		String goodsNumber  = request.getParameter("goodsNumber");
		String goodsType1   = request.getParameter("goodsType1");
		String goodsType2   = request.getParameter("goodsType2");
		String userName = request.getParameter("userName");
		int userID =  Integer.parseInt(request.getParameter("loginId"));
		String gamept = request.getParameter("goodspt");
		String gamedq = request.getParameter("goodsdq");
		String gamefwq = request.getParameter("goodsfwq");
		int goodszt = 1;
		Date date = new Date();  
		Timestamp timeStamp = new Timestamp(date.getTime());  
		int Unpaid = 0;
		productinfo.setUnpaid(Unpaid);
		productinfo.setUserName(userName);
		productinfo.setGoodsTime(timeStamp);
		productinfo.setUserID(userID);
		productinfo.setGoodsName(goodsName);
		productinfo.setGoodsPrice( Integer.parseInt(goodsPrice) );
		productinfo.setGoodsJieShao(goodsJieShao);
		productinfo.setGoodsNumber(goodsNumber);
		productinfo.setGameType1(goodsType1);
		productinfo.setGameType2(goodsType2);
		
		productinfo.setGamept(gamept);
		productinfo.setGamedq(gamedq);
		productinfo.setGamefwq(gamefwq);
		productinfo.setGoodszt(goodszt);
		
		String Path = addressPD(goodsType1);
		String[] xnPath = new String[6];
		
		int index = 1;
		for(MultipartFile file:files){
			
			String s =file.getOriginalFilename();
			String suffix = s.substring(s.indexOf("."));
			String uuid = UUID.randomUUID().toString();
			String filename = uuid+suffix;
			String realPath = Path + filename;
			//��ȡ25λ������ַ���  ��������·��
			String xuniPath = Path.substring(25)+filename;
			xnPath[index] = xuniPath;
			addXNAddress(index,productinfo,xnPath);
			index++;
			try {
				file.transferTo(new File(realPath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper. insertProduct(productinfo);	
		if( result == 1 ) {
			return result;
		}else {
			return 0;
		}

	}
	
	public String addressPD(String type1) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		String address = IPDMapper.storeAddress(type1);	
		return address;
	}
	public void addXNAddress(int index,Product productinfo,String[] xnPath) {
		if( index == 1) {
			productinfo.setGoodsImage1(xnPath[1]);
		}
		if( index == 2) {
			productinfo.setGoodsImage2(xnPath[2]);
		}
		if( index == 3) {
			productinfo.setGoodsImage3(xnPath[3]);
		}
		if( index == 4) {
			productinfo.setGoodsImage4(xnPath[4]);
		}
		if( index == 5) {
			productinfo.setGoodsImage5(xnPath[5]);
		}
	}
	public List<GameList> selectList(){

		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<GameList> list = IPDMapper. SelectLists();	
		if( list != null) {
			return list;
		}else {
			return null;
		}	
	}
	
	public List<String> selectList2(String DaFenLei){
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<String> list = IPDMapper. SelectLists2(DaFenLei);	
		if( list != null) {
			return list;
		}else {
			return null;
		}	
	}
	
	public List<Product> indexSelectImage(){
		
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<Product> list = IPDMapper.indexSelectImg();	

		return list;

	}
	//����id������Ʒ����
	public Product selectProductXq(String id) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		Product product = IPDMapper.selectProductXq(id);	
		return product;
	}
	//��������ĸ������Ϸ
	public List<GameList> selectGameList(String datavalue,String rmyx,String gamekhd){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<GameList> gamelist = IPDMapper.selectGameList(gamekhd,rmyx,datavalue);	
		return gamelist;
	}
	//����������Ϸ
	public List<GameList> selectHotGame(String datavalue){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<GameList> gamelist = IPDMapper.selectHotGame(datavalue);	
		return gamelist;
	}
	//����ѡ����Ϸ�ķ����logo
	public List<String> selectGameInfo(String gamename){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<String> gameinfo = IPDMapper.selectGameInfo(gamename);	
		return gameinfo;
	}
	public List<String> selectGameInfo2(String gamename){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<String> gameinfo = IPDMapper.selectGameInfo2(gamename);	
		return gameinfo;
	}
	//
	public List<Product> selectGameInfo3(String type1,String type2,String sort){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<Product> list = IPDMapper.selectGameInfo3(type1,type2,sort);	
		return list;
	}
	//������Ϸ����  
	public List<String> selectDQ(String gamename){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<String> list = IPDMapper.selectDQ(gamename);	
		return list;
	}
	//������Ϸ������ 
	public List<String> selectFWQ(String type1,String dq,String pt){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<String> list = IPDMapper.selectFWQ(type1,dq,pt);	
		return list;
	}
	//�����ҵ�������Ʒ
	public List<Product> selectMyProduct(String id,String pxfs){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<Product> list = IPDMapper.selectMyProduct(id,pxfs);	
		return list;
	}
	//�޸���Ʒ
	public int updateProduct(HttpServletRequest request , MultipartFile[] files) {
		Product productinfo = new Product();
		String goodsName    = request.getParameter("goodsName");
		String goodsPrice   = request.getParameter("goodsPrice");
		String goodsJieShao = request.getParameter("goodsJieShao");
		String goodsNumber  = request.getParameter("goodsNumber");
		String goodsType1   = request.getParameter("goodsType1");
		String goodsType2   = request.getParameter("goodsType2");
		int userID =  Integer.parseInt(request.getParameter("loginid"));
		String gamept = request.getParameter("goodspt");
		String gamedq = request.getParameter("goodsdq");
		String gamefwq = request.getParameter("goodsfwq");
		int id =  Integer.parseInt(request.getParameter("id"));
		int goodszt = 1;
		Date date = new Date();  
		Timestamp timeStamp = new Timestamp(date.getTime());  
		
		productinfo.setGoodsTime(timeStamp);
		productinfo.setUserID(userID);
		productinfo.setGoodsName(goodsName);
		productinfo.setGoodsPrice( Integer.parseInt(goodsPrice) );
		productinfo.setGoodsJieShao(goodsJieShao);
		productinfo.setGoodsNumber(goodsNumber);
		productinfo.setGameType1(goodsType1);
		productinfo.setGameType2(goodsType2);
		
		productinfo.setGamept(gamept);
		productinfo.setGamedq(gamedq);
		productinfo.setGamefwq(gamefwq);
		productinfo.setGoodszt(goodszt);
		
		//
		String imgSrc =  request.getParameter("imgSrc");
		String[] temp = imgSrc.substring(1, imgSrc.length()-1).split(",");
		System.out.print("tupianmnum");
		System.out.print(temp.length);
		int BeImgNum = temp.length;//��������ԭ������Ƭ��ֱ�Ӱ�·��д��ȥ  ��Ƭ���ö�; ����Ҳ��������ӵ���Ƭ������ ��Ҫȥ��
		String[] temp2 = new String[5];
		for(int i = 0;i<temp.length;i++) {
			temp2[i] = temp[i].substring(1,temp[i].length()-1);
		} 
		productinfo.setId(id);
		productinfo.setGoodsImage1(temp2[0]);
		productinfo.setGoodsImage2(temp2[1]);
		productinfo.setGoodsImage3(temp2[2]);
		productinfo.setGoodsImage4(temp2[3]);
		productinfo.setGoodsImage5(temp2[4]);
		//
		
		String Path = addressPD(goodsType1);
		String[] xnPath = new String[6];
		
		int NewImgNum = files.length;//����ӵ���Ƭ������
		int index = BeImgNum-NewImgNum+1;
		for(MultipartFile file:files){
			String s =file.getOriginalFilename();
			if( s == "" ) {
				continue;
			}
			String suffix = s.substring(s.indexOf("."));
			String uuid = UUID.randomUUID().toString();
			String filename = uuid+suffix;
			String realPath = Path + filename;
			//��ȡ25λ������ַ���  ��������·��
			String xuniPath = Path.substring(25)+filename;
			xnPath[index] = xuniPath;
			addXNAddress(index,productinfo,xnPath);
			index++;
			try {
				file.transferTo(new File(realPath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//ɾ����Ƭ
		String realPath =  request.getParameter("deleteImg");
		String[] imgtemp = realPath.substring(1, realPath.length()-1).split(",");
		String[] imgtemp2 = new String[5];
		for( int i = 0 ; i < imgtemp.length ; i++ ) {
			if( imgtemp[i].length() == 0  ) {
				continue;
			};
			imgtemp2[i] = imgtemp[i].substring(1,imgtemp[i].length()-1);
			try {
	            java.io.File myDelFile = new java.io.File(imgtemp2[i]);
	            myDelFile.delete();
	        } catch (Exception e) {
	            System.out.println("ɾ���ļ���������");
	            e.printStackTrace();
	        }
		} 

		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper. updateProduct(productinfo);	
		if( result == 1 ) {
			return result;
		}else {
			return 0;
		}

	}
	
	//ɾ����Ʒ  ������Ʒʱ ����Ϊ0��ɾ��
	public int deleteMyProduct(String id) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.deleteMyProduct(id);	
		return result;
	}
	
	//������Ʒʱ ������Ӧ����
	public int reduceMyProductNum(String id,Integer num) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		if( num == 0 ){
			int wzf = IPDMapper.selectUnPaidNum(id);
			if( wzf == 0 ) {
				int result = IPDMapper.deleteMyProduct(id);
				return result;
			}else {
				int result = IPDMapper.reduceMyProductNum(id, num.toString());
				return result;
			}
		}else {
			int result = IPDMapper.reduceMyProductNum(id, num.toString());
			return result;
		}
	}
	//�µ�δ֧�� ��Ӧ��δ֧���м��϶�Ӧ������
	public int addUnPaid(String id,String buynum) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.addUnPaid(id,buynum);	
		return result;
	}
	//������Ʒʱ ���ױ���Ӷ�Ӧ����
	public int addTransAction(String id,String loginid,String num,String usernc,String state) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		Product product = IPDMapper.selectProductXq(id);
		TTransaction  transaction = new TTransaction();
		
		Date date = new Date();  
		Timestamp timeStamp = new Timestamp(date.getTime());  
		transaction.setUpdatetime(timeStamp);
		String uuid = UUID.randomUUID().toString();
		transaction.setDdId( uuid );
		transaction.setGoodsId(product.getId());
		transaction.setState(state);
		transaction.setCustomerName( usernc );
		transaction.setSellerName( product.getUserName() );
		transaction.setCustomerId( Integer.parseInt(loginid) );
		transaction.setSellerId( product.getUserID() );
		transaction.setGoodsName( product.getGoodsName() );
		transaction.setGoodsPrice(  product.getGoodsPrice() );
		transaction.setGoodsType( product.getGameType1() + "-" + product.getGameType2());
		if( product.getGamept() == null || product.getGamept() == "" ) {
			transaction.setGameServer( product.getGamedq() + "/" + product.getGamefwq());
		}else {
			transaction.setGameServer( product.getGamept() + "/" + product.getGamedq() + "/" + product.getGamefwq());
		}
		
		transaction.setBuynumber( Integer.parseInt(num) );
		transaction.setGoodsJieShao(product.getGoodsJieShao());
		transaction.setGoodsImage1(product.getGoodsImage1());
		transaction.setGoodsImage2(product.getGoodsImage2());
		transaction.setGoodsImage3(product.getGoodsImage3());
		transaction.setGoodsImage4(product.getGoodsImage4());
		transaction.setGoodsImage5(product.getGoodsImage5());
		transaction.setRefund(1);
		//���ɹ���ʱ�� 
		Timestamp timeStamp2 = new Timestamp(date.getTime());  
		String dateTime = timeStamp.toString();
		transaction.setBuyTime(dateTime);
		int totalPrice = Integer.parseInt(num) * product.getGoodsPrice();
		transaction.setTotalPrice( totalPrice);
		
		
		int result = IPDMapper.addTransAction(transaction);	
		int result2 = IPDMapper.addTransAction2(transaction);
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//��ѯ�ҹ������Ʒ����Ϣ
	public List<TTransaction> myBuyProductInfo(String userid,String pxfs) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<TTransaction> result = IPDMapper.myBuyProductInfo(userid,pxfs);	
		return result;		
	}
	//ɾ���ҹ������Ʒ����Ϣ
	public int deleteMyBuyProductInfo(String listid) {
		//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
		//IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.deleteMyBuyProductInfo(listid);	
		return result;	
	}
	//��ѯ����������Ʒ����Ϣ
	public List<TTransaction> mySaleProductInfo(String userid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		List<TTransaction> result = IPDMapper.mySaleProductInfo(userid);	
		return result;		
	}
	//ɾ������������Ʒ����Ϣ
	public int deleteMySaleProductInfo(String listid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.deleteMySaleProductInfo(listid);	
		return result;	
	}
	//����ղ�
	public int addCollection(String id, String loginid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		//���ж�֮ǰ�Ƿ��ղع� �ղع��Ͳ����ظ��ղ���
		Integer re = IPDMapper.selectCollectionInfo(id,loginid);
		if( re != null ) {
			if( re != 0 ) {
				return 0;
			}
		}
		//���ݿ�����ղ���Ϣ
		int result = IPDMapper.addCollection(id,loginid);	
		return result;
	}
	
	// ��ѯ ���ղصĲ�Ʒ����ϸ��Ϣ
	public List<Product> selectMyCollectionProductInfo(String myid){
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		//�������ղ�����Щ��Ʒ ������Ʒid
		List<Integer> idList = IPDMapper.selectMyCollectionProductId(myid);
		if( idList.size() == 0 ) {
			return null;
		}
		//������Ʒ��Ϣ
		List<Product> result = IPDMapper.selectMyCollectionProductInfo(idList);	
		return result;	
	}
	//ɾ���ղ�
	public int deleteMyCollection(String goodsid,String userid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.deleteMyCollection(goodsid,userid);	
		return result;
	}
	//�޸���Ʒ״̬
	public int changeProductState(String state ,String goodsid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int newstate = 1;
		if(state.equals("�ϼ�") ) {
			newstate = 1;
		}else {
			newstate = 2;
		}
		int result = IPDMapper.changeProductState(newstate,goodsid);	
		return result;
	}
	//�޸��ҹ�����Ʒ�Ľ���״̬ ���� ���ɶ���δ���� �����״̬��Ϊ�Ѹ���
	public int updateMyBuyProductInfo(String ddid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		int result = IPDMapper.updateMyBuyProductInfo(ddid);	
		int result2 = IPDMapper.updateMySaleProductInfo(ddid);	
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//ȡ������
	public int cancelOrder(String ddid,String goodsid,String buynum) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		//ɾ�����ױ� �ҵ��� �ҵ�����������Ϣ
		int result = IPDMapper.cancelOrder(ddid);	
		int result2 = IPDMapper.cancelOrder2(ddid);	
		//����ԭ�����������
		int result3 = IPDMapper.cancelOrderAddProductNumber(goodsid,buynum);	
		if( result == 1 && result2 == 1 && result3 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//ȷ���ջ�
	public int confirmReceipt(String ddid,Integer userid,Integer myid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
	//	ApplicationContext ac2 = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IUserDao userMapper = ac2.getBean(IUserDao.class);
		int re = userMapper.saleNumAdd(userid);
		int re2 = userMapper.addBuyNum(myid);
		
		int result = IPDMapper.confirmReceipt(ddid,"t_mybuy");	
		int result2 = IPDMapper.confirmReceipt(ddid,"t_mysale");	
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//�����˿�
	public int applyRrefund(String ddid,String type,String reason) {
		
		int result = IPDMapper.applyRrefund(ddid,type,reason,"t_mybuy");		
		int result2 = IPDMapper.applyRrefund(ddid,type,reason,"t_mysale");	
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//���ݶ����Ų�ѯ������Ϣ
	public TTransaction selectDDById(String ddid) {
	//	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext.xml");
	//	IProductDao IPDMapper = ac.getBean(IProductDao.class);
		TTransaction result = IPDMapper.selectDDById(ddid);	
		return result;
	}
	//ͬ���˿�
	public int agreeRefund(String ddId,Integer myid) {
		int re = userMapper.cancelNumAdd(myid);
		int result = IPDMapper.agreeRefund(ddId,"t_mysale");	
		int result2 = IPDMapper.agreeRefund(ddId,"t_mybuy");
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//�ܾ��˿�
	public int refuseRefund(String ddId) {
		int result = IPDMapper.refuseRefund(ddId,"t_mysale");	
		int result2 = IPDMapper.refuseRefund(ddId,"t_mybuy");
		if( result == 1 && result2 == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	//�������ϼ���Ʒ����Щ����
	public List<String> selectMyProductType(Integer myid){
		List<String> result = IPDMapper.selectMyProductType( myid );	
		return result;
	}
	//����ѡ������ ������Ʒ��Ϣ
	public List<Product> selectMyByGameType1(String type ,Integer myid){
		List<Product> result = IPDMapper.selectMyByGameType1( type ,myid);	
		return result;
	}
	public List<Product> selectMyByGameType2(String type,String type2,Integer myid){
		List<Product> result = IPDMapper.selectMyByGameType2( type ,type2,myid);	
		return result;
	}
	//�ҹ����Ʒҳ�� ��ʼ��������Ʒ����
	public List<String> selectTypeByJY(Integer myid){
		List<String> result = IPDMapper.selectTypeByJY(myid);	
		return result;
	}
	//�ҹ����Ʒҳ�� ��������л�
	public List<TTransaction> mybuyByGoodsType(Integer myid,String type,String pxfs){

		List<TTransaction> result = IPDMapper.mybuyByGoodsType(myid,type,pxfs);	
		return result;
	}
}
