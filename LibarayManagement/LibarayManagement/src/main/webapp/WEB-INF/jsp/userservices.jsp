<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<ul>
   <li class="toggle1">
    <a href="<%=request.getContextPath()%>/bookissue">Request for book issue</a>
   </li>
   <li class="toggle2">
        <a href="<%=request.getContextPath()%>/returnbook">Request for return book</a>
   </li>
   <li class="toggle2">
      <a href="<%=request.getContextPath()%>/historyissuebook">History for book issue</a>
   </li>
   <li class="toggle2">
      <a href="<%=request.getContextPath()%>/historyreturnbook">History for return book</a>
   </li>
</ul>
</div>
</body>
</html>