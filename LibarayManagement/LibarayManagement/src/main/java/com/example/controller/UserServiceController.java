package com.example.controller;

import java.lang.invoke.MethodType;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.BookIssue;
import com.example.services.UserService;

@Controller
public class UserServiceController {

	@Autowired
	UserService userservice;
	
	@RequestMapping(value="/bookissue")
	public String bookIssue()
	{
		return "bookissue";
	}
	
	@RequestMapping(value="/returnbook")
	public String returnBook()
	{
		return "returnbook";
	}
	@RequestMapping(value="/historyissuebook")
	public String historyIssueBook(Model model,HttpSession sessionObj)
	{
		
		
		List<BookIssue>listOfBook=userservice.historyIssueBook();
		
	
		model.addAttribute("allbookissue", listOfBook);
		return "historyissuebook";
	}
	@RequestMapping(value="/historyreturnbook")
	public String historyReturnBook()
	{
		return "historyreturnbook";
	}
	
	@RequestMapping(value="/bookissuehandler", method=RequestMethod.POST)
	@ResponseBody
	public String  bookIssueHandler(@ModelAttribute BookIssue bookissue)
	{
		BookIssue bookissueObj=userservice.saveBookIssueRequest(bookissue);
        
		
		if(bookissueObj!=null)
		{
			System.out.println("Count is" + userservice.checkCount(bookissue.getMobileNumber()));
			
			System.out.println("After count________");
			
			userservice.getReocrd(bookissue.getMobileNumber());
			
			return "Requested submitted successfully";
		}else 
			
			
		{
			return "Requested not submitted..!someting went wrong";
		}
	}
}
