package com.YGame.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class Product {
	
	private int id;
	private String goodsName;
	private Integer goodsPrice;
	private String goodsJieShao;
	private String goodsNumber;
	private String gameType1;
	private String gameType2;
	private String goodsImage1;
	private String goodsImage2;
	private String goodsImage3;
	private String goodsImage4;
	private String goodsImage5;
	private Timestamp goodsTime;
	private int userID;
	private int goodszt;
	
	private String gamept;
	private String gamedq;
	private String gamefwq;
	private String userName;
	private Integer Unpaid;
	
	
	
	
	public Integer getUnpaid() {
		return Unpaid;
	}

	public void setUnpaid(Integer unpaid) {
		Unpaid = unpaid;
	}

	public Product() {
		goodsImage1 = null;
		goodsImage2 = null;
		goodsImage3 = null;
		goodsImage4 = null;
		goodsImage5 = null;
		gamept = null;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGamept() {
		return gamept;
	}


	public void setGamept(String gamept) {
		this.gamept = gamept;
	}


	public String getGamedq() {
		return gamedq;
	}


	public void setGamedq(String gamedq) {
		this.gamedq = gamedq;
	}


	public String getGamefwq() {
		return gamefwq;
	}


	public void setGamefwq(String gamefwq) {
		this.gamefwq = gamefwq;
	}


	
	
	
	public int getGoodszt() {
		return goodszt;
	}


	public void setGoodszt(int goodszt) {
		this.goodszt = goodszt;
	}


	public Timestamp getGoodsTime() {
		return goodsTime;
	}

	public void setGoodsTime(Timestamp goodsTime) {
		this.goodsTime = goodsTime;
	}

	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Integer goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsJieShao() {
		return goodsJieShao;
	}
	public void setGoodsJieShao(String goodsJieShao) {
		this.goodsJieShao = goodsJieShao;
	}
	public String getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(String gameNumber) {
		this.goodsNumber = gameNumber;
	}
	public String getGameType1() {
		return gameType1;
	}
	public void setGameType1(String gameType1) {
		this.gameType1 = gameType1;
	}
	public String getGameType2() {
		return gameType2;
	}
	public void setGameType2(String gameType2) {
		this.gameType2 = gameType2;
	}
	public String getGoodsImage1() {
		return goodsImage1;
	}
	public void setGoodsImage1(String goodsImage1) {
		this.goodsImage1 = goodsImage1;
	}
	public String getGoodsImage2() {
		return goodsImage2;
	}
	public void setGoodsImage2(String goodsImage2) {
		this.goodsImage2 = goodsImage2;
	}
	public String getGoodsImage3() {
		return goodsImage3;
	}
	public void setGoodsImage3(String goodsImage3) {
		this.goodsImage3 = goodsImage3;
	}
	public String getGoodsImage4() {
		return goodsImage4;
	}
	public void setGoodsImage4(String goodsImage4) {
		this.goodsImage4 = goodsImage4;
	}
	public String getGoodsImage5() {
		return goodsImage5;
	}
	public void setGoodsImage5(String goodsImage5) {
		this.goodsImage5 = goodsImage5;
	}
	
}
