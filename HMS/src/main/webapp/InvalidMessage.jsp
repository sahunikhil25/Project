<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>InvalidEmail Page</title>
<style type="text/css">
.body
{
text-align:center;
margin-top:240px;
font-size:23px;
}
.img
{ 
width:80px; 
height:60px;
}

</style>
</head>
<body class="body">
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
<h2>Invalid Name and Password</h2>
<img class="img"src="exstyle/Images/Redmarklogo.png">
<div>
<a href="index.jsp">Go to home page</a>
</div>
</body>
</html>