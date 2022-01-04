package com.example.demo.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
	String uploadFile(String uploadRootPath, MultipartFile file);
}
