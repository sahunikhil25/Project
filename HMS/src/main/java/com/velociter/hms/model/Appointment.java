package com.velociter.hms.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name="APPOINTMENT")
public class Appointment {

@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private int appointmentId;

@Column(name="PATIENTNAME")
private String patientName;

@Column(name="MOBILENUMBER")
private long mobileNumber;

@Column(name="CITY")
private String city;



//@Column(name="DOCTORNAME")
//private String doctorName;

@Column(name="APPOINTMENTDATE")
private String appointmentDate;

public int getAppointmentId() {
	return appointmentId;
}
public void setAppointmentId(int appointmentId) {
	this.appointmentId = appointmentId;
}


@OneToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "employeeId")
private  Employee employee;

public Employee getEmployee() {
	return employee;
}

public void setEmployee(Employee employee) {
	this.employee = employee;
}


public String getPatientName() {
	return patientName;
}

public void setPatientName(String patientName) {
	this.patientName = patientName;
}

public long getMobileNumber() {
	return mobileNumber;
}

public void setMobileNumber(long mobileNumber) {
	this.mobileNumber = mobileNumber;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getAppointmentDate() {
	return appointmentDate;
}

public void setAppointmentDate(String appointmentDate) {
	this.appointmentDate = appointmentDate;
}


}
