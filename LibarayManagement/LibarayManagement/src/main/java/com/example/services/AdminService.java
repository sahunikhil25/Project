package com.example.services;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.example.LibarayManagement.CreateBeans;
import com.example.model.User;

public class AdminService {

	private String adminName="admin";
	private static final String password="admin@123";
	
	public boolean checkAdminLoginDetails(String adminName, String password)
	{
		if(this.adminName.equals(adminName)==true && this.password.equals(password))
		{
			return true;
		}else
		{
			return false;
		}
	}
	
//	public ArrayList<User>getAllUsers()
//	{
//		
//		ApplicationContext context=new AnnotationConfigApplicationContext(CreateBeans.class);
//		
//		ArrayList list=context.getBean("getListBean",ArrayList.class);
//				
//		return list;
//	}
}
