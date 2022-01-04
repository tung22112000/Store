package com.example.demo.service;

import java.util.List;

import com.example.demo.entities.OrderDetail;

public interface OrderDetailService {

	public OrderDetail getOrderDetail(Long id);

	public List<OrderDetail> getAll();

	public OrderDetail update(OrderDetail orderDetail);

	public void delete(Long id);

	public void delete(OrderDetail orderDetail);
}
