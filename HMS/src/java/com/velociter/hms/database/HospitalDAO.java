package com.velociter.hms.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.velociter.hms.model.Department;
import com.velociter.hms.model.Nurse;
import com.velociter.hms.model.Patient;
import com.velociter.hms.model.Doctor;

public class HospitalDAO {
	SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	Session session = sessionFactory.openSession();
	Transaction transcationObject = session.beginTransaction();

	public int addPatient(Patient patientObject) {

		int patientStatus = 0;
		session.save(patientObject);
		patientStatus = 1;
		transcationObject.commit();

		session.close();

		return patientStatus;
	}

	public int addDoctor(Doctor doctorObject) {
		
		int doctorstatus = 0;
		
		session.save(doctorObject);
		doctorstatus = 1;
		transcationObject.commit();

		session.close();

		return doctorstatus;
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

		session.save(department);
		departmentStatus = 1;
		transcationObject.commit();

		session.close();

		return departmentStatus;
	}

}
