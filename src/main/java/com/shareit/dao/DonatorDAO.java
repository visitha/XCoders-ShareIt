package com.shareit.dao;

import com.shareit.model.Donator;

public interface DonatorDAO {

	public void insert(Donator customer);
	public Donator findByCustomerId(int custId);
	
}
