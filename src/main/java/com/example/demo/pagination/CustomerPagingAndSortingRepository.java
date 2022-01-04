package com.example.demo.pagination;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Customer;

@Repository
public interface CustomerPagingAndSortingRepository extends PagingAndSortingRepository<Customer, Long> {

}
