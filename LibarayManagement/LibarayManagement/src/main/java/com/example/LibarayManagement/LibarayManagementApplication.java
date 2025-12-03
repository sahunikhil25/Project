package com.example.LibarayManagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages="com.example.services")
@ComponentScan(basePackages="com.example.controller")
@EnableJpaRepositories("com.example.DAO")
@EntityScan("com.example.model")
public class LibarayManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(LibarayManagementApplication.class, args);
		System.out.println("Hello");
	}

}
