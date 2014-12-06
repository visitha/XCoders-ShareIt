package com.shareit.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.shareit.dao.DonatorDAO;
import com.shareit.model.Donator;

public class DonatorDAOImpl implements DonatorDAO{

	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
 
	public void insert(Donator donator){
 
		String sql = "INSERT INTO donator " +
				"(donatore_id, name, age) VALUES (?, ?, ?)";
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, donator.getDonatorId());
			ps.setString(2, donator.getName());
			ps.setInt(3, donator.getAge());
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
 
	public Donator findByCustomerId(int custId){
 
		String sql = "SELECT * FROM donator WHERE donatore_id = ?";
 
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, custId);
			Donator donator = null;
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				donator = new Donator(
					rs.getString("name"), 
					rs.getInt("age")
				);
			}
			rs.close();
			ps.close();
			return donator;
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
