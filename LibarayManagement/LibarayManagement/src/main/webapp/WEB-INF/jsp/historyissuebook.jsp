<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.BookIssue" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BooKIssueHistory</title>
</head>
<body>
<%
ArrayList<BookIssue>list=(ArrayList<BookIssue>)request.getAttribute("allbookissue");
%>

<table>
 <%
for(BookIssue s:list)
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
                      <th>Book:</th> 
                    <td><%=s.getBooks()%></td><br>
                     </tr>
                
 <%
}
 %>
 </table> 
</body>
</html>