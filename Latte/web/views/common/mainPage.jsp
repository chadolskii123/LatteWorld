<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body > div{
border : 1px solid black;
}
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}
/* Style the top navigation bar */
.topnav {
	padding-left: 200px;
	padding-top: 50px;
	overflow: hidden;
	background-color: white;
	height: 144px;
	min-width : 1000px;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: white;
	color: black;
}
div#topMenu {
    height: 86px;
    width: 87%;
    min-width: 1000px;
}
/* Style the side navigation */
.sidenav {
    padding-left: 200px;
    padding-top : 4px;
    min-height: 759px;
    width: 420px;
    position: absolute;
    z-index: 0;
    left: 0;
    background-color: white;
    overflow-x: hidden;
}
/* Side navigation links */
.sidenav a {
	color: white;
	padding: 16px;
	text-decoration: none;
	display: block;
}

/* Change color on hover */
.sidenav a:hover {
	background-color: white;
	color: black;
}

/* Style the content */
.content {
    padding-left: 423px;
    padding-top: 4px;
    min-height: 759px;
    min-width : 1201px;
    width: 88.32%;
}
.content > *{
	min-width : 777px;
}
#topMenu *{
display : inline-block;
}
div#centerBottom {
    display: inline-flex;
    width : 100%;
} 
#centerBottom * {
border : 1px solid blue;
}
#centerBottomLeft *{
height : auto;
}
#centerBottomRight *{
height : 33%;
}
div#centerBottomLeft {
    width: 50%;
    height: 100%;
}
div#centerBottomRight {
    width: 50%;
    height: 100%;
}
#goodMessage *{
width : 50%;}
/* drop down 시작 */
.myName {
  position: relative;
  display: inline-block;
}
.myName-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.myName-content a {
  color: black;
  text-decoration: none;
  display: block;
}
.myName-content a:hover {background-color: #ddd;}

.myNameBtn:hover .myName-content {display: block;}
.footer {
  grid-area: footer;
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}
</style>
</head>
<body>
	<div class="topnav">
		<div id="topMenu">
			<img id="mainLogo" width="80px" height="80px" src="/LW/views/images/MainLogo.jpg" onclick="location.href ='/LW/views/common/mainPage.jsp'">
			<div id ="link"><a href="#"	onClick="javascript:openWin()">미니홈피</a><a>일촌 신청하기</a><a>선물가게</a></div>
			<input type="button" value="BGM 상점">
		</div>
	</div>

	<div class="sidenav">
		<div id="leftLoginBox">| LATTE WORLD</div>

		
		<c:if test="${empty sessionScope.user }">
			<div id = "leftLogin">
				<form action ="${contextPath }/LoginServlet" method = "post">
					<table>
						<tr>
							<td>이메일</td>
							<td><input type = "text" size = "10px" name = "userId"></td>
							<td rowspan = "2"><button>Login</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type = "password" size = "10px" name = "userPwd"></td>

						</tr>
					</table>
					<div id = "findZone">
						? <label id ="findIdPw">이메일 / 비밀번호 찾기</label><br>
						? <label id ="join" onclick = "register()">회원 가입하기</label>
					</div>
				</form>
			</div>
		</c:if>
		<c:if test = "${!empty sessionScope.user}">
			<div id="leftLogin">
				<img src="/LW/views/images/pic1.jpg" height="130px"
					width="100px"><br> <label class="myNameBtn">
					차영욱
					<div class="myName-content">
						<a href="#" onClick="javascript:openWin()">내 미니홈피</a> <a href="#">일촌
							보기</a> <a href="#">신고하기</a>
					</div>
				</label>님 환영합니다 :)<br>
				<button
					onclick="location.href='/LW/MyPageServlet?userId=promote7@naver.com'">마이
					페이지</button>
				<button onclick="location.href='/LW/LogoutServlet'">로그아웃</button>
			</div>
		</c:if>	
		
		<div id="leftMenuBar">
			<div id="leftMenus">
				<p>일촌 신청하기</p>
				<p>내 미니홈피</p>
				<p>내 일촌 보기</p>
				<p>공지사항</p>
				<p>고객센터</p>
			</div>
			<div id="addLeftMenus">
				<p>여다가는 뭘 넣지</p>
				<p>뭘느까</p>
				<p>음음</p>
				<p>뭣을 너으까</p>
			</div>
		</div>
	</div>

	<div class="content">
		<div id="goodMessage">
			<img src="/LW/views/images/mainContent.jpg"
				height="200px" width="500px">
		</div>

		<div id="search">
			<select id="searchMenu">
				<option value="all">전체검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input style="width: 350px" id="searchContent"
				placeholder="라떼는 이렇게 검색헀어...!">
			<button id="searchBtn">찾 기</button>
		</div>

		<div id="centerBottom">
			<div id="centerBottomLeft">
				<div id="todayNews">라떼는 이런게 핫했다!<br><br><br><br><br><br><br></div>
				<div id="todayHomepage">오늘의 홈페이지</div>
				<div id="todayMember">오늘의 핫피플</div>
			</div>
			<div id="centerBottomRight">
				<div id="todayWriter">최고의 글</div>
				<div id="purchase">선물가게</div>
				<div id="events">이벤트</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>Footer</p>
	</div>
	
	
	<script type="text/javascript">
	function register(){
		location.href = "/LW/views/common/userJoin.jsp";
	}
	 var openwin;
	function openWin(){  
	    openwin = window.open("/LW/MyMiniHomeServlet?userId=promote7@naver.com","차영욱님의 미니홈피", "width = 1300, height = 750, scroll = no, toolbar = no, menubar = yes, location = no, resizable = no");  
	} 
	
	</script>

</body>
</html>