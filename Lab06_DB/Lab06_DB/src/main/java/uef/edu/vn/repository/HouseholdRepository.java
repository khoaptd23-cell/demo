/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uef.edu.vn.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uef.edu.vn.model.Household;

/**
 *
 * @author Acer
 */
@Repository
public class HouseholdRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private Household mapRow(ResultSet rs, int rowNum) throws SQLException {
		Household h = new Household();
		h.setHouseholdID(rs.getInt("HouseholdID"));
		h.setApartmentID(rs.getInt("ApartmentID"));
		h.setHeadOfHousehold(rs.getString("HeadOfHousehold"));
		h.setContactNumber(rs.getString("ContactNumber"));
		h.setEmail(rs.getString("Email"));
		return h;
	}

	public List<Household> findAll() {
		return jdbcTemplate.query("SELECT * FROM Households", this::mapRow);
	}

	public Household findById(int id) {
		return jdbcTemplate.queryForObject(
				"SELECT * FROM Households WHERE HouseholdID = ?", this::mapRow, id);
	}

	public void save(Household h) {
		String sql = "INSERT INTO Households (ApartmentID, HeadOfHousehold, ContactNumber, Email) VALUES(?, ?, ?, ?)";
		jdbcTemplate.update(sql, h.getApartmentID(), h.getHeadOfHousehold(), h.getContactNumber(), h.getEmail());
	}

	public void update(Household h) {
		String sql = "UPDATE Households SET ApartmentID=?, HeadOfHousehold=?, ContactNumber=?, Email=? WHERE HouseholdID=?";
		jdbcTemplate.update(sql, h.getApartmentID(), h.getHeadOfHousehold(), h.getContactNumber(), h.getEmail(), h.getHouseholdID());
	}

	public void delete(int id) {
		jdbcTemplate.update("DELETE FROM Households WHERE HouseholdID=?", id);
	}
}
