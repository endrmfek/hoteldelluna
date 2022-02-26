package com.hoteldelluna.web.controller;



import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.service.KakaoApi;
import com.hoteldelluna.web.service.LoginService;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kakaoLogin
		String code = request.getParameter("code");
		if(code != null) {
			HttpSession session =request.getSession();
			KakaoApi kakao = new KakaoApi();
			String access_code = kakao.getAccessCode(code);
			String id = kakao.getUserInfo(access_code);
			if(id != null) {
				session.setAttribute("sessionId", id);
			}
			response.sendRedirect("index");
		} else {
			request
		    .getRequestDispatcher("/WEB-INF/view/login.jsp")
		    .forward(request, response);
		}
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		
		LoginService service = new LoginService();
		boolean logincheck = service.LoginCheck(id, password);
		
		
		if (logincheck) {
			request.setAttribute("logincheck", logincheck);
			HttpSession session =request.getSession();
			session.setAttribute("sessionId", id);
			
			response.sendRedirect("index");
			
		} else {
			request.setAttribute("logincheck", logincheck);
			
			request
		    .getRequestDispatcher("/WEB-INF/view/login.jsp")
		    .forward(request, response);
		}
		
		
	}
	
	
	
	
	
}
