<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="prj3_1.L_Customer" %>
<%@ page import="prj3_1.Flight" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int resno = (int)session.getAttribute("resno");
%>	

	<h2>예약이 완료되었습니다.</h2>
<p>예약번호: <%=resno %></p>
	
</body>
</html>