<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>	   
	<jsp:forward page = "views/common/mainPage.jsp"/>
	<!-- 저장  -->
	
</body>
</html>