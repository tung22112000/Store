package com.example.demo.pagination;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.entities.Publisher;

public interface PublisherPagingAndSortingRepository extends PagingAndSortingRepository<Publisher, Long> {

}
