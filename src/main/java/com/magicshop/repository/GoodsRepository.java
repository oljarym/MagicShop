package com.magicshop.repository;

import com.magicshop.dao.GoodsDao;
import com.magicshop.model.Goods;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;


import javax.sql.DataSource;

import java.util.List;




@Repository
public class GoodsRepository implements GoodsDao {

    private JdbcTemplate jdbc;

    @Autowired
    public void setDataSource(DataSource jdbc) {
        this.jdbc = new JdbcTemplate(jdbc);
    }


    @Override
    public List<Goods> getSaleGoodsList() {
        return this.findGoodsList("SELECT * FROM goods WHERE quantity > 0 AND salePrice != 0 ORDER BY quantity");
    }

    @Override
    public List<Goods> findAllAvailableGoods() {
        return this.findGoodsList("SELECT * FROM goods WHERE quantity > 0 ORDER BY quantity");
    }

    @Override
    public List<Goods> findAll() {
        return this.findGoodsList("select * from goods");
    }


    private List<Goods> findGoodsList(String sql) {
        return jdbc.query(sql, (resultSet, i) -> {
            Goods goods = new Goods();
            goods.setGoodsId(resultSet.getInt("goodsId"));
            goods.setName(resultSet.getString("name"));
            goods.setDescription(resultSet.getString("description"));
            goods.setQuantity(resultSet.getInt("quantity"));
            goods.setPrice(resultSet.getDouble("price"));
            goods.setSalePrice(resultSet.getDouble("salePrice"));
            return goods;
        });
    }

    @Override
    public Goods findById(int goodsId) {
        try {
            return jdbc.queryForObject("SELECT * FROM goods WHERE goodsId = ?",
                    new Object[]{goodsId},
                    new BeanPropertyRowMapper<>(Goods.class));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public Goods findByName(String name) {
        try {
            return jdbc.queryForObject("SELECT * FROM goods WHERE name= ?",
                    new Object[]{name},
                    new  BeanPropertyRowMapper<> (Goods.class));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public boolean addGoods(Goods goods) {
        return jdbc.update("INSERT INTO goods (name, description, quantity, price, salePrice)" +
                        " VALUES (?, ?, ?, ?, ?)",
                goods.getName(), goods.getDescription(),
                goods.getQuantity(), goods.getPrice(), goods.getSalePrice())==1;
    }

    @Override
    public boolean updateGoods(Goods goods, int goodsId) {
        return jdbc.update("UPDATE goods SET name = ?, description = ?, quantity = ?, price = ?, " +
                         "salePrice = ?  WHERE goodsId = ?",
                goods.getName(), goods.getDescription(),
                goods.getQuantity(), goods.getPrice(), goods.getSalePrice(), goodsId)==1;
    }

    @Override
    public boolean deleteGoods(Goods goods) {
        return jdbc.update("delete from goods where goodsId = ?",goods.getGoodsId()) == 1;
    }

}
//
