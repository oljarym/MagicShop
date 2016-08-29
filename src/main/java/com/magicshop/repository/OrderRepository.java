package com.magicshop.repository;

import com.magicshop.dao.OrderDao;
import com.magicshop.model.Order;
import com.magicshop.model.UserOrders;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;



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
    public Order findById(int orderId) {
        return jdbc.queryForObject("SELECT * FROM `order` WHERE orderId = ?",
                new Object[]{orderId},
                new BeanPropertyRowMapper<>(Order.class));
    }



    @Override
   public List<UserOrders> findAllUserOrders(int userId) {
        try {
            return jdbc.query("SELECT name, count, quantity_goods FROM goods " +
                            "NATURAL JOIN  (SELECT `order`.goodsId, `order`.quantity AS quantity_goods," +
                            " COUNT(*) AS count FROM `order` WHERE `order`.userId=? " +
                            "GROUP BY goodsId ORDER BY goodsId) goods_order",
                    new Object[]{userId},(resultSet, i) -> {
                UserOrders userOrders = new UserOrders();
                userOrders.setGoodsName(resultSet.getString("name"));
                userOrders.setQuantity(resultSet.getInt("count"));
                userOrders.setQuantityGoods(resultSet.getInt("quantity_goods"));
                return userOrders;
            });
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
   }


    public boolean addOrder(Order order) {
        return jdbc.update("INSERT INTO `order` (userId, goodsId, isPaidUp, quantity) values(?, ?, ?, ?)",
                order.getUserId(), order.getGoodsId(), order.isPaidUp(), order.getQuantity()) == 1;
    }
}
