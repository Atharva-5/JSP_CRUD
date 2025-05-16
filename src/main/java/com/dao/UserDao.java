package com.dao;

import java.util.*;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.User;
import com.fetchData.*;

public class UserDao {
	JdbcTemplate t1;
	
	
	public void setT1(JdbcTemplate t1) {
		this.t1 = t1;
	}
	
	public void insert(User user) {
		t1.update("insert into users(name,pass,cpass,age,gender) values('"+user.getName()+"','"+user.getPass()+"','"+user.getCpass()+"','"+user.getAge()+"','"+user.getGender()+"')");
	}
	
	public List<User> display() {
		List<User> l1 = t1.query("select * from users order by id asc", new fetchUser());
		return l1;
	}	
	
	// Delete user
	public void delete(int id) {
	    t1.update("DELETE FROM users WHERE id = ?", id);
	}
	
	// Get user by name
	public User getUserByName(String name) {
	    try {
	        String sql = "SELECT * FROM users WHERE name = ?";
	        return t1.queryForObject(sql, new Object[]{name}, new fetchUser());
	    } catch (Exception e) {
	        return null;
	    }
	}
	
	// Get user by ID
	public User getUserById(int id) {
	    String sql = "SELECT * FROM users WHERE id = ?";
	    return t1.queryForObject(sql, new Object[] {id}, new fetchUser());
	}

	
	//Get user by Array for login check
	public User checkLogin(String name, String password) {
	    try {
	        String sql = "SELECT * FROM users WHERE name = ? AND pass = ?";
	        return t1.queryForObject(sql, new Object[]{name, password}, new fetchUser());
	    } catch (Exception e) {
	        return null;
	    }
	}


	// Update user
	public void update(User u) {
	    t1.update("UPDATE users SET name = ?, pass = ?, cpass = ?, age = ?, gender = ? WHERE id = ?",
	              u.getName(), u.getPass(), u.getCpass(), u.getAge(),u.getGender(), u.getId());
	}

	//checking if user is already existed in DB or not
	public User checkUser(String name) {
	    String sql = "SELECT * FROM users WHERE name = ?";
	    try {
	        return t1.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), name);
	    } catch (EmptyResultDataAccessException e) {
	        return null; // No user found with this name
	    }
	}


}
