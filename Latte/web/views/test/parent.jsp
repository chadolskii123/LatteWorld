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
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    <input type="button" value="자식창 열기" onclick="openChild()"><br>
    전달할 값 : <input type="text" id="pInput"><input type="button" value="전달" onclick="setChildText()">
    <br><br>
    받은 값 : <input type="text" id="pInput2">
    <script type="text/javascript">
    var openWin;
    function openChild(){
        // window.name = "부모창 이름"; 
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("child.jsp",
                "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
    }
    function setChildText(){
        openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
    } 
   </script>
</body>
</html>