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
<h2  >User Registration </h2>
<br>
<form id="myForm" action="/UserHandle" method="post"  >
<label for="name">Name: </label>
    <input type="text" name="name"  required>
    <br>
    <label for="email">email: </label>
    <input type="email" name="email"  required>
    <br>
    <label for="MobileNumber">MobileNumber: </label>
    <input type="number" name ="mobileNumber" required>
    <br>
    <label for="address">Address: </label>
    <input type="text" name="address"  required>
  
  <input type="submit" value="Submit" id="btnsubmit" onclick="submitForm()" >
  <br>
<%
String message=(String)request.getAttribute("msg");
if(message!=null)
{%>
	
<h4 style=color:red><%=message%></h4>

<% }%>

  <br>
  <a>1</a><a href="<%=request.getContextPath()%>/booklogin">Apply For Book</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>2<a/>
  <a href="<%=request.getContextPath()%>/adminlogin">Admin login</a>
</form>



<%-- <script type="text/javascript">
function submitForm()
{
  <input id='hdn-total-count' type='hidden' value='<%=message%>' />
	 var msg =<%=request.getAttribute("msg")%>
	alert(msg);
}
</script>
</body>
 --%>
 <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
        
    </script>  
    
    <script>
    window.onload = function(){
    	 document.getElementById("myForm").reset();
    	 
    }
    </script>
</body>
</html>