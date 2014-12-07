package com.shareit.dao;

import java.util.List;

import com.shareit.model.ShareCase;
import com.shareit.model.ShareCaseType;

public interface ShareCasesDAO {

	ShareCase getShareCasesByUserId(int userId);
	
	List<ShareCase> getShareCasesByUserName(String userName);
	
	void insertShareCase(ShareCase sharecase);
	
	List<ShareCaseType> getAllShareCaseTypes();
	
	List<ShareCase> getShareCasesByCaseType(int userName);
}
