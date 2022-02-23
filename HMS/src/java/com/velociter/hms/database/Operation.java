
package com.velociter.hms.database;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class Operation {

	static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	static Session session = sessionFactory.openSession();

	public static Integer  totalPatient() throws Exception {

		Query query = session.createQuery("SELECT  COUNT(distinct p.patientId) FROM  Patient p");
		int count = ((Number)query.uniqueResult()).intValue();
		return count;
	}

	public static Integer totalNurse() throws Exception {

		Query query = session.createQuery("SELECT COUNT(distinct n.ssn ) FROM Nurse n");
	     int count = ((Number) query.uniqueResult()).intValue();
		return  count;

	}

	public static Integer totalDoctor() throws Exception {

		Query query = session.createQuery("SELECT COUNT(distinct d.ssn) FROM Doctor d");
		int count = ((Number)query.uniqueResult()).intValue();   // int count=Integer.parseInt(query.uniqueResult().toString());
		return count;
		
	}
	
	public static Query getSpecialties()
	{	
		Query query=session.createQuery("Select speciality from Specialties");
		return query; 
	 
	}
}
