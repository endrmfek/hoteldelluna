
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	int flag=(Integer)request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if(flag==0){		
		out.println("alert('글삭제에 성공했습니다.');");
		out.println("location.href='./faqlist.do';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 틀립니다.');");
		out.println("history.back();");		
	}else if(flag == 2){
		out.println("alert('글삭제에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>