package com.shareit.model;

import java.sql.Timestamp;

public class Donator 
{
	int donatorId;
	String name;
	int age;
	//getter and setter methods
	
	public Donator( String name, int age) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.age = age;
	}

	public void setDonatorId(int donatorId) {
		this.donatorId = donatorId;
	}
	
	public int getDonatorId() {
		return donatorId;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
 
}