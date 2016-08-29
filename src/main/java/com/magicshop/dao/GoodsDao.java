package com.magicshop.dao;

import com.magicshop.model.Goods;
import com.magicshop.model.User;

import java.util.List;

public interface GoodsDao {

    List<Goods> findAll();

    List<Goods> findAllAvailableGoods();

    Goods findById(int goodsId);

    Goods findByName(String name);

    boolean addGoods(Goods goods);

    boolean updateGoods(Goods goods, int goodsId);

    boolean deleteGoods(Goods goods);

    List<Goods> getSaleGoodsList();
    //


}
