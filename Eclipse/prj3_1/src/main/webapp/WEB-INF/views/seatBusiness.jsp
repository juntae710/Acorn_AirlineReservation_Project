<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "prj3_1.Seat" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getSeat(button) {
    let seatNum = button.getAttribute('name');
    document.getElementById("fromData").value = seatNum;
}
function databtn(){
	let fromBtn = document.getElementById("fromData").value;
    if( fromBtn==""){
    	alert("좌석을 선택하세요.");
    	return false;
    }
    return true;
    
}
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("seat");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	  if(element.checked == true){
		let id = element.id;
		let fromBtn = document.getElementById("fromData");
		fromBtn.value=id;
	  }
	}
function databtn(){
	let fromBtn = document.getElementById("fromData").value;
    if( fromBtn==""){
    	alert("좌석을 선택하세요.");
    	return false;
    }
    return true;
    
}
</script>
<style>

*,*:before,*:after {
  box-sizing: border-box;
}
html {
  font-size: 16px;
}

.plane {
  margin: 20px auto;
  max-width: 300px;
  margin-top: 60px;
  background-color: white;
}

.cockpit {
  height: 250px; 
  position: relative;
  overflow: hidden;
  text-align: center;
  border-bottom: 5px solid #d8d8d8;
  margin-top: -37px;
  &:before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    height: 500px;
    width: 100%;
    border-radius: 50%;
    border-right: 5px solid #d8d8d8;
    border-left: 5px solid #d8d8d8;
  }
  h1 {
    width: 60%;
    margin: 100px auto 35px auto;
  }
}

.exit {
  position: relative;
  height: 50px;
  &:before,
  &:after {
    content: "EXIT";
    font-size: 14px;
    line-height: 18px;
    padding: 0px 2px;
    font-family: "Arial Narrow", Arial, sans-serif;
    display: block;
    position: absolute;
    background: green;
    color: white;
    top: 50%;
    transform: translate(0, -50%);
  }
  &:before {
    left: 0;
  }
  &:after {
    right: 0;
  }
}

.fuselage {
  border-right: 5px solid #d8d8d8;
  border-left: 5px solid #d8d8d8;
}

ol {
  list-style :none;
  padding: 0;
  margin: 0;
}

.row {
  
}

.seats {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;  
}

.seat {
  display: flex;
  flex: 0 0 20%;
  padding: 5px;
  position: relative;  
  &:nth-child(2) {
    margin-right: 25%;
  }
  label {    
    display: block;
    position: relative;    
    width: 100%;    
    text-align: center;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.5rem;
    padding: 4px 0;
    background: #F42536;
    border-radius: 5px;
    animation-duration: 300ms;
    animation-fill-mode: both;
    
    &:before {
      content: "";
      position: absolute;
      width: 75%;
      height: 75%;
      top: 1px;
      left: 50%;
      transform: translate(-50%, 0%);
      background: rgba(255,255,255,.4);
      border-radius: 3px;
    }
    &:hover {
      cursor: pointer;
      box-shadow: 0 0 0px 2px #5C6AFF;
    }
    
  }
}

@-webkit-keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }

  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
            transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
            transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
            transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    -webkit-transform: scale3d(.95, 1.05, 1);
            transform: scale3d(.95, 1.05, 1);
  }

  75% {
    -webkit-transform: scale3d(1.05, .95, 1);
            transform: scale3d(1.05, .95, 1);
  }

  100% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }
}

@keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }

  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
            transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
            transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
            transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    -webkit-transform: scale3d(.95, 1.05, 1);
            transform: scale3d(.95, 1.05, 1);
  }

  75% {
    -webkit-transform: scale3d(1.05, .95, 1);
            transform: scale3d(1.05, .95, 1);
  }

  100% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }
}

.rubberBand {
  -webkit-animation-name: rubberBand;
          animation-name: rubberBand;
}
.bg{
   background-image: url("./img/back.png");
    background-size: 100% 100%;
   }
   
   section {
	height:620px;
   padding-top: 30px;
}
   
.xoenfl {
border: 2px solid navy; 
width: 1000px;
height: 500px;
background-color: white;
border-radius:30px; 
margin: 0 auto;
margin-top: 40px;
}
.plane h2 {
text-align: center;
margin-top: -50px;
margin-bottom: 25px; 
}
.xoenfl {
border: 2px solid navy; 
width: 1000px;
height: 500px;
background-color: white;
border-radius:30px; 
margin: 0 auto;
margin-top: 40px;
}
   .whktjr {
	background-color: #B8E9FF;
	height: 30px;
	width: 100px;
	border-radius: 20px;
	border: none;
	margin-top: 10px;
	font-weight: bolder;
	background-color: #B8E6E1;
	color: black;
	border: 1px solid gray; /* 테두리 색상 추가 */
	margin-left: 105px;
}
</style>
</head>
<body>
<header>
			<div class="headerimg">
					   <a href="/prj3_1/index.do"><img alt="이미지" src="<%=request.getContextPath()%>/img/acornairport.png"></a>
			</div>

			<%
			String id = (String) session.getAttribute("id");
			%>

			<div class="headerAtag">
				<%
				if (id == null) {
				%>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/h_login">로그인</a>
				</div>
				<%

				%>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/l_join">회원가입</a>
				</div>
				<%
				} else {
				%>
				<div class="idview">
					<p>
						
						환영합니다 [<%=id%>]님  ฅʕ•o•ʔฅ
					</p>
				</div>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/h_logOut">로그아웃</a>
				</div>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/smain">마이페이지</a>
				</div>

				<%
				}
				%>
			</div>

		</header>
		<section class="bg">
<%
ArrayList<Seat> BSNList = (ArrayList<Seat>)session.getAttribute("BSN");
ArrayList<Seat> line1 = new ArrayList<>();
ArrayList<Seat> line2 = new ArrayList<>();
for(int i=0; i<BSNList.size(); i++){
	if(BSNList.get(i).getSeatline()==1){
		line1.add(BSNList.get(i));
	}
	else if(BSNList.get(i).getSeatline()==2){
		line2.add(BSNList.get(i));
	}
}
%>
<div class="xoenfl">
<div class="plane">
  <div class="cockpit">
    <h1>비즈니스석</h1>
  </div>
  <div class="exit exit--front fuselage">
    
  </div>
  <ol class="cabin fuselage">
       <li class="row row--1">
      <ol class="seats" type="A">
       <% for(int i=0; i<line1.size(); i++){ %>
       <%    if(line1.get(i).getSeatstate()==0){ %>
              <li class="seat">
		          <input type="checkbox" id="<%=line1.get(i).getSeatnum() %>" name="seat" onclick="checkOnlyOne(this)" />
		          <label for="<%=line1.get(i).getSeatnum() %>"><%=line1.get(i).getSeatnum() %></label>
		       </li>
        <%}else{ %>
             <li class="seat">
		          <input type="checkbox" id="<%=line1.get(i).getSeatnum() %>" disabled name="seat" />
		          <label for="<%=line1.get(i).getSeatnum() %>"><b>X</b></label>
		     </li>
        <%} }%>
      </ol>
    </li>
    <li class="row row--2">
      <ol class="seats" type="A">
         <% for(int i=0; i<line2.size(); i++){ %>
       <%    if(line2.get(i).getSeatstate()==0){ %>
              <li class="seat">
		          <input type="checkbox" id="<%=line2.get(i).getSeatnum() %>" name="seat" onclick="checkOnlyOne(this)" />
		          <label for="<%=line2.get(i).getSeatnum() %>"><%=line2.get(i).getSeatnum() %></label>
		       </li>
        <%}else{ %>
             <li class="seat">
		          <input type="checkbox" id="<%=line2.get(i).getSeatnum() %>" disabled name="seat" />
		          <label for="<%=line2.get(i).getSeatnum() %>"><b>X</b></label>
		     </li>
        <%} }%>
      </ol>
    </li>
     
    
    
  </ol>
  <div class="exit exit--back fuselage">
    
  </div>
  <div class="formItem">
     <div class="btnItem">
		     <form action="/prj3_1/booking.do" method="POST">
		     <input type="hidden" id="fromData" name="fromData" value="">
		     <button class="whktjr" onclick="return databtn()" type="submit">좌석예약</button>
	     </form>
     </div>
  </div>
</div>
</div>
</section>
		<footer>
					<div class="footer_info">
						<br>(주) 에이콘항공 <br> <br> 주소)서울 마포구 양화로 122 3층, 4층 <br>
						<br> 조장) 표준태 / 부조장) 이윤정 / 조원) 문나정 서예진 허재혁 <br> <br>
						통신판매업신고) 마포 제 17-3587 / 개인정보보호책임자) 이윤정 에이콘항공 부조장
					</div>
					<div class="footer_img">
						<img alt="이미지"
							src="<%=request.getContextPath()%>/img/acornairport.png">
					</div>
				</footer>
</body>
</html>