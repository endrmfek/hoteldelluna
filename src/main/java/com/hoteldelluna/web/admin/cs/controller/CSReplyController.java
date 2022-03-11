package com.hoteldelluna.web.admin.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.service.CSBoardService;


@WebServlet("/csreply")
public class CSReplyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CSBoard to = new CSBoard();
		to.setC_no(request.getParameter("c_no"));
		
		request.getRequestDispatcher("/WEB-INF/view/admin/cs/cs_manager_view_reply.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		CSBoard to = new CSBoard();
		String c_no = request.getParameter("c_no");
		
		to.setC_no(c_no);
		to.setC_subject(request.getParameter("c_subject"));
		to.setC_name(request.getParameter("c_name"));
		to.setC_password(request.getParameter("c_password"));
		to.setC_content(request.getParameter("c_content"));
		to.setC_wip(request.getRemoteAddr());

		CSBoardService dao = new CSBoardService();
		int flag = dao.csboardReplyOk(to);
		
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if(flag == 0) {
			out.println("alert('글쓰기에 성공했습니다.');");
			out.println("location.href='csmanage';");
		} else if(flag == 1) {
			out.println("alert('글쓰기에 실패했습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
	}
}
