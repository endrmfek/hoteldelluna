package com.hoteldelluna.web.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.service.NoticeService;

@WebServlet("/noticewrite")
public class NoticeWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/notice_write.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		Notice notice = new Notice();
		notice.setN_name(request.getParameter("writer"));
		notice.setN_subject(request.getParameter("subject"));
		notice.setN_pwd(request.getParameter("password"));
		notice.setN_content(request.getParameter("content"));
		
		System.out.println(notice.toString());
		NoticeService noticeService = new NoticeService();
		int flag = noticeService.NoticeWriteOk(notice);
		
		response.getWriter().println("<script type='text/javascript'>");
		if(flag==0){
			response.getWriter().println("alert('글쓰기가 완료되었습니다.')");
			response.getWriter().println("location.href='noticemanage'");
		}else if(flag==1){
			response.getWriter().println("alert('글쓰기에 실패하였습니다.')");
			response.getWriter().println("history.back();");
		}
		response.getWriter().println("</script>");
	}
}
