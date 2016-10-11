package com.magicshop.model;

/**
 * Created by Olia on 12.08.2016.
 */
public class UserOrders {

    private String goodsName;
    private int quantity;
    private int quantityGoods;

    public int getQuantityGoods() {
        return quantityGoods;
    }

    public void setQuantityGoods(int quantityGoods) {
        this.quantityGoods = quantityGoods;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserOrders)) return false;

        UserOrders that = (UserOrders) o;

        if (getQuantity() != that.getQuantity()) return false;
        if (getQuantityGoods() != that.getQuantityGoods()) return false;
        return getGoodsName().equals(that.getGoodsName());

    }

    @Override
    public int hashCode() {
        int result = getGoodsName().hashCode();
        result = 31 * result + getQuantity();
        result = 31 * result + getQuantityGoods();
        return result;
    }

    @Override
    public String toString() {
        return "UserOrders{" +
                "goodsName='" + goodsName + '\'' +
                ", quantity=" + quantity +
                ", quantityGoods=" + quantityGoods +
                '}';
    }
}
