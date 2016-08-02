package com.magicshop.model;


public class Order {

    private int orderId;
    private int userId;
    private int goodsId;
    private boolean isPaidUp;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public boolean isPaidUp() {
        return isPaidUp;
    }

    public void setPaidUp(boolean paidUp) {
        isPaidUp = paidUp;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;

        Order order = (Order) o;

        if (getOrderId() != order.getOrderId()) return false;
        if (getUserId() != order.getUserId()) return false;
        if (getGoodsId() != order.getGoodsId()) return false;
        return isPaidUp() == order.isPaidUp();

    }

    @Override
    public int hashCode() {
        int result = getOrderId();
        result = 31 * result + getUserId();
        result = 31 * result + getGoodsId();
        result = 31 * result + (isPaidUp() ? 1 : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", isPaidUp=" + isPaidUp +
                '}';
    }
}
