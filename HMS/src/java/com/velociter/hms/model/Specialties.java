package com.velociter.hms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SPECIALTIES")
public class Specialties {
	
	@Id
	private int id;
	@Column(name="SPECIALITY")
	private String speciality;

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	
	

}
