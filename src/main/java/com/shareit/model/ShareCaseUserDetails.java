package com.shareit.model;

public class ShareCaseUserDetails {
	private String userFirstName;
	private String userMail;
	private String userAddress;
	private String caseTitle;
	private String caseDescription;
	private int shareCaseId;
	public String expireDate;
	private String userLastName;
	private String phone;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserLasttName() {
		return userLastName;
	}
	public void setUserLasttName(String userLasttName) {
		this.userLastName = userLasttName;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public int getShareCaseId() {
		return shareCaseId;
	}
	public void setShareCaseId(int shareCaseId) {
		this.shareCaseId = shareCaseId;
	}
	
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userName) {
		this.userFirstName = userName;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getCaseTitle() {
		return caseTitle;
	}
	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}
	public String getCaseDescription() {
		return caseDescription;
	}
	public void setCaseDescription(String caseDescription) {
		this.caseDescription = caseDescription;
	}

	
}
