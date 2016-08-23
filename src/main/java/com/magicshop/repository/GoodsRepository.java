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
    public List<Goods> findAll() {
        return jdbc.query("select * from goods", (resultSet, i) -> {
            Goods goods = new Goods();
            goods.setGoodsId(resultSet.getInt("goodsId"));
            goods.setName(resultSet.getString("name"));
            goods.setDescription(resultSet.getString("description"));
            goods.setQuantity(resultSet.getInt("quantity"));
            goods.setPrice(resultSet.getDouble("price"));
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
    public Goods findByPrice(double price) {
        //TODO GHVHJVGJKJNHBB
        return null; // перевизначити коли все запрацює
    }

    @Override
    public boolean addGoods(Goods goods) {
        return jdbc.update("INSERT INTO goods (name, description, quantity, price)" +
                        " VALUES (?, ?, ?, ?)",
                goods.getName(), goods.getDescription(),
                goods.getQuantity(), goods.getPrice())==1;
    }

    @Override
    public boolean updateGoods(Goods goods, int goodsId) {
        return jdbc.update("UPDATE goods SET name = ?, description = ?, quantity = ?, price = ?" +
                        " WHERE goodsId = ?",
                goods.getName(), goods.getDescription(),
                goods.getQuantity(), goods.getPrice(), goodsId)==1;
    }

    @Override
    public boolean deleteGoods(Goods goods) {
        System.out.printf("invoke delete goods");
        return jdbc.update("delete from goods where goodsId = ?",goods.getGoodsId()) == 1;
    }





}

