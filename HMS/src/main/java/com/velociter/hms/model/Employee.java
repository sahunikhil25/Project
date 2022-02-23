package com.velociter.hms.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "EMPLOYEEID")
	private int employeeId;

	@Column(name = "SSN")
	private long ssn;

	@Column(name = "EMPLOYEENAME")
	private String employeeName;
	
//	@Column(name = "DESIGNATIONNAME") 
//	private String designationName;
	 
	
//	@Column(name="SPECIALITY")
//	private String speciality;
//	
	@Column(name = "JOINDATE")
	private String joinDate;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "D_Id")
	private Designation designation;
	
	
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "specialityId")

	private Specialties specialties;
	
	
	public Specialties getSpecialties() {
		return specialties;
	}

	public void setSpecialties(Specialties specialties) {
		this.specialties = specialties;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public long getSsn() {
		return ssn;
	}

	public void setSsn(long ssn) {
		this.ssn = ssn;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	/*
	 * public String getDesignationName() { return designationName; }
	 * 
	 * public void setDesignationName(String designationName) { this.designationName
	 * = designationName; }
	 */

//	public String getSpeciality() {
//		return speciality;
//	}

//	public String getDesignationName() {
//		return designationName;
//	}
//
//	public void setDesignationName(String designationName) {
//		this.designationName = designationName;
//	}

	public Designation getDesignation() {
		return designation;
	}

	public void setDesignation(Designation designation) {
		this.designation = designation;
	}

//	public void setSpeciality(String speciality) {
//		this.speciality = speciality;
//	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
//	@ManyToOne
//	private Designation designation;
//	
//	public Designation getDesignation() {
//		return designation;
//	}
//
//	public void setDesignation(Designation designation) {
//		this.designation = designation;
//	}

	@Override
public String toString() {
		return "Employee [employeeId=" + employeeId + ", ssn=" + ssn + ", employeeName=" + employeeName
				+ ", joinDate=" + joinDate
				+ "]";
	}

}
