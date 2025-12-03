package com.example.model;

import java.util.ArrayList;

import javax.persistence.Column;

public class RequesteForBook {

	private String name;

	private String email;
	
	
	private String books;


	@Override
	public String toString() {
		return "RequesteForBook [name=" + name + ", email=" + email + ", books=" + books + "]";
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBooks() {
		return books;
	}


	public void setBooks(String books) {
		this.books = books;
	}
}
