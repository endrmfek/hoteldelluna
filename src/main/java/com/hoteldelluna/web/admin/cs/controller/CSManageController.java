package com.hoteldelluna.web.admin.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.service.CSBoardService;

@WebServlet("/csmanage")
public class CSManageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CSBoardService boardService = new CSBoardService();
		List<CSBoard> list = boardService.csboardList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/cs/cs_manager.jsp").forward(request, response);
	}
}
