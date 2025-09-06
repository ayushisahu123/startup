package com.example.youwantt.Dao;

import com.example.youwantt.Bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<User> getAllUsers() {
        String sql = "SELECT id, username, email FROM user";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            User user = new User();
            System.out.println("username"+rs.getString("username"));
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            return user;
        });
    }

    public int saveUser(User user) {
        user.setRole("Customer");
        user.setName(user.getUsername());
        String sql = "INSERT INTO user (username,name, email, password,role) VALUES (?,?, ?, ?,?)";
        return jdbcTemplate.update(sql, user.getUsername(),user.getName(), user.getEmail(), user.getPassword(),user.getRole());
    }

}
