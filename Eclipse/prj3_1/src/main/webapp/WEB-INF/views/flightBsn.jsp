<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "prj3_1.Schedule" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .btn{
       width: 500px;
       border: 1px solid black;
       height: 50px;
       display: flex;
    }
    .economy{
       width: 250px;
       border: 1px solid black;
    }
    .business{
       width: 250px;
       border: 1px solid black;
    }
    .eco_flightList{
       width: 500px; 
       border: 1px solid black;
       display: flex;
       display: none;
    }
    .bsn_flightList{
       width: 500px; 
       border: 1px solid black;
       display: flex;
    }
    .infoItem{
       display: flex;
    }
</style>
<script>
    function ecolist(){
    	$('.bsn_flightList').css("display", "none");
    	$('.eco_flightList').css("display", "block");
    	$('.eco_flightList').css("display", "flex");
    }
    function bsnlist(){
    	$('.eco_flightList').css("display", "none");
    	$('.bsn_flightList').css("display", "block");
    	$('.bsn_flightList').css("display", "flex");
    }
</script>
</head>
<body>
<%
ArrayList<Schedule> sheduleList = (ArrayList<Schedule>)session.getAttribute("scheduleList");
String grade = (String)session.getAttribute("grade");
String fromCode = (String)session.getAttribute("fromCode");
String toCode = (String)session.getAttribute("toCode");
%>
<h2>항공편 선택</h2>
<h3>가는편 <%=fromCode%> <%=sheduleList.get(1).getDep()%>  ->  <%= toCode%> <%=sheduleList.get(1).getArrival() %></h3>
<h3><%=sheduleList.get(1).getSday() %></h3>
<div class="btn">
     <button class="economy" onclick="ecolist()" type="button">이코노미석</button>
     <button class="business" onclick="bsnlist()" type="button">비즈니스석</button>
</div>
<% for(int i=0; i<sheduleList.size(); i++){%>
  <form action="/prj3_1/seat.do" method="POST">
	<div class="eco_flightList">
	   <div class="infoItem">
	     <div clas="depInfo">
	       <p><%=sheduleList.get(i).getStime()%></p>
	       <p><%=fromCode %>
	     </div>
	     <div>
	       <p> ----->
	     </div>
	     <div clas="arrInfo">
	       <p><%=sheduleList.get(i).getEtime()%></p>
	       <p><%=toCode %>
	     </div>
	   </div>
	   <div>
	      <p>항공편 명 : <%=sheduleList.get(i).getFcode() %></p>
	      <p>항공기 명 : <%=sheduleList.get(i).getAriname() %></p>
	      <%if (sheduleList.get(i).getEconum()!=0){%>
	    	 <p>잔여좌석 : <%=sheduleList.get(i).getEconum() %></p>
	      <%
	        
	     }else{%>
	    	 <p>잔여좌석이 없습니다</p>
	     <%}%>
	      
	   </div>
	   <input type="hidden" name="selectFlight" value="<%= sheduleList.get(i).getFcode()%>">
	   <input type="hidden" name="selectGrade" value="이코노미석">
	   <div>
	     <%if (sheduleList.get(i).getEconum()!=0){%>
	    	 <button type="submit">선택</button>
	     <%
	        
	     }else{%>
	    	 <p>예매불가</p>
	     <%}%>
	   </div>
	</div>
   </form>
	
	
<%}%>
<% for(int i=0; i<sheduleList.size(); i++){%>
  <form action="/prj3_1/seat.do" method="POST">
	<div class="bsn_flightList">
	   <div class="infoItem">
	     <div class="depInfo">
	       <p><%=sheduleList.get(i).getStime()%></p>
	       <p><%=fromCode %>
	     </div>
	     <div>
	       <p> ----->
	     </div>
	     <div clas="arrInfo">
	       <p><%=sheduleList.get(i).getEtime()%></p>
	       <p><%=toCode %>
	     </div>
	   </div>
	   <div>
	      <p>항공편 명 : <%=sheduleList.get(i).getFcode() %></p>
	      <p>항공기 명 : <%=sheduleList.get(i).getAriname() %></p>
	      <%if (sheduleList.get(i).getBsnnum()!=0){%>
	    	 <p>잔여좌석 : <%=sheduleList.get(i).getBsnnum() %></p>
	      <%
	        
	     }else{%>
	    	 <p>잔여좌석이 없습니다</p>
	     <%}%>
	      
	   </div>
	   <input type="hidden" name="selectFlight" value="<%=sheduleList.get(i).getFcode() %>">
	   <input type="hidden" name="selectGrade" value="비즈니스석">
	   <div>
	      <%if (sheduleList.get(i).getBsnnum()!=0){%>
	    	 <button type="submit">선택</button>
	     <%
	        
	     }else{%>
	    	 <p>예매불가</p>
	     <%}%>
	   </div>
	</div>
   </form>
	
<%}%>

</body>
</html>