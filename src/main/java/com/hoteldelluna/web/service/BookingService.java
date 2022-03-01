package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Booking;

public class BookingService {

private DataSource dataSource;
	
	public BookingService() {
		// DataSource얻어내는 역할
		try {
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			this.dataSource=(DataSource)envCtx.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("[에러]"+e.getMessage());
		}
	}
	public void reservation() {
		//사용하지않음
	}
	public int reservationOk(Booking to) { 
		Connection conn=null;
		PreparedStatement pstmt=null;

		int flag=1;
		try{
			
		 	
		 	conn=dataSource.getConnection();
		 	
			String sql="insert into booking(b_no, b_u_no, b_r_no, b_name, b_phone, b_email, b_requirement, b_cardC, b_cardN, b_expirationD, b_cvc, b_adult, b_child, b_ttlprice, b_chkin, b_chkout, b_nights ) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,to.getB_u_no());
			pstmt.setInt(2,to.getB_r_no());
			pstmt.setString(3,to.getB_name());
			pstmt.setString(4,to.getB_phone());
			pstmt.setString(5,to.getB_email());
			pstmt.setString(6,to.getB_requirement());
			pstmt.setString(7,to.getB_cardName());
			pstmt.setString(8,to.getB_cardC());
			pstmt.setString(9,to.getB_cardN());
			pstmt.setString(10,to.getB_expirationD());
			pstmt.setString(11,to.getB_cvc());
			pstmt.setString(12,to.getB_adult());
			pstmt.setString(13,to.getB_child());
			pstmt.setInt(14,to.getB_ttlprice());
			pstmt.setString(15,to.getB_chkin());
			pstmt.setString(16,to.getB_chkout());
			pstmt.setInt(17,to.getB_nights());
			
			if(pstmt.executeUpdate()==1){
				flag=0;
			}
		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(pstmt != null)try{pstmt.close();} catch(SQLException e) {}
			if(conn != null)try{conn.close();} catch(SQLException e) {}
		}
		return flag;
	}
}
