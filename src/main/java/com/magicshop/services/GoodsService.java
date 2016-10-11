package com.magicshop.services;

import com.magicshop.dao.GoodsDao;
import com.magicshop.model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.Collections;
import java.util.List;

@Service
public class GoodsService {

    private final GoodsDao goodsDao;

    @Autowired
    public GoodsService(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    @Transactional(readOnly = true)
    public List<Goods> findAll() {
        return this.sortByQuantity(goodsDao.findAll());
    }

    @Transactional(readOnly = true)
    public Goods findById(int goodsId) {
       return goodsDao.findById(goodsId);
    }

    @Transactional(readOnly = true)
    public Goods findByName(String name) {

        return goodsDao.findByName(name);
    }

    @Transactional
    public boolean add(Goods goods) {
        boolean result = goodsDao.addGoods(goods);
        this.rewritingSalePrices();
        return result;
    }

    @Transactional
    public boolean update(Goods goods, int goodsId) {
        boolean result = goodsDao.updateGoods(goods, goodsId);
        this.rewritingSalePrices();
        return result;
    }

    private void rewritingSalePrices() {
        List<Goods> list = goodsDao.getSaleGoodsList();
        if (list != null) {
            for (Goods goods : list) {
                goods.setSalePrice(0);
                goodsDao.updateGoods(goods, goods.getGoodsId());
            }
            List<Goods> allGoods = this.sortByQuantity(goodsDao.findAllAvailableGoods());

            list = allGoods.subList(0, 3);
            double[] rate = {0.25, 0.5, 0.65}; // sales rate array
            for (int j = 0; j < 3; j++) {
                Goods g = list.get(j);
                g.setSalePrice(Math.round(g.getPrice() * rate[j]));
                goodsDao.updateGoods(g, g.getGoodsId());
            }
        }
    }

    public List<Goods> findAllAvailableGoods() {
        List<Goods> goodsList = goodsDao.findAllAvailableGoods();
        for (Goods goods : goodsList) {
            if (goods.getSalePrice() != 0) {
                goods.setPrice(goods.getSalePrice());
            }
        }

        return goodsList;
    }



    @Transactional
    public boolean delete(Goods goods) {
        boolean result = goodsDao.deleteGoods(goods);
        this.rewritingSalePrices();
        return result;
    }

    private List<Goods> sortByQuantity(List<Goods> goods) {
        Collections.sort(goods);
        return goods;
    }




}
