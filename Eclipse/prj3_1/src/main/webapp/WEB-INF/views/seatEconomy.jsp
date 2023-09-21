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
<p>이코노미석</p>
<form action="/prj3_1/booking.do" method="POST">
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="5A"></button>
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="5B"></button>
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="5C"></button>
<button type="button" onclick ="getSeat(this)" class="seatbtn" name="5D"></button>
<input type="hidden" id="fromData" name="fromData" value="">
<button type="submit"> 예약</button>
</form>
</body>
</html>