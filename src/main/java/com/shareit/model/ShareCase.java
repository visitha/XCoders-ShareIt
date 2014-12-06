package com.shareit.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ShareCase implements Serializable{

	public int caseId;
	public String caseTitle;
	public int caseTypeId;
	public String caseDiscription;
	public Timestamp expireDate;
	public int donatorId;
	public int refugeeId; 	
	
	public ShareCase() {
		// TODO Auto-generated constructor stub
	}
	
	public ShareCase(int caseId, String caseTitle, String caseDiscription, int caseTypeId, Timestamp expireDate, int refugeeId) {
		this.caseId = caseId;
		this.caseTitle = caseTitle;
		this.caseDiscription = caseDiscription;
		this.caseTypeId = caseTypeId;
		this.expireDate = expireDate;
		this.refugeeId = refugeeId;
	}

	public  int getId() {
		return caseId;
	}
	
	public void setId(int id) {
		this.caseId = id;
	}

	public String getCaseTitle() {
		return caseTitle;
	}

	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}

	public int getCaseTypeId() {
		return caseTypeId;
	}

	public void setCaseTypeId(int caseTypeId) {
		this.caseTypeId = caseTypeId;
	}

	public String getCaseDiscription() {
		return caseDiscription;
	}

	public void setCaseDiscription(String caseDiscription) {
		this.caseDiscription = caseDiscription;
	}

	public Timestamp getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Timestamp expireDate) {
		this.expireDate = expireDate;
	}

	public int getDonatorId() {
		return donatorId;
	}

	public void setDonatorId(int donatorId) {
		this.donatorId = donatorId;
	}

	public int getRefugeeId() {
		return refugeeId;
	}

	public void setRefugeeId(int refugeeId) {
		this.refugeeId = refugeeId;
	}
	
	
	
}
