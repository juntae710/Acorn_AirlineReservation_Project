<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

    .bookingitem{
       height: 300px;
       margin: 0 auto;
       width: 500px;
       border: 1px solid black;
    }
    .departure{
       height: 300px;
       margin: 0 auto;
       width: 300px;
       border: 1px solid black;
       display: none;
    }
    .selectdate{
       height: 300px;
       margin: 0 auto;
       width: 300px;
       border: 1px solid black;
       display: none;
    }
    .selectitem{
       height: 300px;
       margin: 0 auto;
       width: 500px;
       border: 1px solid black;
       display: block;
    }
    .btn{
       width: 500px;
       border: 1px solid black;
       height: 50px;
       display: flex;
    }
    .book{
       width: 250px;
       border: 1px solid black;
    }
    .select{
       width: 250px;
       border: 1px solid black;
    }
</style>
<script>
	
	
	function send(buttonId){
	    $('.departure').css("display","block");
	    $.ajax({
	        type:"post",
	        dataType:"json",
	        url:"/prj_airline/index.do",
	        success: function(data){
	        	console.log(data);
	            $("#departureList").empty(); 
	            $.each(data, function(index, item) {
	                $("#departureList").append('<span style="cursor: pointer;" onclick="select(\'' + buttonId + '\', this);">'+ item.code + " - " + item.city +" - " + item.country +" - " + item.cotinet + "</span><br>");
	                
	            });
	
	        },
	        error: function(err){
	        	
	            console.log(err);
	        }
	    });
	  
	}
	
	function select(buttonId, target){
		let selected = document.getElementById(buttonId);
		selected.value  = target.innerText;
		selected.innerText = selected.value
		if(buttonId == "fromBtn"){
		    document.getElementById("fromData").value = target.innerText;
	    }
	    else if(buttonId == "toBtn"){
	    	document.getElementById("toData").value = target.innerText;
	    }
		alert(selected.value)
	    $('.departure').css("display","none");
	}

	function selectDate(){
		$('.selectdate').css("display","block");
		let now_utc = Date.now()
		let timeOff = new Date().getTimezoneOffset()*60000;
		let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("Date").setAttribute("min", today);
		
	    $('#Date').change(function (){
	        let date = $('#Date').val();
	        $('#dateBtn').text(date);
	        $('.selectdate').css("display","none");
	    });
	    
	}
	function databtn(){
		let date = $('#Date').val();
		let fromBtn = document.getElementById("fromBtn").value;
        let toBtn = document.getElementById("toBtn").value;
        if( date=="" || fromBtn=="" || toBtn==""){
        	alert("입력되지 않은 정보가 있습니다.");
        	return false;
        }
        return true;
	    
}
   
</script>
</head>
<body>
<div class="bookingitem">
   <div class="btn">
     <button class="book" >예매</button>
     <button class="select">조회</button>
   </div>
   <div class="selectall"> <!-- 선택창 -->
      <div class="point"><!-- 출발지와 목적지 -->
         <form name="frm" action="flight.do" method="post" charset="utf-8">
            <input type="hidden" id="fromData" name="fromData" value="">
            <input type="hidden" id="toData" name="toData" value="">
	        <button onclick="send('fromBtn')" id="fromBtn" type="button">From</button>
			<button onclick="send('toBtn')"  id="toBtn" type="button">To</button>
	      </div>
	      <div> <!-- 출발일, 좌석등급, 검색 버튼 구성 -->
	        <div><!-- 왕복과 편도 버튼 구성 -->
	          <button>왕복</button>
	          <button>편도</button>
	        </div>
	        <div> <!-- 출발일, 좌석등급, 검색 버튼 -->
	          <div> <!-- 출발일 선택 -->
	            <p>출발일</p>
	            <button id="dateBtn" onclick="selectDate()"  type="button">가는날 ~ 오는날</button>
	          </div>
	          <div> <!-- 좌석등급 -->
	            <p>좌석등급</p>
	            <button type="button">선택하세요</button>
	          </div>
	          <div> <!-- 항공편 조회 버튼 -->
	            <button onclick="return databtn()" type="submit">항공편 검색</button>
         
          </div>
        </div>
      </div>
   </div>
  
</div>

<div class="departure">
   <div>
     <input type="text" id="airportText">
   </div>
  
   <div id="departureList">
   </div>
   
</div>
<div class="selectdate">
	<input type="date" id="Date" name="dateData">
</div>
<div class="flightclass">
	
</div>
</form>

<!--  
<div class="selectitem">
   <div class="btn">
     <button class="book">예매</button>
     <button class="select" >조회</button>
   </div>
  
    <input type="date" id="Date">
</div>
-->

    
</script>
</body>
</html>