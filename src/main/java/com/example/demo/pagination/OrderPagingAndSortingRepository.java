package com.example.demo.pagination;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Order;

@Repository
public interface OrderPagingAndSortingRepository extends PagingAndSortingRepository<Order, Long> {

}
