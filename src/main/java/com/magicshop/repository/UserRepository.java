package com.magicshop.repository;

import com.magicshop.dao.UserDao;
import com.magicshop.model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import javax.sql.DataSource;

import java.util.List;



@Repository
public class UserRepository implements UserDao {

    private JdbcTemplate jdbc;

    @Autowired
    public void setDataSource(DataSource jdbc) {
        this.jdbc = new JdbcTemplate(jdbc);
    }

    @Override
    public List<User> findAllUsers() {
        return jdbc.query("select * from users", (resultSet, i) -> {
            User user = new User();
            user.setUserId(resultSet.getInt("userId"));
            user.setName(resultSet.getString("name"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setEnabled(resultSet.getBoolean("enabled"));
            user.setAuthority(resultSet.getString("authority"));
            return user;
        });
    }



    @Override
    public User findById(int id) {
        try {
            return jdbc.queryForObject("SELECT * FROM users WHERE userId = ?",
                    new Object[]{id},
                    new BeanPropertyRowMapper<>(User.class));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public User findByEmail(String email) {
        try {
            return jdbc.queryForObject("SELECT * FROM users WHERE email = ?",
                    new Object[]{email},
                    new BeanPropertyRowMapper<>(User.class));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean addUser(User user) {
        System.out.printf(user + "invoke addUser from user repo");
        return jdbc.update("INSERT INTO users (name, email, password, enabled, authority) values(?, ?, ?, ?, ?)",
                user.getName(), user.getEmail(), user.getPassword(), true, "ROLE_USER") == 1;
    }

    @Override
    public boolean disableUser(String email) {
        return jdbc.update("UPDATE users SET enabled = FALSE WHERE email = ?", email) == 1;
    }

    @Override
    public boolean activateUser(String email) {
        return jdbc.update("UPDATE users SET enabled = TRUE WHERE email = ?", email) == 1;
    }

    @Override
    public boolean updateUser(User user) {
        return jdbc.update("UPDATE users SET password=? WHERE userId=?",
                user.getPassword(), user.getUserId()) == 1;
    }

    @Override
    public User findByOrder(int orderId) {
        try {
            return (User) jdbc.queryForList("SELECT a.* FROM users a INNER JOIN" +
                            " `order` ON a.userId = `order`.userId  AND orderId=?",
                    orderId, new BeanPropertyRowMapper<>(User.class));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }





}
