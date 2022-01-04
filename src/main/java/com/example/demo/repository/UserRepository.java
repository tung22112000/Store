package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	@Query("select distinct u from User as u where u.username = :username")
	User findByUserName(@Param("username") String username);

	@Query("select distinct u from User as u where u.username = :username"
			+ " and u.phonenumber = :phonenumber and u.email = :email")
	User findByUserNameEmailPhone(@Param("username") String username, @Param("phonenumber") String phonenumber,
			@Param("email") String email);

	@Query("select u from User as u where u.username != :username")
	List<User> findAllUsersExclude(@Param("username") String username);

	@Query("select u from User as u where u.username like %:username%")
	List<User> findByUserName1(@Param("username") String username);

	@Query("select distinct u from User as u where  u.phonenumber = :phonenumber")
	User findByPhoneNumber(@Param("phonenumber") String phonenumber);

	@Query("select u from User as u where u.username like %:name% or u.phonenumber like %:name%")
	List<User> findUserByUserNameAndPhoneNumber(@Param("name") String name);

	@Query("select u from User as u join u.userType t where t.id = 2")
	List<User> findAllManager();

	@Query("select u from User as u join u.userType t where t.id = 3")
	List<User> findAlEmployee();

}
