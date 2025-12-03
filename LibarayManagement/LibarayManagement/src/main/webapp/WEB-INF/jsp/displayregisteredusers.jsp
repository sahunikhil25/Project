<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<User>list=(ArrayList<User>)request.getAttribute("ul");

%>

<table>
 <%
for(User s:list)
{
%> 
                   <tr>
                   <th>Name:</th>
                    <td><%=s.getName()%></td>
                    </tr>
                <tr>
                    
                     <th>MobileNumber:</th>  
                    <td><%=s.getMobileNumber() %></td>
                 </tr>
                 
                 <tr> 
                  <th>Email:</th>  
                     <td><%=s.getEmail() %></td>
                    </tr>
                    
                     <tr>
                      <th>Address:</th> 
                    <td><%=s.getAddress() %></td><br>
                     </tr>
                
 <%
}
 %>
 </table> 

</body>
</html>