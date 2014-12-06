package com.shareit.dao;

import java.util.List;

import com.shareit.model.ShareCase;

public interface ShareCasesDAO {

	ShareCase getShareCasesByUserId(int userId);
	
	List<ShareCase> getShareCasesByUserName(String userName);
	
	void insertShareCase(ShareCase sharecase);
}
