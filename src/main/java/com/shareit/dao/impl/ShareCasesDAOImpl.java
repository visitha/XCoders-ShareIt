package com.shareit.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.shareit.dao.ShareCasesDAO;
import com.shareit.model.Donator;
import com.shareit.model.ShareCase;
import com.shareit.model.ShareCaseType;

public class ShareCasesDAOImpl implements ShareCasesDAO {

	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public ShareCase getShareCasesByUserId(int userId) {
		String sql = "SELECT * FROM share_cases AS sc INNER JOIN users AS u ON sc.donator_id = u.user_id WHERE u.username = ?";

		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ShareCase shareCase = null;
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				shareCase = new ShareCase(rs.getInt("sharecase_id"),
						rs.getString("case_title"),
						rs.getString("case_description"),
						rs.getInt("case_type_id"),
						rs.getString("expire_date"), rs.getInt("refugee_id"));
			}
			rs.close();
			ps.close();
			return shareCase;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<ShareCase> getShareCasesByUserName(String userName) {
		List<ShareCase> shareCaseList = new ArrayList<ShareCase>();
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			Statement stmt = conn.createStatement();
		      String query ="SELECT sharecase_id, case_title, case_type_id, case_description, expire_date, refugee_id" +
				" FROM share_cases AS sc INNER JOIN users AS u ON sc.donator_id = u.user_id WHERE u.username = '"+userName+"'";
		      ResultSet rs = stmt.executeQuery(query);
		      System.out.println("Fname  Lname   ISBN");
		      while (rs.next()) {
		         String fname = rs.getString("case_title");
		         String lname = rs.getString("case_description");
		         int isbn = rs.getInt("sharecase_id");
		         System.out.println(fname + "  " + lname+"   "+isbn);
		         
		         ShareCase shareCase = new ShareCase();
					
		         shareCase.setId((rs.getInt("sharecase_id")));
		         shareCase.setCaseTitle(rs.getString("case_title"));
		         shareCase.setCaseTypeId(rs.getInt("case_type_id"));
		         shareCase.setCaseDiscription(rs.getString("case_description"));
		         shareCase.setExpireDate(rs.getString("expire_date"));
		         shareCase.setRefugeeId(rs.getInt("refugee_id"));
					
		         shareCaseList.add(shareCase);
		      }
			rs.close();
			return shareCaseList;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}
	
	@Override
	public void insertShareCase(ShareCase sharecase) {
		String sql = "INSERT INTO share_cases " +
				"(case_title, case_description, case_type_id, expire_date, created_date,donator_id) VALUES (?, ?, ?, ?, ?, ?)";
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, sharecase.getCaseTitle());
			ps.setString(2, sharecase.getCaseDiscription());
			ps.setInt(3, sharecase.getCaseTypeId());
			ps.setString(4, sharecase.getExpireDate());
			ps.setString(5, sharecase.getCreatedDate());
			ps.setInt(6, sharecase.getDonatorId());
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
	public List<ShareCaseType> getAllShareCaseTypes() {
		List<ShareCaseType> shareCaseList = new ArrayList<ShareCaseType>();
		Connection conn = null;

		try {
			conn = dataSource.getConnection();
			Statement stmt = conn.createStatement();
		      String query ="SELECT * FROM share_case_types";
		      ResultSet rs = stmt.executeQuery(query);
		      while (rs.next()) {
		    	  ShareCaseType type = new ShareCaseType();
		    	  type.setCaseTypeId(rs.getInt("case_type_id"));
		    	  type.setCaseType(rs.getString("case_type"));
					
		         shareCaseList.add(type);
		      }
			rs.close();
			return shareCaseList;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

}
