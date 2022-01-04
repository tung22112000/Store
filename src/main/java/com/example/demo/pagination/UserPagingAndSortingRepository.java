package com.example.demo.pagination;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.User;

@Repository
public interface UserPagingAndSortingRepository extends PagingAndSortingRepository<User, Long> {

}
