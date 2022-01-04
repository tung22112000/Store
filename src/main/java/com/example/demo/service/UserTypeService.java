package com.example.demo.service;

import java.util.List;

import com.example.demo.entities.UserType;

public interface UserTypeService {
	void createDefaultUserTypes() throws Exception;

	List<UserType> getAll();
}
