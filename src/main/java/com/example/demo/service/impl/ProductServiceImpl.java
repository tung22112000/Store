package com.example.demo.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Product;
import com.example.demo.pagination.ProductPagingAndSortingRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductPagingAndSortingRepository productPagingAndSortingRepository;

	public Product getProduct(Long id) {
		Product product = productRepository.getOne(id);
		return product;
	}

	public List<Product> getAll() {
		return this.productRepository.findAll();

	}

	public String add(Product product) {
		String errorMessage = "";
		if (product.getProductName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên sản phẩm!";

			return errorMessage;
		}
		if (product.getDiscount() == null) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá!";

			return errorMessage;
		}
		if (product.getDiscount() < 0) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá không được âm!";

			return errorMessage;
		}
		if (product.getOldPrice() == null) {
			errorMessage = "Vui lòng nhập giá cũ!";

			return errorMessage;
		}
		if (product.getOldPrice() < 0) {
			errorMessage = "Giá cũ không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getProductNumber() == null) {
			errorMessage = "Vui lòng nhập số lượng!";

			return errorMessage;
		}
		if (product.getProductNumber() < 0) {
			errorMessage = "Vui lòng nhập số lượng không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getYearManufactured() == null) {
			errorMessage = "Vui lòng nhập năm sản xuất!";

			return errorMessage;
		}

		if (product.getProductImages() == null || product.getProductImages().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (product.getDescription().isEmpty()) {
			errorMessage = "Vui lòng nhập mô tả!";

			return errorMessage;
		}
		if (product.getCategories().isEmpty()) {
			errorMessage = "Vui lòng chọn danh mục!";

			return errorMessage;
		}

		product.setCreated(new Date());
		this.productRepository.save(product);

		return null;
	}

	public String update(Product product) {
		String errorMessage = "";
		if (product.getProductName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên sản phẩm!";

			return errorMessage;
		}
		if (product.getDiscount() == null) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá!";

			return errorMessage;
		}
		if (product.getDiscount() < 0) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá không được âm!";

			return errorMessage;
		}
		if (product.getOldPrice() == null) {
			errorMessage = "Vui lòng nhập giá cũ!";

			return errorMessage;
		}
		if (product.getOldPrice() < 0) {
			errorMessage = "Giá cũ không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getProductNumber() == null) {
			errorMessage = "Vui lòng nhập số lượng!";

			return errorMessage;
		}
		if (product.getProductNumber() < 0) {
			errorMessage = "Vui lòng nhập số lượng không được nhỏ hơn 0!";

			return errorMessage;
		}

		if (product.getProductImages() == null || product.getProductImages().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (product.getDescription().isEmpty()) {
			errorMessage = "Vui lòng nhập mô tả!";

			return errorMessage;
		}
		if (product.getYearManufactured() == null) {
			errorMessage = "Vui lòng nhập năm sản xuất!";

			return errorMessage;
		}

		if (product.getCategories().isEmpty()) {
			errorMessage = "Vui lòng chọn danh mục!";

			return errorMessage;
		}

		product.setCreated(new Date());
		this.productRepository.save(product);

		return null;
	}

	public void delete(Product product) {
		productRepository.delete(product);
	}

	public void delete(Long id) {
		Product product = productRepository.getOne(id);
		productRepository.delete(product);
	}

	public List<Product> getFindProduct(String productName) {
		return productRepository.getFindProduct(productName);
	}

	public List<Product> getAllByProduct(Pageable pageable) {
		return productRepository.getAllByProduct(pageable);
	}

	@Override
	public List<Product> getAllProductByCategory(Long id) {
		return productRepository.findByCategory(id);
	}

	public void createDefaultProduct() throws Exception {
		Product product = new Product();
		product.setProductName("iPhone 12 Pro Max 128GB");
		product.setOldPrice(32999000);
		product.setDiscount((double) 20);
		product.setCreated(new Date());
		product.setProductNumber(30);
		product.setYearManufactured(2020);
		product.setDescription(
				"Trùm cuối” của dòng iPhone 12 đã xuất hiện. iPhone 12 Pro Max là chiếc iPhone có màn hình lớn nhất từ trước đến nay, mang trên mình bộ vi xử lý mạnh nhất, camera đẳng cấp pro cùng kết nối 5G siêu tốc, cho bạn những trải nghiệm tuyệt vời chưa từng có.");
		product.setProductImages("ip12promax.jpg");
		productRepository.save(product);

		Product product1 = new Product();
		product1.setProductName("Samsung Galaxy Z Fold 3");
		product1.setOldPrice(41990000);
		product1.setDiscount((double) 15);
		product1.setCreated(new Date());
		product1.setProductNumber(20);
		product1.setYearManufactured(2021);
		product1.setDescription(" Samsung Galaxy Z thế hệ mới được chế tác từ những chất liệu hàng đầu, đó là hợp kim\n"
				+ "                                    nhôm Armor Aluminum cứng cáp nhất thế giới smartphone và kính cường lực Gorilla\n"
				+ "                                    Glass Victus.");
		product1.setProductImages("ssgz.png");

		productRepository.save(product1);

		Product product2 = new Product();
		product2.setProductName("OPPO Find X3 Pro");
		product2.setOldPrice(26990000);
		product2.setDiscount((double) 25);
		product2.setCreated(new Date());
		product2.setProductNumber(25);
		product2.setYearManufactured(2021);
		product2.setDescription(
				"Sẵn sàng cùng bạn hướng tới tương lai với OPPO Find X3 Pro 5G, chiếc điện thoại sở hữu camera màu sắc trung thực, màn hình 120Hz siêu mượt, 1 tỷ màu sống động và hiệu năng đột phá với sức mạnh của con chip Qualcomm Snapdragon 888 hỗ trợ 5G.");
		product2.setProductImages("opporeno.jpg");
		productRepository.save(product2);
	}

	@Override
	public Page<Product> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAll(paging);
	}

	@Override
	public Page<Product> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy, Long filter) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAllWithFilter(filter, paging);
	}

	public Page<Product> getAllWithPaginationPublisher(Integer pageNo, Integer pageSize, String sortBy, Long filter) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAllWithFilterPublisher(filter, paging);
	}

}
