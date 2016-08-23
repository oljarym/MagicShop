package com.magicshop.services;

import com.magicshop.dao.GoodsDao;
import com.magicshop.model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    public Goods findById(int goodsId) {
       return goodsDao.findById(goodsId);
    }

    public Goods findByName(String name) {
        return goodsDao.findByName(name);
    }


    public boolean add(Goods goods) {
        return goodsDao.addGoods(goods);
    }

    public boolean update(Goods goods, int goodsId) {
        if (goods.getQuantity() < 0) {
            return false;
        }
        return goodsDao.updateGoods(goods, goodsId);
    }

    public boolean delete(Goods goods) {
        return goodsDao.deleteGoods(goods);
    }

}
