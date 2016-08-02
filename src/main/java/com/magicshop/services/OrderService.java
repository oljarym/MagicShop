package com.magicshop.services;


import com.magicshop.dao.OrderDao;
import com.magicshop.model.Goods;
import com.magicshop.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private GoodsService goodsService;


    public Order findById(int orderId) {
        return orderDao.findById(orderId);
    }

    public List<Order> findByUser(int userId) {
        return orderDao.findByUser(userId);
    }

    //public List<Order> findByGoods(int goodsId) {
    //    return orderDao.findByGoods(goodsId);
   // }

    public Boolean addOrder(Order order) {
         {
            order.setPaidUp(true);
            Goods goods = goodsService.findById(order.getGoodsId());
            int newQuantity = ((int) goods.getQuantity()) - 1;
            goods.setQuantity(newQuantity);
            goodsService.update(goods, goods.getGoodsId());
            return orderDao.addOrder(order);
        }
    }

    public Order findByUserAndGoods(int userId, int goodsId) {
        return orderDao.findByUserAndGoods(userId, goodsId);
    }

    public boolean orderPaid(int orderId) {
        return orderDao.orderPaid(orderId);
    }



}
