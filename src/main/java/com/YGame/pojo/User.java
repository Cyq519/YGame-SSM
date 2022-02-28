package com.YGame.pojo;

import java.io.Serializable;

public class User implements Serializable{
	private Integer id;
    private String userName;
    private String password;
    private String image;
    private String usertype;
    private String nicheng;
    private String gexingqianming;
    private String sex;
    private String iphonenumber;
    private String email;
    private Integer saleNum;
    private Integer cansleNum;
    private Integer buyNum;
    
    
    public Integer getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	public Integer getCansleNum() {
		return cansleNum;
	}
	public void setCansleNum(Integer cansleNum) {
		this.cansleNum = cansleNum;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getNicheng() {
		return nicheng;
	}
	public void setNicheng(String nicheng) {
		this.nicheng = nicheng;
	}
	public String getGexingqianming() {
		return gexingqianming;
	}
	public void setGexingqianming(String gexingqianming) {
		this.gexingqianming = gexingqianming;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIphonenumber() {
		return iphonenumber;
	}
	public void setIphonenumber(String iphonenumber) {
		this.iphonenumber = iphonenumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
    
    
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
   
}

