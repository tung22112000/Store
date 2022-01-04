package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.demo.entities.User;

public interface UserService {
	public User getByUserName(String username);

	public User getUser(Long id);

	public List<User> getAll();

	public List<User> getAllManagers();

	public List<User> getAllEmployees();

	public String add(User user);

	public String update(User user);

	public void delete(User user);

	public void delete(Long id);

	public void createDefaultAdmin() throws Exception;

	public void createDefaultManager() throws Exception;

	public void createDefaultEmployee() throws Exception;

	boolean changePassword(String username, String oldpass, String newpass);

	public String changePassword1(String username, String newPassword, String retypePassword);

	public Page<User> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy);

	public String checkUserInfo(String username, String phone, String email);

	public String checkUserInfo(String username);

	public List<User> searchByUserName(String username);

	public List<User> findByUserName(String username);

	public List<User> searchUserByUserNameAndPhoneNumber(String fullNameandPhonenumber);
}
