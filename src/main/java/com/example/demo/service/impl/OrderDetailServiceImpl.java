package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.OrderDetail;
import com.example.demo.repository.OrderDetailRepository;
import com.example.demo.service.OrderDetailService;

@Transactional
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	public OrderDetail getOrderDetail(Long id) {
		return this.orderDetailRepository.getOne(id);
	}

	public List<OrderDetail> getAll() {
		return this.orderDetailRepository.findAll();
	}

	public OrderDetail update(OrderDetail orderDetail) {
		return this.orderDetailRepository.save(orderDetail);

	}

	public void delete(Long id) {
		OrderDetail orderDetail = this.orderDetailRepository.getOne(id);
		orderDetailRepository.delete(orderDetail);
	}

	public void delete(OrderDetail orderDetail) {
		this.orderDetailRepository.delete(orderDetail);
	}

}
