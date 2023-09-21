<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getSeat(button) {
    let seatNum = button.getAttribute('name');
    document.getElementById("fromData").value = seatNum;
}
</script>
</head>
<body>
<p>비즈니스석</p>
<form action="/prj3_1/booking.do" method="POST">
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="1A"></button>
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="1B"></button>
<input type="hidden" id="fromData" name="fromData" value="">
<button type="submit"> 예약</button>
</form>
</body>
</html>