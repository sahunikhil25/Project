<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="exstyle/style.css" rel="stylesheet">

<title>Header Page</title>
</head>

<body style="font-family: Futara">

	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>

	<div class="header">
		<div class="headerImage">
			<img style="height: 180px; width: 180px;"
				src="exstyle/Images/Apollo-Logo-300x211.jpg">
		</div>
		<p
			style="text-align: center; padding-left: 300px; float: left; font-size: 30px; padding-top: 40px;">
			<font size="7" color="red" face="Castellar">Hospital Management </font>
		</p>

	       <a href="Contactus.jsp"
			style="float: right; padding-right: 35px; padding-top: 140px; text-decoration: none; font-size: 20px; color: white;">Contact us</a>
	</div>
</body>
</html>