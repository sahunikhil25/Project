package com.velociter.hms.model;

import java.util.Set;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="DESIGNATION")
public class Designation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int designationId;
	
	@Column(name="DESIGNATIONNAME")
	private String designationName;

	@Column(name="DESIGNATIONID")
	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}
	
//	 @OneToMany(cascade=CascadeType.ALL)
//	 @JoinColumn(name="DESIGNATIONID")
//	 private Set<Employee> employee;
//
//	public Set<Employee> getEmployee() {
//		return employee;
//	}
//
//	public void setEmployee(Set<Employee> employee) {
//		this.employee = employee;
//	}

}
