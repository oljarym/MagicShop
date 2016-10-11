package com.magicshop.model;


//import javax.validation.constraints.NotNull;

public class Goods implements Comparable<Goods>{

    private int goodsId;
    private String name;
    private String description;
    private int quantity;
    private double price;
    private double salePrice;

    public Goods() {}

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    @Override
    public int compareTo(Goods goods) {
        int compareQuantity = goods.getQuantity();
        return this.quantity - compareQuantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Goods)) return false;

        Goods goods = (Goods) o;

        if (getGoodsId() != goods.getGoodsId()) return false;
        if (getQuantity() != goods.getQuantity()) return false;
        if (Double.compare(goods.getPrice(), getPrice()) != 0) return false;
        if (Double.compare(goods.getSalePrice(), getSalePrice()) != 0) return false;
        if (!getName().equals(goods.getName())) return false;
        return getDescription().equals(goods.getDescription());

    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = getGoodsId();
        result = 31 * result + getName().hashCode();
        result = 31 * result + getDescription().hashCode();
        result = 31 * result + getQuantity();
        temp = Double.doubleToLongBits(getPrice());
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(getSalePrice());
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", salePrice=" + salePrice +
                '}';
    }
    //
}
