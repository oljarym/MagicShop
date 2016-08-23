package com.magicshop.dao;


import com.magicshop.model.Order;
import com.magicshop.model.User;
import com.magicshop.model.UserOrders;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.List;

public interface OrderDao {

    Order findById(int orderId);
    List<Order> findByUser(int userId);
    List<Order> findAll();
    Order findByUserAndGoods(int userId, int goodsId);
    boolean orderPaid(int orderId);
    boolean addOrder(Order order);
    public List<UserOrders> findAllUserOrders(int userId);



    //   List<Order> findByGoods(int goodsId);
}
