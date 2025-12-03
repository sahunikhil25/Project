<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<title>Insert title here</title>
</head>
<body>
<%
String message=(String)request.getAttribute("msg");
%>
<h2><%=message %></h2>
<a href="<%=request.getContextPath()%>/booklogin">Apply For Book</a>
</body>
</html>