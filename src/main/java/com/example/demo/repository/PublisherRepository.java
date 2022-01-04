package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Publisher;

@Repository
public interface PublisherRepository extends JpaRepository<Publisher, Long> {
	@Query("select nsx from Publisher nsx where nsx.publisherName like %:publisherName%")
	List<Publisher> getFindPublisher(@Param("publisherName") String publisherName);

	@Query("select distinct p from Publisher as p where p.publisherName = :publisherName")
	Publisher findByPublisherName(@Param("publisherName") String publisherName);
}
