package com.velociter.hms.database;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.velociter.hms.model.Appointment;
import com.velociter.hms.model.Department;
import com.velociter.hms.model.Designation;
import com.velociter.hms.model.Nurse;
import com.velociter.hms.model.Patient;
import com.velociter.hms.model.Specialties;
import com.velociter.hms.model.Doctor;
import com.velociter.hms.model.Employee;

public class HospitalDAO {
	static SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	static Session session = sessionFactory.openSession();
	static Transaction transcationObject = session.beginTransaction();

	public int addPatient(Patient patientObject) {

		int patientStatus = 0;
  
	   	SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		 Session session = sessionFactory.openSession();
		 Transaction transcationObject = session.beginTransaction();
		 
		session.save(patientObject);
		
		 patientStatus = 1;
		transcationObject.commit();

		session.close();

		return patientStatus;
	}

	
	public int addDoctor(Doctor doctorObject) {

		int doctorstatus = 0;

		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();

		session.save(doctorObject);
		doctorstatus = 1;
		transcationObject.commit();

		session.close();

		return doctorstatus;
	}

	public int addEmployee(Employee employeeObject) {

		int employeestatus = 0;

		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
		
		session.save(employeeObject);
		employeestatus = 1;
		transcationObject.commit();

		session.close();

		return employeestatus;
	}

	public int addNurse(Nurse nurseObject) {
		int nursestatus = 0;

		session.save(nurseObject);
		nursestatus = 1;

		transcationObject.commit();

		session.close();

		return nursestatus;
	}

	public int addDepartment(Department department) {
		int departmentStatus = 0;
		
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
        
		session.save(department);
		transcationObject.commit();
		departmentStatus = 1;

		session.close();

		return departmentStatus;
	}

	public int addAppointment(Appointment appointmentObj) {
		int appointmentStatus = 0;
		
		try {
			
			 SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			 Session session = sessionFactory.openSession();
			 Transaction transcationObject = session.beginTransaction();
			 session.saveOrUpdate(appointmentObj);
			transcationObject.commit();
			appointmentStatus = 1;
		} catch (Exception e) {
			System.out.println("Unable to add AppointmentObject " + e.getMessage());
		}
		return appointmentStatus = 1;
	}
	
	public List<Designation> getDesignationNames() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("controll is comming");
		Query query = session.createQuery("from Designation");// here persistent class name is Manager
		List<Designation> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		t.commit();
		session.close();
		return listObject;
	}
	
	public List<Specialties> getSpecialtiesNames() {

		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();

		System.out.println("controll is comming");
		Query query = session.createQuery("from Specialties");// here persistent class name is Manager
		List<Specialties> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		transcationObject.commit();
		session.close();
		return listObject;
	}
	
	public List<Employee> getDoctorNames() {
		
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObj = session.beginTransaction();

		//Select employeeName from Employee where D_Id='2'
		System.out.println("controll is comming");//SELECT DISTINCT employeeName FROM Employee where D_Id='2'
		Query query = session.createQuery("FROM Employee where D_Id = : id ");// here persistent class name is Manager
		query.setParameter("id",2);
		List<Employee> listObject = query.getResultList();
		System.out.println("list data :" + listObject.toString());
		
		transcationObj.commit();
		session.close();
		
		return listObject;
	}	
	
	public boolean checkExistingMobile(Patient patientObj) {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
		long mobilenumber = patientObj.getMobileNumber();
		System.out.println("check mobile number :" + mobilenumber);
		System.out.println("controll is comming");
		Query query = session.createQuery("from Patient as p where p.mobileNumber =" + mobilenumber);// here

		List<Patient> list = query.getResultList();
		session.close();
		if (list.isEmpty() == true) {
			System.out.println("status" + list.isEmpty());

			return true; // it means user can register because emaild and mobile number is new
		} else {
			System.out.println("number already register" + list.toString() + "status" + list.isEmpty());
			return false;// it means user can not register because emaild and mobile number is already
							// Register
		}

	}

	public boolean checkSsnExist(Employee employeeObj) {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();

		long ssn = employeeObj.getSsn();
		System.out.println("ssn  number is:" + ssn);
		System.out.println("controll is comming");
		Query query = session.createQuery("from Employee as e where e.ssn =" + ssn);// here

		List<Employee> list = query.getResultList();
		session.close();

		if (list.isEmpty() == true) {
			System.out.println("status" + list.isEmpty());

			return true; // it means user can register because ssn number is new
		} else {
			System.out.println("number already register" + list.toString() + "status" + list.isEmpty());
			return false;// it means user can not register because ssn number is already
							// Register
		}

	}

	public boolean checkDepartmentNameExist(Department departmentObj) {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObj = session.beginTransaction();

		String departmentName = departmentObj.getDepartmentName();
		System.out.println("Department Name is :" + departmentName);
		System.out.println("controll is comming");

		Query query = session.createQuery("select d.departmentName from Department d");// here

		List<String> list = query.list();

		for (String list1 : list) {
			System.out.println("department list is:" + list1);
			if (departmentName.equals(list1)) {
				return false;
			}

		}
		transcationObj.commit();
		session.close();
		return true;

		// session.close();

//		 if (list.isEmpty() == true) {
//			 System.out.println("status" +list.isEmpty());
//			 
//				return true;
//			} else {
//				 System.out.println("Name already register" + list.toString() + "status" +list.isEmpty());
//				return false;
//			} 

	}

	public boolean checkHeadOfDepartmentExist(Department headofdepartmentObj) {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();

		String headofdepartmentName = headofdepartmentObj.getHeadOfDepartment();
		System.out.println("Head of Department Name  :" + headofdepartmentName);
		System.out.println("controll is comming");

		Query query = session.createQuery("from Department as d where d.headOfDepartment =" + headofdepartmentName);// here

		List<Department> list = query.getResultList();
		transcationObject.commit();
		session.close();

		if (list.isEmpty() == true) {
			System.out.println("status" + list.isEmpty());

			return true;
		} else {
			System.out.println("Name already register" + list.toString() + "status" + list.isEmpty());
			return false;
		}

	}
	
	public boolean isPatientAppointmentMobileNumberExist(Appointment appointmentObj) {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transcationObject = session.beginTransaction();
		long mobilenumber = appointmentObj.getMobileNumber();
		System.out.println("check mobile number :" + mobilenumber);
		System.out.println("controll is comming");
		Query query = session.createQuery("from Appointment as a where a.mobileNumber =" + mobilenumber);// here

		List<Appointment> list = query.getResultList();
		session.close();
		if (list.isEmpty() == true) {
			System.out.println("status" + list.isEmpty());

			return true; // it means user can register because emaild and mobile number is new
		} else {
			System.out.println("number already register" + list.toString() + "status" + list.isEmpty());
			return false;// it means user can not register because emaild and mobile number is already
							// Register
		}

	}


	public List<Patient> getPatientList() {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction transcationObj = session.beginTransaction();
		
		System.out.println("Control is comming in get patient list");
	
		List<Patient> patients = session.createQuery("FROM Patient").list();
		System.out.println("PatientData:" + patients.toString());
		transcationObj.commit();
		return patients;

	}
	
	public List<Employee> getEmployeeList() {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction transcationObj = session.beginTransaction();
		
		System.out.println("Control is comming in get Employee list");
	
		List<Employee> employees = session.createQuery("FROM Employee").list();
		System.out.println("EmployeeData:" + employees.toString());
		transcationObj.commit();
		return employees;

	}
	
	public List<Department> getDepartmentList() {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction transcationObj = session.beginTransaction();
		
		System.out.println("Control is comming in get Department list");
	
		List<Department> department = session.createQuery("FROM Department").list();
		System.out.println("DepartmentData:" + department.toString());
		transcationObj.commit();
		return department;
	}
	
	
	
	
	  public List<Employee> getDoctorList() {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction transcationObj = session.beginTransaction();
		
		System.out.println("Control is comming in get Doctor list");
	
		List employee =(List) session.createQuery("from Employee where D_Id='2'").list();
       
		System.out.println("DoctorData:" + employee.toString());
		transcationObj.commit();
		return employee;

	}
	  public List<Employee> getNurseList() {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		Transaction transcationObj = session.beginTransaction();
		
		System.out.println("Control is comming in get Nurse list");
	
		List nurse =(List) session.createQuery("from Employee where D_Id='1'").list();
       
		System.out.println("NurseData:" + nurse.toString());
		transcationObj.commit();
		return nurse;

	}
	
	
}


