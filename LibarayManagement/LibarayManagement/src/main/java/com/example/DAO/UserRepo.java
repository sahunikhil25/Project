package com.example.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.BookIssue;

@Repository
public interface UserRepo extends JpaRepository<BookIssue, Integer>{

	
	
}
