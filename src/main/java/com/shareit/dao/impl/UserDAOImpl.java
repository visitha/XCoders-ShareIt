package com.shareit.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.shareit.dao.UserDAO;
import com.shareit.model.Donator;

public class UserDAOImpl implements UserDAO{

	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public int getUserByName(String username) {
		String sql = "SELECT user_id FROM users WHERE username = ?";
		 
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			
			Donator donator = null;
			int userId = 0;
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				userId = rs.getInt("user_id");
//				donator = new Donator(
//					rs.getString("name"), 
//					rs.getInt("age")
//				);
			}
			rs.close();
			ps.close();
			return userId;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
	}

}
