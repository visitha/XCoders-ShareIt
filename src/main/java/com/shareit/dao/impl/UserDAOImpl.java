package com.shareit.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.shareit.dao.UserDAO;
import com.shareit.model.Donator;
import com.shareit.model.ShareCase;
import com.shareit.model.User;
import com.shareit.model.UserRole;

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
	
	@Override
	public List<UserRole> getAllUserRoles() {
		String sql = "SELECT spring_role, role_name FROM user_roles WHERE role_id != 1";
		List<UserRole> userRolesList = new ArrayList<UserRole>();
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserRole role = new UserRole();
				role.setSpring_role(rs.getString("spring_role"));
				role.setRole_name(rs.getString("role_name"));
				userRolesList.add(role);
			}
			rs.close();
			ps.close();
			return userRolesList;
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
	
	@Override
	public void saveUser(User user) {
		String sql = "INSERT INTO users " +
				"(username,password,email,first_name,last_name,middle_name,phone,address,country,salutation)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFirstName());
			ps.setString(5, user.getLastName());
			ps.setString(6, user.getMiddleName());
			ps.setString(7, user.getTelephone());
			ps.setString(8, user.getAddress());
			ps.setString(9, user.getCountry());
			ps.setString(10, user.getSalutation());
			ps.executeUpdate();
			ps.close();
 
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
	
	@Override
	public void saveUserRoles(String user, String springRole) {
		String sql = "INSERT INTO user_roles_assignments " +
				"(username,role) VALUES (?, ?)";
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, springRole);
			ps.executeUpdate();
			ps.close();
 
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
