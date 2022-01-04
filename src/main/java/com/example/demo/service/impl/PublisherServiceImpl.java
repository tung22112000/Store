package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Publisher;
import com.example.demo.pagination.PublisherPagingAndSortingRepository;
import com.example.demo.repository.PublisherRepository;
import com.example.demo.service.PublisherService;

@Transactional
@Service
public class PublisherServiceImpl implements PublisherService {
	@Autowired
	private PublisherRepository publisherRepository;

	@Autowired
	private PublisherPagingAndSortingRepository publisherPagingAndSortingRepository;

	public Publisher getPublisher(Long id) {
		Publisher publisher = this.publisherRepository.getOne(id);
		return publisher;
	}

	public List<Publisher> getAll() {

		return this.publisherRepository.findAll();
	}

	public String add(Publisher publisher) {
		String errorMessage = "";
		if (publisher.getPublisherName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên nhà xuất bản!";

			return errorMessage;
		}
		if (publisher.getPhoneNumber().isEmpty()) {
			errorMessage = "Vui lòng nhập số điện thoại!";

			return errorMessage;
		}
		if (publisher.getStreet().isEmpty()) {
			errorMessage = "Vui lòng nhập đường!";

			return errorMessage;
		}
		if (publisher.getDistrict().isEmpty()) {
			errorMessage = "Vui lòng nhập quận/huyện!";

			return errorMessage;
		}
		if (publisher.getCity().isEmpty()) {
			errorMessage = "Vui lòng nhập tỉnh/thành phố!";

			return errorMessage;
		}

		if (publisher.getLogo() == null || publisher.getLogo().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (publisher.getEmail().isEmpty()) {
			errorMessage = "Vui lòng nhập email!";

			return errorMessage;
		}
		this.publisherRepository.save(publisher);

		return null;
	}

	public String update(Publisher publisher) {
		String errorMessage = "";
		if (publisher.getPublisherName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên nhà xuất bản!";

			return errorMessage;
		}
		if (publisher.getPhoneNumber().isEmpty()) {
			errorMessage = "Vui lòng nhập số điện thoại!";

			return errorMessage;
		}

		if (publisher.getStreet().isEmpty()) {
			errorMessage = "Vui lòng nhập đường!";

			return errorMessage;
		}
		if (publisher.getDistrict().isEmpty()) {
			errorMessage = "Vui lòng nhập quận/huyện!";

			return errorMessage;
		}
		if (publisher.getCity().isEmpty()) {
			errorMessage = "Vui lòng nhập tỉnh/thành phố!";

			return errorMessage;
		}

		if (publisher.getLogo() == null || publisher.getLogo().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (publisher.getEmail().isEmpty()) {
			errorMessage = "Vui lòng nhập email!";

			return errorMessage;
		}
//		if (publisher.getEmail()!="^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$") {
//			errorMessage = "Email không đúng chuẩn";
//
//			return errorMessage;
//		}
		this.publisherRepository.save(publisher);

		return null;
	}

	public void delete(Publisher publisher) {
		publisherRepository.delete(publisher);
	}

	public void delete(Long id) {
		Publisher publisher = this.publisherRepository.getOne(id);
		publisherRepository.delete(publisher);

	}

	@Override
	public List<Publisher> getFindPublisher(String publisherName) {
		return publisherRepository.getFindPublisher(publisherName);
	}

	@Override
	public Page<Publisher> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.publisherPagingAndSortingRepository.findAll(paging);
	}

	public void createDefaultPublisher() throws Exception {
		Publisher publisher = new Publisher();
		publisher.setPublisherName("Samsung");
		publisher.setLogo("samsung.jpg");
		publisher.setPhoneNumber("02839157310");
		publisher.setEmail("samsunginfo@gmail.com");
		publisher.setStreet("Số 2, đường Hải Triều,");
		publisher.setDistrict("Quận 1");
		publisher.setCity("Tp.HCM");
		publisherRepository.save(publisher);

		Publisher publisher1 = new Publisher();
		publisher1.setPublisherName("Apple");
		publisher1.setLogo("apple.png");
		publisher1.setPhoneNumber("0945383123");
		publisher1.setEmail("appleinfo@gmail.com");
		publisher1.setStreet("137a1 Nguyễn Thị Minh Khai");
		publisher1.setDistrict("Quận 1");
		publisher1.setCity("Tp.HCM");
		publisherRepository.save(publisher1);

		Publisher publisher2 = new Publisher();
		publisher2.setPublisherName("Oppo");
		publisher2.setLogo("oppo.jpg");
		publisher2.setPhoneNumber("0933534224");
		publisher2.setEmail("oppoinfo@gmail.com");
		publisher2.setStreet("20 Nguyễn Bính");
		publisher2.setDistrict("Quận 1");
		publisher2.setCity("Tp.HCM");
		publisherRepository.save(publisher2);

	}

}
