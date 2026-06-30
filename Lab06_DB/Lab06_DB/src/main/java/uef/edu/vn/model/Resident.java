/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uef.edu.vn.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Acer
 */
public class Resident {

	private int residentID;

	@NotNull(message = "Household ID is required")
	@Min(value = 1, message = "Household ID is required")
	private Integer householdID;
	
	@NotBlank(message = "Full name is required")
	private String fullName;
	
	@NotNull(message = "Date of birth is required")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dateOfBirth;
	
	@NotBlank(message = "Gender is required")
	private String gender;
	
	@NotBlank(message = "Relationship is required")
	private String relationship;

	public Resident() {
	}

	public Resident(int residentID, int householdID, String fullName, LocalDate dateOfBirth, String gender, String relationship) {
		this.residentID = residentID;
		this.householdID = householdID;
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.relationship = relationship;
	}

	public int getResidentID() {
		return residentID;
	}

	public void setResidentID(int residentID) {
		this.residentID = residentID;
	}

	public Integer getHouseholdID() {
		return householdID;
	}

	public void setHouseholdID(Integer householdID) {
		this.householdID = householdID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

}
