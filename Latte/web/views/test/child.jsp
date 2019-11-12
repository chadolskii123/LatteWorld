<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
    <input type="text" id="cInput"> <input type="button" value="가져오기" onclick="getParentText()">
    <br>
    <input type="text" id="cInput2"> <input type="button" value="전달하기" onclick="setParentText()">
    <br>
    <input type="button" value="창닫기" onclick="window.close()">


	<script type="text/javascript">
        function getParentText(){
            document.getElementById("cInput").value = opener.document.getElementById("pInput").value;
        }
	
        function setParentText(){
            opener.document.getElementById("pInput2").value = document.getElementById("cInput2").value
       }
        
        $(document).ready(function(){
        	document.getElementById("cInput").value = opener.document.getElementById("pInput").value;
        });
   </script>
</body>
</html>