package com.example.youwantt.Dao;

import com.example.youwantt.Bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
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

    public User validateUser(String email, String password) {
        String sql = "SELECT id, username, email FROM user WHERE email = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{email, password}, (rs, rowNum) -> {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                return u;
            });
        } catch (Exception e) {
            return null; // agar user not found
        }
    }





    public User findByUsername(String username) {
        String sql = "SELECT * FROM user WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username}, (ResultSet rs, int rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setRole(rs.getString("role"));
            u.setName(rs.getString("name"));
            u.setUsername(rs.getString("username"));
            u.setPassword(rs.getString("password"));
            return u;
        });
    }

    public int saveVendor(User user) {
            String sql = "INSERT INTO user (username,name, email, password,role,mobile_number) VALUES (?,?, ?, ?,?,?)";
        return jdbcTemplate.update(sql, user.getUsername(),user.getName(), user.getEmail(), user.getPassword(),user.getRole(),user.getMobileNumber());
    }
}
