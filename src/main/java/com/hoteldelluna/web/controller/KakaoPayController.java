package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.service.KaKaoPay;

@WebServlet("/kakaoPay")
public class KakaoPayController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String roomtype = request.getParameter("roomtype");
		String totalprice = request.getParameter("totalprice");
		
		KaKaoPay kp = new KaKaoPay();
		String nextUrl = kp.kakaoPayReady(roomtype , totalprice);
				
				
		response.sendRedirect(nextUrl);
	}
}
