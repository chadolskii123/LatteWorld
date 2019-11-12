<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>라떼는</title>
<style>


div{
	border : 3px solid black;
	margin : 5px;
}
#mainTop{
	width : 85%;
	height : 10%;
}
#mainTop *{
	display : inline-block;
}
#mainLeft{
	height : 80%;
	width : 15%;
	position : absolute;
	left : 0%;
}

#mainCenter{
	height : 80%;
	width : 70%;
	position : absolute;
	left : 15%;	
}
#mainCenter > div {
width : 99%;
}
#goodMessage{
	width : 98%;
	height : 30%;
}
#search{
width : 98%;
height : auto;
}
#search *{
	height : auto;
	display : inline;
}

#centerBottom {
height : 63%;
width : 98%;
}

#centerBottom * {
display : inline-block;
width : 40%;

}

#centerBottomLeft {
position : relative;
width : 48%;
height : 98%;
}

#todayNews{
width : 98%;
height : 48%;
}
#todayHomepage{
width : 98%;
height : 22%;
}
#todayMember{
width : 98%;
height : 22%;
}

#centerBottomRight{
position : relative;
width : 48%;
height : 98%;
top : -10%;
}
#centerBottomRight *{
display : block;
width : 98%;
height : 31%;
}
#goodMessageImg{
height : 220px;
width : 200px;
}
#leftMenuBar{
height : 65%;
}
#leftMenus{
height : 48%;
}
#addLeftMenus{
height : 48%;
}
#findZone{
position : relative;
height : 30%;
top : 35%;
}
#leftLogin{
height : 29%;
}
#join{
cursor : pointer;
}



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

</style>
</head>
<body>

<!-- 메인 탑 메뉴 -->
	<div id = "mainTop">
		<div id = "topLogo">
			<img id = "mainLogo" width = "80px" height = "80px" src = "${contextPath }/views/images/MainLogo.jpg" onclick = "location.href ='${contextPath}/views/common/mainPage.jsp'">
		</div>
		<div id = "topMenu">
			<span><span><a href="#" onClick="javascript:openWin()">미니홈피</a></span></span>
			<span><a>선물가게</a></span>
		</div>
		<div id = "topIcon"  style = "float : right"><input type = "button" value = "BGM 상점"></div>
	</div>
	
<!-- 메인 왼쪽 메뉴  -->
	<div id = "mainLeft">
		<div id = "leftLoginBox">
			| LATTE WORLD
		</div>
		
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
			<div id = "leftLogin">
				<img src="${contextPath }/views/images/pic1.jpg"height = "130px" width = "100px"><br>
				<label class="myNameBtn"> ${user.userName }
  					<div class="myName-content">
					    <a href="${contextPath }/MyMiniHomeServlet?">내 미니홈피</a>
					    <a href="#">일촌 보기</a>
					    <a href="#">신고하기</a>
				  	</div>
				</label>님 환영합니다 :)<br>
					<button onclick = "location.href='${contextPath}/MyPageServlet?userId=${user.userId}'">마이 페이지</button>
					<button onclick = "location.href='${contextPath}/LogoutServlet'">로그아웃</button>
			</div>
		</c:if>		
		<div id = "leftMenuBar">
			
			<div id = "leftMenus">
				<p>일촌 신청하기</p>
				<p>내 미니홈피</p>
				<p>내 일촌 보기</p>
				<p>공지사항</p>
				<p>고객센터</p>
			</div>
			<div id = "addLeftMenus">
				<p>여다가는 뭘 넣지</p>
				<p>뭘느까</p>
				<p>음음</p>
				<p>뭣을 너으까</p>			
			</div>
		</div>
	</div>
	
	<!-- 센타 부분 -->
	
	<div id = "mainCenter">
		<div id = "goodMessage">
		<img src = "${contextPath }/views/images/mainContent.jpg" height = "200px" width = "500px">
		</div>
	
		<div id = "search">
			<select id = "searchMenu">
				<option value = "all">전체검색</option>
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "writer">작성자</option>
			</select>
			<input style = "width : 350px" id = "searchContent" placeholder = "라떼는 이렇게 검색헀어...!">
			<button id = "searchBtn"> 찾 기 </button>
		</div>
		
		<div id = "centerBottom">
			<div id = "centerBottomLeft">
				<div id = "todayNews">라떼는 이런게 핫했다!</div>
				<div id = "todayHomepage">오늘의 홈페이지</div>
				<div id = "todayMember">오늘의 핫피플</div>
			</div>
			<div id = "centerBottomRight">
				<div id = "todayWriter">최고의 글</div>
				<div id = "purchase">선물가게</div>
				<div id = "events">이벤트</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
	function register(){
		location.href = "${contextPath}/views/common/userJoin.jsp";
	}
	
	/* function openWin(){  
	    window.open("${contextPath}/views/common/miniHome.jsp?userName=${user.userName }","${user.userName}님의 미니홈피", "width = 1300, height = 750, scroll = no, toolbar = no, menubar = yes, location = no, resizable = no");  
	}
	 */
	function openWin(){  
	    window.open("${contextPath}/MyMiniHomeServlet?userId=${user.userId }","${user.userName}님의 미니홈피", "width = 1300, height = 750, scroll = no, toolbar = no, menubar = yes, location = no, resizable = no");  
	} 
	
	</script>
</body>
</html>