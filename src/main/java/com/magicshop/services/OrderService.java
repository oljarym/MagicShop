package com.magicshop.services;


import com.magicshop.dao.OrderDao;
import com.magicshop.model.Goods;
import com.magicshop.model.Order;
import com.magicshop.model.UserOrders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class OrderService {

    private final OrderDao orderDao;
    private final GoodsService goodsService;

    @Autowired
    public OrderService(GoodsService goodsService, OrderDao orderDao) {
        this.goodsService = goodsService;
        this.orderDao = orderDao;
    }

    @Transactional(readOnly = true)
    public Order findById(int orderId) {
        return orderDao.findById(orderId);
    }

    public Boolean addOrder(Order order) {
        order.setPaidUp(true);
        Goods goods = goodsService.findById(order.getGoodsId());
        int newQuantity = (goods.getQuantity()) - order.getQuantity();
        goods.setQuantity(newQuantity);
        goodsService.update(goods, goods.getGoodsId());
        return orderDao.addOrder(order);
    }

    @Transactional(readOnly = true)
    public List<UserOrders> findAllUserOrders(int userId) {
        return orderDao.findAllUserOrders(userId);
    }

}
