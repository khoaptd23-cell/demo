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
import uef.edu.vn.model.Apartment;

/**
 *
 * @author Acer
 */
@Repository
public class ApartmentRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private Apartment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Apartment apartment = new Apartment();
		apartment.setApartmentID(rs.getInt("ApartmentID"));
		apartment.setApartmentNumber(rs.getString("ApartmentNumber"));
		apartment.setFloor(rs.getInt("Floor"));
		apartment.setArea(rs.getDouble("Area"));
		apartment.setStatus(rs.getString("Status"));
		return apartment;
	}

	public List<Apartment> findAll() {
		String sql = "SELECT * FROM Apartments";
		return jdbcTemplate.query(sql, this::mapRow);
	}
	
	public Apartment findById(int id) {
		String sql = "SELECT * FROM Apartments WHERE ApartmentID = ?";
		return jdbcTemplate.queryForObject(sql, this::mapRow, id);
	}
	
	public void save(Apartment apartment) {
		String sql = "INSERT INTO Apartments (ApartmentNumber, Floor, Area, Status) VALUES( ?,  ?,  ?,  ?)";
		jdbcTemplate.update(sql,
				apartment.getApartmentNumber(),
				apartment.getFloor(),
				apartment.getArea(),
				apartment.getStatus());
	}
	
	public void update(Apartment apartment) {
		String sql = "UPDATE Apartments SET ApartmentNumber = ?, Floor = ?, Area = ?, Status =  ? WHERE  ApartmentID =  ?";
		jdbcTemplate.update(sql,
				apartment.getApartmentNumber(),
				apartment.getFloor(),
				apartment.getArea(),
				apartment.getStatus(),
				apartment.getApartmentID());
	}
	
	public void delete(int id) {
		String sql = "DELETE FROM Apartments WHERE ApartmentID = ?";
		jdbcTemplate.update(sql, id);
	}

}
