package com.fetchData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.model.User;

public class fetchUser implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setId(rs.getInt(1));
		u.setName(rs.getString(2));
		u.setPass(rs.getString(3));
		u.setCpass(rs.getString(4));
		u.setAge(rs.getInt(5));
	
		return u;
	}
	
}
