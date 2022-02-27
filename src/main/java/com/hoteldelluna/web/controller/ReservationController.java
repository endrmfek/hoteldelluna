package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.service.KaKaoPay;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("pg_token"));
		
		request.getRequestDispatcher("/WEB-INF/view/reservation.jsp")
		.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KaKaoPay kp = new KaKaoPay();
		String nextUrl = kp.kakaoPayReady();
		
		
		response.sendRedirect(nextUrl);
	}
}
