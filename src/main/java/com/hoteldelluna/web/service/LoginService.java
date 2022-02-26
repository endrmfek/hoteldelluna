package com.hoteldelluna.web.service;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Login;



public class LoginService {
	
	private DataSource dataSource;
	
	public LoginService() {
		
		try {
			InitialContext ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void insertLogin(Login login) {
		int result = 0;
		
		String sql = "insert into login (id, pwd, repwd, name, birth, gender, email, phone, isdel) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , 0)";
		
		String url = "jdbc:oracle:thin:@localhost:1521/orclpdb";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,login.getId());
			st.setString(2, login.getPwd());
			st.setString(3, login.getRePwd());
			st.setString(4, login.getName());
			st.setString(5, login.getBirth());
			st.setString(6, login.getGender());
			st.setString(7, login.getEmail());
			st.setString(8, login.getPhone());
			
			result = st.executeUpdate();
			
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}

	public boolean LoginCheck(String id, String password) {
		// TODO Auto-generated method stub
		
		List<Login> list = new ArrayList<Login>();
		boolean result = false;
		
		String sql = "SELECT ID , PWD FROM LOGIN";
		String url = "jdbc:oracle:thin:@localhost:1521/orclpdb";
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String id_ = rs.getString("ID");
				String password_ = rs.getString("PWD");
				
				System.out.println(id_);
				
				if (id_.equals(id) && password.equals(password_)) {
					result = true;
					break;
				} 
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return result;
	}

	public List<Login> getLoginList() {

		List<Login> list = new ArrayList<Login>();
		
		String sql = "SELECT * FROM LOGIN";
		String url = "jdbc:oracle:thin:@localhost:1521/orclpdb";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "MINSOO", "11111");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String repwd = rs.getString("repwd");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int isdel = rs.getInt("isdel");

				Login login = new Login(id, pwd, repwd, name, birth, gender, email, phone, isdel);
				list.add(login);
				
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	
		return list;
	}

	public void deleteLogin(String[] delIds) {
		int result =0;
		String params = "";
		for(int i=0; i<delIds.length; i++) {
			params += "'";
			params += delIds[i];
			params += "'";
			if( i < delIds.length-1)
				params += ',';
			
		}
		System.out.println(params);
		String sql = "DELETE LOGIN WHERE ID IN ( "+params+")";
		String url = "jdbc:oracle:thin:@localhost:1521/orclpdb";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, "MINSOO", "11111");
			Statement st = con.createStatement();
			
			result = st.executeUpdate(sql);
			
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}

	

}

