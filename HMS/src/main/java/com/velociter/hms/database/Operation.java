
package com.velociter.hms.database;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.velociter.hms.model.Patient;


public class Operation {

	static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	static Session session = sessionFactory.openSession();

	public static Integer  totalPatient() throws Exception {

		Query query = session.createQuery("SELECT  COUNT(distinct p.patientId) FROM  Patient p");
		int count = ((Number)query.uniqueResult()).intValue();
		return count;
	}

	public static Integer totalNurse() throws Exception {

		Query query = session.createQuery("SELECT COUNT(*) FROM Employee WHERE D_ID='1'");
	     int count = ((Number) query.uniqueResult()).intValue();
		return  count;

	}
	

	public static void   getAllNames()
	{
	
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
			         
		 Query query = session.createQuery("select name from Patient ");
		 Query queryMob = session.createQuery("select mobileNumber from Patient ");
		 
		 
         String firstname = null,lastname=null;
         
         int i=0;
	     List<String>list=query.list(); //full name
	     List<Long>listmobile=queryMob.list();
	     
	     for(int j=0;j<list.size();j++)
	     {
	        
	    	String store[]=list.get(j).split(" ");
	    	
	    	Long  patientMob =listmobile.get(j).longValue(); 
	    	
	    	System.out.println("length is:"+ store.length +"mobile length is: "+ listmobile.size());

	    	if(store.length==1)
	    	{
	    	firstname=store[i];
	    	lastname="NA";
	    	System.out.println("first Name :"+firstname + " "+ "LastName:"+ lastname +" Mobile No."+ patientMob);
	    	}else
	    	{
	    	 	firstname=store[i];
		    	lastname=store[i+1];
		    	System.out.println("first Name :"+firstname + " "+ "LastName:"+ lastname +"Mobile No. "+ patientMob);
	    		
	    	}
	    
	    	
	    	
	     	
	       	 Query query1 = session.createQuery(" update Patient set firstName=:frstN, lastName=:lastN where mobileNumber=:pMob");
	    	  query1.setParameter("frstN",firstname);
	    	  query1.setParameter("lastN",lastname);
	    	  query1.setParameter("pMob",patientMob);
	    	  
	    	
            int result = query1.executeUpdate();
            System.out.println("record updated:"+ result);
	    	
	    	
	     }
	     transcationObject.commit();
	     session.close();
	 	
	     }
	
	public static Patient splitAndUpdateNames(Patient patientObj,String name)
	{
		
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
		
            String firstName = null,lastName=null;
        
	    	String fullName[] =name.split(" ");
	    	
	    	int i=0;
	    	firstName=fullName[i];
	    	lastName=fullName[i+1];
	    	
	    	if(lastName=="")
	    	{
	    		patientObj.setFirstName(firstName);
	    		patientObj.setLastName("NA");
	    	}
	    	else
	    	{
	    		patientObj.setFirstName(firstName);
	    		patientObj.setLastName(lastName);
	    	}
	    
	     transcationObject.commit();
	     session.close();
	     
	     return patientObj;
	     }
	

	public static Integer totalDoctor() throws Exception {

		Query query = session.createQuery("SELECT COUNT(*) FROM Employee WHERE D_ID='2'");
		int count = ((Number)query.uniqueResult()).intValue();   // int count=Integer.parseInt(query.uniqueResult().toString());
		return count;
		
	}
	
	public static Query getSpecialties()
	{	
		Query query=session.createQuery("Select speciality from Specialties");
		return query; 
	 
	}
	@Transactional
	public static Query getDesignation()
	{	
		Query query=session.createQuery("Select designationName from Designation");
		return query; 
	 
	}
	
	
	
	
//	public static Query getDoctorNames()
//	{	
//		Query query=session.createQuery("Select employeeName from Employee where D_Id='2'");
//		
//		return query;
//		
//	 
//	}
	
	
}
