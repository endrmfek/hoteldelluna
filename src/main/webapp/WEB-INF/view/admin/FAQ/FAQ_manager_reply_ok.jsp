
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	
	
	int flag = (Integer)request.getAttribute( "flag" );
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		//out.println("정상 입력");
		out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='faqlist.do';");
	}else if(flag == 1){
		//out.println("비정상");
		out.println("alert('글쓰기에 실패했습니다.');");
		out.println("history.back();");		
	}
	out.println("</script>");
%>