package com.cha102.diyla.commodityOrderDetail;

public class CommodityOrderDetailVO {
    // 複合主鍵
    private Integer orderNo;
    private Integer comNo;

    private Integer comQuantity;
    private Integer comPrice;

    // 建構子
    public CommodityOrderDetailVO(Integer orderNo, Integer comNo, Integer comQuantity, Integer comPrice) {
        this.orderNo = orderNo;
        this.comNo = comNo;
        this.comQuantity = comQuantity;
        this.comPrice = comPrice;
    }

    // Getter 和 Setter
    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getComNo() {
        return comNo;
    }

    public void setComNo(Integer comNo) {
        this.comNo = comNo;
    }

    public Integer getComQuantity() {
        return comQuantity;
    }

    public void setComQuantity(Integer comQuantity) {
        this.comQuantity = comQuantity;
    }

    public Integer getComPrice() {
        return comPrice;
    }

    public void setComPrice(Integer comPrice) {
        this.comPrice = comPrice;
    }

    @Override
    public String toString() {
        return "CommodityOrderDetailVO{" +
                "orderNo=" + orderNo +
                ", comNo=" + comNo +
                ", comQuantity=" + comQuantity +
                ", comPrice=" + comPrice +
                '}';
    }
}

