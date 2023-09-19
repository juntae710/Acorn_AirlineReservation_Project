<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="prj0918프로젝트연습.Flight" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
</head>
<body>
 
<% ArrayList<Flight> list = (ArrayList<Flight>) request.getAttribute("list"); %>
<% if (list != null) { %>
    <% for (int i = 0; i < list.size(); i++) { %>
        <ul>
            <li>항공기번호: <%= list.get(i).getFcode()%></li>
            <li>출발지: <%= list.get(i).getDeparture() %></li>
            <li>도착지: <%= list.get(i).getArrival() %></li>
            <li>출발일: <%= list.get(i).getSday() %></li>
            <li>도착일: <%= list.get(i).getEday() %></li>
            <li>출발시간: <%= list.get(i).getStime() %></li>
            <li>도착시간: <%= list.get(i).getEtime() %></li>
            <li>항공번호: <%= list.get(i).getAirnum() %></li>
        </ul>
    <% } %>
<% } %>

<form name="frm2" action="/prj0918프로젝트연습/sdelete" method="post" >
<button>예약취소</button>

</form>

</body>
</html>