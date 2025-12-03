package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.User;
import com.example.services.UserService;

@Controller
public class UserController {

	@Autowired
	UserService us;
	
	@Autowired
	ArrayList list;
	
	@RequestMapping("/login")
	public String login()
	{
		System.out.println("inside login");
		return "login";
	}
	
	@RequestMapping(value="/UserHandle",method =RequestMethod.POST)
	public String UserHandler(@ModelAttribute User user, Model model)
	{
        
		
		//long mobNumber=user.getMobileNumber();
		
	
		if(us.isUserAvailable(user))
		{
			String  s="User is Already available with MobileNumber: "+ user.getMobileNumber();
			model.addAttribute("msg",s);
			return "login";	
		}
		else
		{
			boolean b;
			b=us.saveUser(user);
			if(b==true)
			{	
			String s="User Registered Successfully";
			model.addAttribute("msg", s);
			return "saveuser";
			}else
			{
				String s="Something went wrong....please check";
				model.addAttribute("msg", s);
				return "saveuser";	
			}
		
		}
	}
	
	@RequestMapping("/booklogin")
	public String BookLogin()
	{
		
		return "booklogin";

	}
	
	
	@RequestMapping(value="/BookApply",method=RequestMethod.POST)
	public String bookApply(@RequestParam("email")String email,Model model,HttpSession sessionObj) 
	{
  	   sessionObj.setAttribute("emailValue",email);
  	   
		int otp=0;
		System.out.println("inside bookapply" +  email);
		try
		{
	    int length=4;
	    otp=us.generatedOtp(length);
	    list.add(otp);
		System.out.println("otp is:"+ otp);
		us.sendOtptoEmail(email,otp);
		}catch(Exception e)
		{
			System.out.println("Error in controller:"+ e.getMessage());
			return "Exception occurs in controller";
		}
		System.out.println("Email send succeefully");
		model.addAttribute("session",sessionObj);
		return "otp";
	}
	
	
	@RequestMapping(value="/otpGenrated",method=RequestMethod.POST)
	public String otpValiadtion(@RequestParam("otp")int userSendOtp,  Model m,HttpSession sessioObj)
	{
		String msg="Otp is not valid or missmatch";
	     if(list.contains(userSendOtp)) {
	    	   list.clear();
	    	 return "userservices";	 
	     }else
	     {
	    	m.addAttribute("message", msg);
	    	list.clear();
	    	return msg;
	     }
	 
	}
	
	
}
