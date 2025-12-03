<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
 
</head>
<body>

<h1> you are applying for book</h1>
 <form  action="/BookApply" method="post" autocomplete="off" id="emailform" >
    <label for="emil">Enter Email: </label>
    <input type="email" name ="email" required  >
    <br>
    <!-- <div id="hideform">
    <label for="otp">Enter OTP: </label>
    <input type="number" name="otp"  required>
    </div>
    <br> -->
  <input type="submit" value="Submit" id="buttonSubmit" onclick="submitForm()">
  <br>
  </form>
<!-- <form action="/otpGenrated" id="hideform" method ="post" >
<div >
    <label for="otp">Enter OTP: </label>
    <input type="number" name="otp"  required>
    </div>
  <input type="submit" value="Submit" id="buttonSubmit">
  
</form> -->
<script>	
window.onload = function(){ 
	// document.getElementById("hideform").style.visibility = "hidden";

} 
	/* function submitForm()
	{
		document.getElementById("hideform").style.visibility = "visible";
		
		 window.onload = function(){
			 document.getElementById("emailform").style.visibility = "hidden";
		 }
	} */
	
</script>
</body>

</html>