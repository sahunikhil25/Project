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
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<%
String message=(String)request.getAttribute("adminLoginMsg");
%>
<h2><%=message %></h2>
<a href="<%=request.getContextPath()%>/showusers">Show Registered Users</a>
</body>
 <script type="text/javascript"> 
     /*    window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        }  */
        location.hash='#no-';
        if(location.hash == '#no-') {
            location.hash='#_';
            window.onhashchange=function() {
                if(location.hash == '#no-')
                    location.hash='#_';
            }
        }
    </script> 
</html>