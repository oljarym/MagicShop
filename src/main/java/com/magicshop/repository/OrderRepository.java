package com.magicshop.repository;

import com.magicshop.dao.OrderDao;
import com.magicshop.model.Order;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;



import javax.sql.DataSource;

import java.sql.ResultSet;
import java.util.List;




@Repository
public class OrderRepository implements OrderDao {

    private JdbcTemplate jdbc;

    @Autowired
    public void setDataSource(DataSource jdbc) {
        this.jdbc = new JdbcTemplate(jdbc);
    }

    @Override
    public List<Order> findAll() {
           return this.findOrderList("SELECT * FROM `order`");
    }

    @Override
    public Order findById(int orderId) {
        return jdbc.queryForObject("SELECT * FROM `order` WHERE orderId = ?",
                new Object[]{orderId},
                new BeanPropertyRowMapper<>(Order.class));
}

    @Override
    public List<Order> findByUser(int userId) {
        return this.findOrderList("SELECT * FROM `order` WHERE userId = ?");
    }

   /*
   @Override
   public List<Order> findByGoods(int goodsId) {
   return findOrderList("SELECT * FROM `order` WHERE goodsId = ?");
   }
   */

    @Override
    public Order findByUserAndGoods(int userId, int goodsId) {
        return jdbc.queryForObject("SELECT * FROM `order` WHERE userId=? AND goodsId=?",
                new Object[]{userId, goodsId}, new BeanPropertyRowMapper<>(Order.class));
    }

    @Override
    public boolean orderPaid(int orderId) {
        return jdbc.queryForObject("SELECT isPaidUp FROM `order` WHERE orderId=?",
                Order.class).isPaidUp();
    }


    public List<Order> findOrderList(String query) {
        return jdbc.query(query, (resultSet, i) -> {
            Order order = new Order();
            order.setOrderId(resultSet.getInt("orderId"));
            order.setUserId(resultSet.getInt("userId"));
            order.setGoodsId(resultSet.getInt("goodsId"));
            order.setPaidUp(resultSet.getBoolean("isPaidUp"));
            return order;
        });
    }

    public boolean addOrder(Order order) {


        return jdbc.update("INSERT INTO `order` (userId, goodsId, isPaidUp) values(?, ?, ?)",
                order.getUserId(), order.getGoodsId(), order.isPaidUp()) == 1;
    }



}
