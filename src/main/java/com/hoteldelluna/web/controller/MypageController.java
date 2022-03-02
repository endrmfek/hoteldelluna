package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.BookingService;
import com.hoteldelluna.web.service.LoginService;

@WebServlet("/mypage")
public class MypageController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNumber = Integer.parseInt(request.getParameter("userNumber"));
		BookingService bookingService = new BookingService();
		List<Booking> bookings =  bookingService.foundbooking(userNumber);
		System.out.println(bookings);
		request.setAttribute("bookings", bookings);
		
		LoginService loginService = new LoginService();
		Login users = loginService.getLogin((String)session.getAttribute("sessionId"));
		request.setAttribute("users", users);
		
		request.getRequestDispatcher("/WEB-INF/view/mypage.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}
}
