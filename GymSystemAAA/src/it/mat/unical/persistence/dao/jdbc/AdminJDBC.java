package it.mat.unical.persistence.dao.jdbc;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.postgresql.jdbc.PgArray;

import it.mat.unical.ingsw.model.Admin;
import it.mat.unical.ingsw.model.Corso;
import it.mat.unical.ingsw.model.Trainer;
import it.mat.unical.persistence.DBManager;
import it.mat.unical.persistence.DataSource;
import it.mat.unical.persistence.dao.AdminDao;

public class AdminJDBC implements AdminDao{

private DataSource dataSource;
	
	public AdminJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void save(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Admin findByPrimaryKey(String mail) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		Admin admin = null;
		try {
			connection = this.dataSource.getConnection();
			PreparedStatement statement;
			String query = "select * from admin where mail = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, mail);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				admin = new Admin();
			
				admin.setNome(result.getString("nome"));				
				admin.setCognome(result.getString("cognome"));
				admin.setFotoProfilo(result.getString("fotoprofilo"));
				admin.setMail(result.getString("mail"));
				admin.setPassword(result.getString("password"));
				Array a = result.getArray("richieste");
				String[] nullable = (String[])a.getArray();
						
				admin.setRichiesteJDBC(nullable);
				

			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}	
		return admin;
		
		
	}

	@Override
	public List<Admin> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Admin admin) {
		Connection connection = null;
		try {
			connection = this.dataSource.getConnection();
			String update = "update admin SET nome = ?, cognome = ?, fotoprofilo = ?, password = ?, richieste = ? WHERE mail=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, admin.getNome());
			statement.setString(2, admin.getCognome());
			statement.setString(3, admin.getFotoProfilo());			
			statement.setString(4, admin.getPassword());
			statement.setString(6, admin.getMail());
			final String[] data = admin.getRichieste().toArray(new String[admin.getRichieste().size()]);
			final java.sql.Array sqlArray = connection.createArrayOf("varchar", data);
			statement.setArray(5, sqlArray);
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	@Override
	public void delete(Admin admin) {
		// TODO Auto-generated method stub
		
	}

}
