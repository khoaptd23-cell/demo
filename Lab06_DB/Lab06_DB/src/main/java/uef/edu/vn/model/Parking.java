/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uef.edu.vn.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

/**
 *
 * @author Acer
 */
public class Parking {

	private int parkingID;
	
	@NotNull(message = "Household ID is required")
	@Min(value = 1, message = "Household ID is required")
	private Integer householdID;
	
	@NotBlank(message = "Parking number is required")
	@Size(max = 10)
	private String parkingNumber;
	
	@NotBlank(message = "Vehicle type is required")
	@Pattern(regexp = "Car|Motorbike", message = "Must be Car or Motorbike")
	private String vehicleType;
	
	@NotBlank(message = "Status is required")
	@Pattern(regexp = "Occupied|Vacant", message = "Status must be Occupied or Vacant")
	private String status;

	public Parking() {
	}

	public Parking(int parkingID, int householdID, String parkingNumber, String vehicleType, String status) {
		this.parkingID = parkingID;
		this.householdID = householdID;
		this.parkingNumber = parkingNumber;
		this.vehicleType = vehicleType;
		this.status = status;
	}

	public int getParkingID() {
		return parkingID;
	}

	public void setParkingID(int parkingID) {
		this.parkingID = parkingID;
	}

	public Integer getHouseholdID() {
		return householdID;
	}

	public void setHouseholdID(Integer householdID) {
		this.householdID = householdID;
	}

	public String getParkingNumber() {
		return parkingNumber;
	}

	public void setParkingNumber(String parkingNumber) {
		this.parkingNumber = parkingNumber;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
