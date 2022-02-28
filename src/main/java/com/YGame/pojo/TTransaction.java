package com.YGame.pojo;

import java.sql.Timestamp;

public class TTransaction {

  private Integer id;
  private Integer goodsId;
  private Integer customerId;
  private Integer sellerId;
  private String goodsName;
  private Integer goodsPrice;
  private String goodsType;
  private String gameServer;
  private Integer buynumber;
  private String goodsJieShao;
  private String goodsImage1;
  private String goodsImage2;
  private String goodsImage3;
  private String goodsImage4;
  private String goodsImage5;
  private String buyTime;
  private Integer totalPrice;
  private String customerName;
  private String sellerName;
  private String state;
  private String ddId;
  private Integer refund;
  private String reasontip;
  private String reasonbq;
  private Timestamp updatetime;
  
  
  
  public Timestamp getUpdatetime() {
	return updatetime;
}

public void setUpdatetime(Timestamp updatetime) {
	this.updatetime = updatetime;
}

public String getReasontip() {
	return reasontip;
}

public void setReasontip(String reasontip) {
	this.reasontip = reasontip;
}

public String getReasonbq() {
	return reasonbq;
}

public void setReasonbq(String reasonbq) {
	this.reasonbq = reasonbq;
}

public Integer getRefund() {
	return refund;
}

public void setRefund(Integer refund) {
	this.refund = refund;
}

public String getDdId() {
	return ddId;
}

public void setDdId(String ddId) {
	this.ddId = ddId;
}

public long getGoodsId() {
	return goodsId;
}

public void setGoodsId(Integer goodsId) {
	this.goodsId = goodsId;
}

public String getState() {
	return state;
}

public void setState(String state) {
	this.state = state;
}

public String getCustomerName() {
	return customerName;
  }

public void setCustomerName(String customerName) {
	this.customerName = customerName;
}

public String getSellerName() {
	return sellerName;
}

public void setSellerName(String sellerName) {
	this.sellerName = sellerName;
}

  public long getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public long getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer customerId) {
    this.customerId = customerId;
  }


  public long getSellerId() {
    return sellerId;
  }

  public void setSellerId(Integer sellerId) {
    this.sellerId = sellerId;
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


  public String getGoodsType() {
    return goodsType;
  }

  public void setGoodsType(String goodsType) {
    this.goodsType = goodsType;
  }


  public String getGameServer() {
    return gameServer;
  }

  public void setGameServer(String gameServer) {
    this.gameServer = gameServer;
  }


  public long getBuynumber() {
    return buynumber;
  }

  public void setBuynumber(Integer buynumber) {
    this.buynumber = buynumber;
  }


  public String getGoodsJieShao() {
    return goodsJieShao;
  }

  public void setGoodsJieShao(String goodsJieShao) {
    this.goodsJieShao = goodsJieShao;
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


  public String getBuyTime() {
    return buyTime;
  }

  public void setBuyTime(String buyTime) {
    this.buyTime = buyTime;
  }


  public Integer getTotalPrice() {
    return totalPrice;
  }

  public void setTotalPrice(Integer totalPrice) {
    this.totalPrice = totalPrice;
  }

}
