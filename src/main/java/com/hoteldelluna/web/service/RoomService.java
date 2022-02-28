package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Room;

public class RoomService {
   
   private DataSource dataSource;
   private String uploadPath = "C:/jsp/jsp-workspace/HotelDelLuna/src/main/webapp/upload/";
   
   public RoomService() {
      // TODO Auto-generated constructor stub
      
      try {
         Context ctx = new InitialContext();
         dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
      } catch (NamingException e) {
         // TODO Auto-generated catch block
         System.out.println("에러: " +  e.getMessage());
      }
   }
   
   public ArrayList<Room> roomList() {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Room> roomLists = new ArrayList<Room>();
   
      try {
         conn = this.dataSource.getConnection();
         
         String sql = "select r_no, r_branch , r_star, r_img, r_roomtype, r_bedtype, r_occupancy, to_char(r_price, '999,999') as r_price from room";
         pstmt = conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Room to = new Room();
            to.setR_no(rs.getInt("r_no"));
            to.setR_branch(rs.getString("r_branch"));
            to.setR_star(rs.getInt("r_star"));
            to.setR_img(rs.getString("r_img"));
            to.setR_roomtype(rs.getString("r_roomtype"));
            to.setR_bedtype(rs.getString("r_bedtype"));
            to.setR_occupancy(rs.getInt("r_occupancy"));
            to.setR_price(rs.getString("r_price"));
            
            System.out.println(to.toString());
            roomLists.add(to);
         }
      } catch(SQLException e) {
         System.out.println("에러: " + e.getMessage());
      } finally {
         if(rs != null) try {rs.close();} catch(SQLException e) {}
         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
         if(conn != null) try {conn.close();} catch(SQLException e) {}
      }
      return roomLists;
   }
   
   public Room foundRoom(int roomNo) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Room room = null;
	      
	   
	      try {
	         conn = this.dataSource.getConnection();
	         
	         String sql = "select r_no, r_branch , r_star, r_img, r_roomtype, r_bedtype, r_occupancy, to_char(r_price, '999,999') as r_price from room where r_no=? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomNo);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            room = new Room();
	            room.setR_no(rs.getInt("r_no"));
	            room.setR_branch(rs.getString("r_branch"));
	            room.setR_star(rs.getInt("r_star"));
	            room.setR_img(rs.getString("r_img"));
	            room.setR_roomtype(rs.getString("r_roomtype"));
	            room.setR_bedtype(rs.getString("r_bedtype"));
	            room.setR_occupancy(rs.getInt("r_occupancy"));
	            room.setR_price(rs.getString("r_price"));
	            
	         }
	         
	         System.out.println(room);
	      } catch(SQLException e) {
	         System.out.println("에러: " + e.getMessage());
	      } finally {
	         if(rs != null) try {rs.close();} catch(SQLException e) {}
	         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
	         if(conn != null) try {conn.close();} catch(SQLException e) {}
	      }
	      return room;
	   }
}