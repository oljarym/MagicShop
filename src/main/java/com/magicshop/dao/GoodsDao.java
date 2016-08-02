package com.magicshop.dao;

import com.magicshop.model.Goods;
import com.magicshop.model.User;

import java.util.List;

public interface GoodsDao {

    List<Goods> findAll();

    Goods findById(int goodsId);

    Goods findByName(String name);

    Goods findByPrice(double prise);

    boolean addGoods(Goods goods);

    boolean updateGoods(Goods goods, int goodsId);

    boolean deleteGoods(Goods goods);


}
