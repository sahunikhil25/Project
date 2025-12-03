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
<body>
<form id="myForm" action="/bookissuehandler" method="post"  >
<label for="name">Name: </label>
    <input type="text" name="name"  required>
    <br>
    <label for="email">email: </label>
    <input type="email" name="email"  required>
    <br>
    <label for="MobileNumber">MobileNumber: </label>
    <input type="number" name ="mobileNumber" required>
    <br>
     <label for="selectbook">Choose Book: </label>
    <select name="books" id="cars">
    <option value="java">Java</option>
    <option value="Python">Python</option>
    <option value="C">C</option>
    <option value="C++">C++</option>
    <option value="Data Structure">Data Structure</option>
  </select>
  <br>
  <input type="submit" value="Submit" id="btnsubmit" onclick="submitForm()" >
  <br>
  </form>
    <script>
    window.onload = function(){
    	 document.getElementById("myForm").reset();
    	 
    }
    </script>
</body>
</html>