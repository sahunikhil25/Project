package com.example.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.services.AdminService;
import com.example.services.UserService;
import com.example.model.User;

@Controller
public class AdminController {

	 static AdminService as=new AdminService();
	 UserService us=new UserService(); 
	
	@RequestMapping("/adminlogin")
	public String adminLogin()
	{
		return "adminlogin";
	}
	
	@RequestMapping(value="/AdminHandler",method =RequestMethod.POST)
	public String adminLoginDetails(@RequestParam String adminName, @RequestParam String password, Model model)
	{
		if(as.checkAdminLoginDetails(adminName, password)==true)
		{
			String loginMsg="you Entered Successfully";
			model.addAttribute("adminLoginMsg", loginMsg);
			return "AdminSucess";
		}else
		{
			String erMsg="You Enter Wrong Credentials...please check";
			model.addAttribute("adminLoginMsg", erMsg);
			return "adminlogin";	
		}
	}
	
	@RequestMapping("/showusers")
	public String showAllUsers(Model model)
	{
		System.out.println("controal inside showusers");
		ArrayList<User>userList=us.getAllUsers();
	    model.addAttribute("ul",userList);
		return "displayregisteredusers";
	}
}
