package com.example.LibarayManagement;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.model.User;

@Configuration
public class CreateBeans {

@Bean
public ArrayList<User> getListBean()
{
	return new ArrayList<User>();	
	
}

//@Bean
//public ArrayList getUserListBean()
//{
//	ArrayList<User>list=new ArrayList();
//	return list;
//}
	
}
