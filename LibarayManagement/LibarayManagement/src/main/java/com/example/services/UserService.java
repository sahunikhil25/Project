package com.example.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.DAO.UserRepo;
import com.example.model.BookIssue;
import com.example.model.RequesteForBook;
import com.example.model.User;
@Service
@Component
public class UserService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	UserRepo userepo;
	
	@Autowired
	JdbcTemplate jdbcTemplate;

//	ApplicationContext context=new AnnotationConfigApplicationContext(CreateBeans.class);
//	
//	ArrayList <User> list=context.getBean("getListBean",ArrayList.class);
	
	static ArrayList<User>list=new ArrayList();
	
	public  boolean saveUser(User user)
	{
        boolean b=false;
		b=list.add(user);
		System.out.println("User Added:"+ list);
		System.out.println("List is Empty:"+ list.isEmpty());
		
		return b;
	         
	}
	
	public boolean  isUserAvailable(User user)
	{
		boolean b=false;
		long mob=user.getMobileNumber();
//		boolean b;
//		System.out.println("mob is:"+ user.getMobileNumber());
//		if(list.contains(user.getMobileNumber()))
//		{
//			b=true;
//		System.out.println("list contains:"+ b);
//		}else
//		{
//			b=false;
//		}
//		System.out.println("Number b is" + b);
//		return b;

	   for(int i=0 ;i<list.size();i++)
	   {
		   User ul=list.get(i);
		   if(mob==ul.getMobileNumber())
		   {
			   b=true;
		   }
	   }
	return b;
	}
	
	public ArrayList<User>getAllUsers()
	{
		System.out.println("List is Empty :"+ list.isEmpty());
		return list;
	}
	
	public void sendOtptoEmail(String email , int otp)
	{
	
  		
		String toAddress = email;
	    String fromAddress = "informnikhil2598@gmail.com";
	    String senderName = "Verification Consultancy";
	    String subject = "Please verify OTP for login - " + String.valueOf(otp);
	    String content ="Please insert otp to verify - "+String.valueOf(otp)
        + "\nThank you\n"
        + "Verification Consultancy.";
	    
	    try
	    {
	    SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toAddress);
        message.setFrom(fromAddress);
        message.setText(senderName);
        message.setSubject(subject);
        message.setText(content);

        mailSender.send(message);

	    }catch(Exception e)
	    {
	    	System.out.println("Exception occurs in services :"+ e.getLocalizedMessage());
	    }
		/*
		 * try {
		 * 
		 * MimeMessage message = mailSender.createMimeMessage();
		 * System.out.println("After mime message");
		 * 
		 * if(message!=null) { System.out.println("Message is not contaning null :"); }
		 * MimeMessageHelper helper = new MimeMessageHelper(message,true);
		 * 
		 * helper.setFrom(fromAddress, senderName); helper.setTo(toAddress);
		 * helper.setSubject(subject); helper.setText(content, true);
		 * 
		 * mailSender.send(message); }catch(Exception e) {
		 * System.out.println("Exception"+ e.getLocalizedMessage()); }
		 */

	}
	
	public int generatedOtp(int len)
	{
		
		 String numbers = "0123456789"; 
		Random r=new Random();
        char[] otp = new char[len]; 
        for (int i = 0; i < len; i++) 
        { 
        	otp[i]=numbers.charAt(r.nextInt(numbers.length()));
        }
		return Integer.parseInt(String.valueOf(otp));
	}
	
	
	public BookIssue saveBookIssueRequest(BookIssue bookissue)
	{
		BookIssue bookissueObj=null;
		try
		{
			if(bookissue!=null)
			{
		 bookissueObj=userepo.save(bookissue);
	
			}else
			{
				return bookissueObj;
			}
		
		}catch(Exception e)
		{
			System.out.println("Exception occurs :"+ e.getLocalizedMessage());
		}
		return bookissueObj;
	}
	public List<BookIssue> historyIssueBook()
	{
	
//	 List<BookIssue>bookissue=new ArrayList(userepo.findAll());
//	 return bookissue;
		return userepo.findAll();
	}
	
	public  int checkCount( final long mobileNumber)
	{
	 String query="select\n" +
			 "count(*)\n"+
	   "from BOOKISSUE\n"+  
	 "where\n"+
	   "MOBILENUMBER=?";
  
	 Object count1=0;

	List<Map<String, Object>>count= jdbcTemplate.queryForList(query,new Object[] {mobileNumber});
	

	for (Map<String, Object> map : count) {
	    for (Map.Entry<String, Object> entry : map.entrySet()) {
	        
	        count1 = entry.getValue();
	        System.out.println(count1);
	        map.clear();
	    }    		
	}
	    String str = count1.toString();
		int num = Integer.valueOf(str);
	return num;
}
	
	public void getReocrd(long mobileNumber)
	{
		String query="select * from BOOKISSUE  where MOBILENUMBER=?";
         
		final RequesteForBook rb=new RequesteForBook();;
		//List<Map<String, Object>>count= jdbcTemplate.queryForList(query,new Object[] {mobileNumber});
		
		int a[]= {java.sql.Types.INTEGER};
		
		List<RequesteForBook>list=jdbcTemplate.queryForList(query,RequesteForBook.class,mobileNumber);

		
	    for(int i=0 ; i<list.size();i++)
	    {
	    	RequesteForBook r=new RequesteForBook();
	    	
	    	r=list.get(i);
	        System.out.println(r.getName());
	        System.out.println(r.getEmail());
	        System.out.println(r.getBooks());
	    }
		
		
		
		
		//jdbcTemplate.query(query, null, null);
//		jdbcTemplate.query(query,new Object[] {mobileNumber},a,new ResultSetExtractor<RequesteForBook>() {
//			public RequesteForBook extractData(ResultSet rs) throws SQLException, DataAccessException {
//				
//				   while(rs.next())
//				   {
//					   rb.setName(rs.getString("name"));
//					   rb.setEmail(rs.getString("email"));
//					   rb.setBooks(rs. getString("books"));
//				   }
//			         return rb;
//				}
//				});
		
		//jdbcTemplate.query(query,/*new Object[] {mobileNumber*/ new ResultSetExtractor<RequesteForBook>(){
			
//	@Override
//			public RequesteForBook extractData(ResultSet rs) throws SQLException, DataAccessException {
//				
//				
//             
//			   while(rs.next())
//			   {
//				   rb.setName(rs.getString("name"));
//				   rb.setEmail(rs.getString("email"));
//				   rb.setBooks(rs. getString("books"));
//			   }
//		         return rb;
//			}
//		
//		});
		
		//return rb;
	}
}
	 

	

