package com.example.demo.configuration;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.service.UserTypeService;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ProductServiceImpl;
import com.example.demo.service.impl.PublisherServiceImpl;
import com.example.demo.service.impl.UserServiceImpl;

@Component
public class InitializationLoader {
	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private UserTypeService userTypeService;

	@Autowired
	private CategoryServiceImpl categoryService;

	@Autowired
	private PublisherServiceImpl publisherService;

	@Autowired
	private ProductServiceImpl productService;

	@PostConstruct
	public void init() throws Exception {
		try {
			if (userService.getByUserName("admin") == null) {
//				permissonService.createDefaultPermissions();
				userService.createDefaultAdmin();
				userTypeService.createDefaultUserTypes();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		createDefaultManager();
		createDefaultEmployee();
		createDefaultCategory();
		createDefaultPublisher();
		createDefaultProduct();

	}

	void createDefaultManager() {
		try {
			if (userService.getAllManagers().size() <= 0) {
				userService.createDefaultManager();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultEmployee() {
		try {
			if (userService.getAllEmployees().size() <= 0) {
				userService.createDefaultEmployee();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultCategory() {
		try {
			if (categoryService.getAll().size() <= 0) {
				categoryService.createDefaultCategory();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultPublisher() {
		try {
			if (publisherService.getAll().size() <= 0) {
				publisherService.createDefaultPublisher();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultProduct() {
		try {
			if (productService.getAll().size() <= 0) {
				productService.createDefaultProduct();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
