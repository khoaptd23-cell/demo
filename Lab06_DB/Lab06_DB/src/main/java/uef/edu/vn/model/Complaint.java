/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uef.edu.vn.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Acer
 */
public class Complaint {

	private int complaintID;
	
	@NotNull(message = "Household ID is required")
	@Min(value = 1, message = "Household ID is required")
	private Integer householdID;
	
	@NotBlank(message = "Description is required")
	@Size(min = 10, max = 1000, message = "Description must be 10–1000 characters")
	private String description;
	
	@NotNull(message = "Submission date is required")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate submissionDate;
	
	@NotBlank(message = "Status is required")
	private String status;

	public Complaint() {
		this.complaintID = 0;
		this.householdID = null;
		this.description = "";
		this.submissionDate = LocalDate.now();
		this.status = "";
	}

	public Complaint(int complaintID, int householdID, String description, LocalDate submissionDate, String status) {
		this.complaintID = complaintID;
		this.householdID = householdID;
		this.description = description;
		this.submissionDate = submissionDate;
		this.status = status;
	}

	public int getComplaintID() {
		return complaintID;
	}

	public void setComplaintID(int complaintID) {
		this.complaintID = complaintID;
	}

	public Integer getHouseholdID() {
		return householdID;
	}

	public void setHouseholdID(Integer householdID) {
		this.householdID = householdID;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getSubmissionDate() {
		return submissionDate;
	}

	public void setSubmissionDate(LocalDate submissionDate) {
		this.submissionDate = submissionDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
