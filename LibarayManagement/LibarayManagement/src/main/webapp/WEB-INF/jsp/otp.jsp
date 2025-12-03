<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
 <script type="text/javascript" src="js/index.js"></script>
</head>
<%
String email=(String)session.getAttribute("emailValue");
%>
<h1><%=email%></h1>
<body>
<form action="/otpGenrated" id="hideform" method ="post"  value="${name}" >
<div >
    <label for="otp">Enter OTP: </label>
    <input type="number" name="otp"  required>
    </div>
  <input type="submit" value="Submit" id="buttonSubmit">
</form>
     <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
    
    </script>  
</body>
</html>