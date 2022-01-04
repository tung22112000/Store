package com.example.demo.pagination;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Category;

@Repository
public interface CategoryPagingAndSortingRepository extends PagingAndSortingRepository<Category, Long>{

}
