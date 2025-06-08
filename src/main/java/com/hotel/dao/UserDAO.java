package com.hotel.dao;

import com.hotel.model.User;
import org.springframework.jdbc.core.JdbcTemplate;



public class UserDAO {

    private JdbcTemplate jdbcTemplate;

  
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    
    public boolean validateUser(String username, String password) {
        String query = "SELECT COUNT(*) FROM users WHERE username = ? AND password = ?";
        int count = jdbcTemplate.queryForObject(query, Integer.class, username, password);
        return count > 0;
    }

    public String getRoleByUsername(String username) {
        String sql = "SELECT role FROM users WHERE username = ?";
        try {
            return jdbcTemplate.queryForObject(sql, String.class, username);
        } catch (Exception e) {
            return null;
        }
    }

   
    public boolean saveUser(User user) {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
        int rows = jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getRole());
        return rows > 0;
    }

   
    public boolean userExists(String username) {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return count > 0;
    }
}
