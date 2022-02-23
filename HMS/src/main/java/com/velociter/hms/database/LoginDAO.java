package com.velociter.hms.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.cfg.Configuration;

import com.velociter.hms.model.Admin;

import org.hibernate.Query;

public class LoginDAO {

	public Admin loginAdmin(String name, String password) {
		Admin admin = null;

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		System.out.println("name and password in LoginDao:" + name + " " + password);

		try {

			String query = "from Admin as E where E"
					+ ".name=:name and"
					+ " E.password=:password";
			Query queryObject = session.createQuery(query);
			queryObject.setParameter("name", name);
			queryObject.setParameter("password", password);
			admin = (Admin) queryObject.getSingleResult();
			System.out.println("adminId after login :" + admin.getId());
			t.commit();

		} catch (Exception e) {

			admin = null;

		}
		return admin;
	}

}
