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
<h2> 예약조회</h2>
<form action="/prj0918프로젝트연습/S_flightServlet" method="get">
 <label for="fcode"> fcode 입력:</label>
 <input type="text"  name="fcode">
 <button>조회</button>

</form>
<%ArrayList<Flight> list = (ArrayList<Flight>)request.getAttribute("list"); %>
<%for(int i=0;i<list.size();i++){
	out.println(list.get(i).getFcod());
	out.println(list.get(i).getDeparture());
	out.println(list.get(i).getArrival());
	out.println(list.get(i).getSday());
	out.println(list.get(i).getEday());
	out.println(list.get(i).getStime());
	out.println(list.get(i).getEtime());
	out.println(list.get(i).getAirnum()+"<br>");
	
} %>


</body>
</html>