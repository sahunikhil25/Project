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
<h2>Admin Login Details</h2>
<br>
<form action="/AdminHandler" method="post" autocomplete="off">
<label for="adminName">Name: </label>
    <input type="text" name="adminName" required>
    <br>
    <label for="Passwrod">Password: </label>
    <input type="password" name ="password" required>
    <br>
  <input type="submit" value="submit"/>
  <br>
  <%
String message=(String)request.getAttribute("adminLoginMsg");
%>
<%
if(message!=null)
{
%>
<h4 color="red"><%=message %></h4>
<%
}
%>
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