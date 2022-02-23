<%@page import="com.velociter.hms.database.HospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.velociter.hms.model.Employee"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.velociter.hms.database.HospitalDAO"%>
<%@ page import="java.util.ArrayList"%>

<jsp:scriptlet>
String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}
</jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<style>
th,td
{
padding: 10px;
        border: 1px solid black;
        border-collapse: collapse;
}  
#divtag {
    
    overflow-y: auto;
    height: 379px;
    border: solid black 2px;
    width: 1067px;
    margin: -20px;
    padding-bottom: inherit;
    position: static;    
    }
</style> 
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="exstyle/style.css">
<title>Nurse List</title>
</head>
<body  style="font-family:Futara">
<center>
<h2 style="font-size:28px; color :brown";>Nurse List</h2>
    
<br><br>
<div id="divtag">
     <table >
            <thead style="position:static;">
               <tr>
                  <td style="width:200px"><b>EMPLOYEE NAME</b></td>
                  <td style="width:200px"><b>SSN NO</b></td>
                  <td style="width:200px"><b>JOIN DATE</b></td>
                  <td style="width:200px"><b>DESIGNATION</b></td>
                  <td style="width:200px"><b>SPECIALTIES</b></td>
               
               </tr>
               </thead>
               <% 
               try
               {
            	 HospitalDAO hospitalDaoObject = new HospitalDAO();
            	 ArrayList<Employee>employeeObj = new ArrayList<Employee>(hospitalDaoObject.getNurseList());
                 for( Employee nurseList:employeeObj)
                 {
                %>
               
               <tr>
                    <td><jsp:expression>nurseList.getEmployeeName()</jsp:expression></td>
                    <td><jsp:expression>nurseList.getSsn()</jsp:expression></td>
                    <td><jsp:expression>nurseList.getJoinDate()</jsp:expression></td>
                    <td><jsp:expression>nurseList.getDesignation().getDesignationName()</jsp:expression></td>
                    <td><jsp:expression>nurseList.getSpecialties().getSpecialityName()</jsp:expression></td>
                    
               </tr>
               <jsp:scriptlet>
               
                  }
               }
               catch(Exception e)
               {
            	  e.printStackTrace() ;
               }
            	  </jsp:scriptlet>     
     </table>
     </div>
     <br><br>
   
     </center>
   
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="Footer.jsp"></jsp:include>
    
</body>

</html>

