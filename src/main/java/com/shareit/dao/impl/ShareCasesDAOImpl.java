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
						rs.getTimestamp("expire_date"), rs.getInt("refugee_id"));
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
		String sql = "SELECT sharecase_id, case_title, case_type_id, case_description, expire_date, refugee_id" +
				" FROM share_cases AS sc INNER JOIN users AS u ON sc.donator_id = u.user_id WHERE u.username = ?";
//		String sql = "SELECT * FROM share_cases AS sc WHERE u.donator_id = 7";
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
		         shareCase.setExpireDate(rs.getTimestamp("expire_date"));
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

}
