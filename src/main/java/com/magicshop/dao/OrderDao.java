package com.magicshop.dao;


import com.magicshop.model.Order;
import com.magicshop.model.User;
import com.magicshop.model.UserOrders;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.List;

public interface OrderDao {

    Order findById(int orderId);
    boolean addOrder(Order order);
    List<UserOrders> findAllUserOrders(int userId);
    //
}
