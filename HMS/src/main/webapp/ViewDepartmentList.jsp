<%@page import="com.velociter.hms.database.HospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.velociter.hms.model.Department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.velociter.hms.database.Operation"%>
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
    width: 450px;
    margin: -20px;
    padding-bottom: inherit;
    
    }
#departmentbtn
{
    font-size: 20px;
    color: forestgreen;
    margin-top: 58px;
    font-weight: bold;

}    
</style> 

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="exstyle/style.css">
<title>Employee List</title>
</head>
<body  style="font-family:Futara">
<center>
<h2 style="font-size:28px; color :brown";>Department List</h2>
    
<br><br>
<div id="divtag">
     <table >
            <thead style="position:static;">
               <tr>
                  <td style="width:200px"><b> DEPARTMRNT NAME</b></td>
                  <td style="width:200px"><b>HEAD OF DEPARTMENT</b></td>
                 
               </tr>
               </thead>
               <% 
               try
               {
            	 HospitalDAO hospitalDaoObject = new HospitalDAO();
            	 ArrayList<Department>departmentObject = new ArrayList<Department>(hospitalDaoObject.getDepartmentList());
                 for(Department departmentList: departmentObject)
                 {
                %>
               
               <tr>
                    <td><jsp:expression>departmentList.getDepartmentName()</jsp:expression></td>
                    <td><jsp:expression>departmentList.getHeadOfDepartment()</jsp:expression></td>
                   
                   
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
     
      <button type="submit" id="departmentbtn" value="createDepartmentPDF"  onclick="createDepartmentPDF()">Convert into Pdf</button> 
       
     </center>
   
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
<script>
    function createDepartmentPDF
    () {
        var dTable = document.getElementById('divtag').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>Department List</title>');   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(dTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');

        win.document.close(); 	// CLOSE THE CURRENT WINDOW.

        win.print();    // PRINT THE CONTENTS.
    }
</script>
</html>