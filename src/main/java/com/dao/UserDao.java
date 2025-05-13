package com.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.model.User;
import com.fetchData.*;

public class UserDao {
	JdbcTemplate t1;
	
	public void setT1(JdbcTemplate t1) {
		this.t1 = t1;
	}
	
	public void insert(User user) {
		t1.update("insert into users(name,pass,cpass,age) values('"+user.getName()+"','"+user.getPass()+"','"+user.getCpass()+"','"+user.getAge()+"')");
	}
	
	public List<User> display() {
		List<User> l1 = t1.query("select * from users order by id asc", new fetchUser());
		return l1;
	}
	
	// Delete user
	public void delete(int id) {
	    t1.update("DELETE FROM users WHERE id = ?", id);
	}

	// Get user by ID
	public User getUserById(int id) {
	    String sql = "SELECT * FROM users WHERE id = ?";
	    return t1.queryForObject(sql, new Object[] {id}, new fetchUser());
	}

	// Update user
	public void update(User u) {
	    t1.update("UPDATE users SET name = ?, pass = ?, cpass = ?, age = ? WHERE id = ?",
	              u.getName(), u.getPass(), u.getCpass(), u.getAge(), u.getId());
	}

}
