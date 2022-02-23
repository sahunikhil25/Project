
<%@page import="com.velociter.hms.database.HospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.velociter.hms.model.Patient"%>
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
    height: 338px;
    border: solid black 2px;
    width: 1087px;
    margin: -20px;
    padding-bottom: inherit;
     
     }
#patientbtn
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
<body  style="font-family:Futara" >
<center>
<h2 style="font-size:28px; color :brown";>Patient List</h2>
    
<br><br>
<div id="divtag">
     <table >
            <thead style="position:static; ">
               <tr>
                  <td style="width:200px"><b> NAME</b></td>
                  <td style="width:200px"><b>FIRST NAME</b></td>
                  <td style="width:200px"><b>LAST NAME</b></td>
                  <td style="width:200px"><b>MOBILE NO</b></td>
                  <td style="width:200px"><b>ADDRESS</b></td>
               
               </tr>
               </thead>
               <% 
               try
               {
            	 HospitalDAO hospitalDaoObject = new HospitalDAO();
            	 ArrayList<Patient>patientObject = new ArrayList<Patient>(hospitalDaoObject.getPatientList());
                 for( Patient patientList:patientObject)
                 {
                %>
               
               <tr>
                    <td><jsp:expression>patientList.getName()</jsp:expression></td>
                    <td><jsp:expression>patientList.getFirstName()</jsp:expression></td>
                    <td><jsp:expression>patientList.getLastName()</jsp:expression></td>
                    <td><jsp:expression>patientList.getMobileNumber()</jsp:expression></td>
                    <td><jsp:expression>patientList.getAddress()</jsp:expression></td>
                   
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
     
     <button type="submit" id="patientbtn" value="Create PDF" onclick="createPatientPDF()">Convert into Pdf</button>
     </center>
   
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
<script>
function createPatientPDF() {
    var pTable = document.getElementById('divtag').innerHTML;
    
    alert(pTable); 
    
    alert("create pdf fun running");
    var style = "<style>";
    style = style + "table {width: 100%;font: 17px Calibri;}";
    style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
    style = style + "padding: 3px 3px;text-align: center;}";
    style = style + "</style>";

    // CREATE A WINDOW OBJECT.
    //var win = window.open('', '', 'height=700,width=700');
    var time="17:13";
    
    var currentDate = new Date();
    var currentTime = currentDate.getHours() + ":" + currentDate.getMinutes();
    alert(currentTime);
    
    var time1='&time='+ time +'&currentTime=' + currentTime;
    if(time==currentTime)
    	{
    alert(time1);

    	//var text = document.getElementById("divtag").value;
    	alert(pTable);
    	
    	
        var filename = "Customer.txt";
        alert(filename);
        download(filename,pTable);
        document.close();
    	alert("Downloaded");
    	}
    
   
}
  function download(file, text) {
    alert("controal is comming in download method");
    //creating an invisible element
    var element = document.createElement('a');
    
    element.setAttribute('href', 
    'data:text/plain;charset=utf-8, '
    + encodeURIComponent(text));
    
    element.setAttribute('download', file);
  
    // Above code is equivalent to
    // <a href="path of file" download="file name">
  
    document.body.appendChild(element);
    
    
  
    //onClick property
    element.click();
    
   
  
    document.body.removeChild(element);
}

</script>
</html>



    
   
<!--    win.document.write('<html><head>');
    win.document.write('<title> Patient List</title>');   // <title> FOR PDF HEADER.
    win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
    win.document.write('</head>');
    win.document.write('<body>');
    win.document.write(pTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
    win.document.write('</body></html>');

    win.document.close(); 	// CLOSE THE CURRENT WINDOW.

    win.print();    // PRINT THE CONTENTS. */ -->

<!-- 
 <p>
         
         <input type="button" id="btn" 
                value="Download" />
                
         <script>
            function download(file, text) {
              
                //creating an invisible element
                var element = document.createElement('a');
                
                element.setAttribute('href', 
                'data:text/plain;charset=utf-8, '
                + encodeURIComponent(text));
                element.setAttribute('download', file);
              
                // Above code is equivalent to
                // <a href="path of file" download="file name">
              
                document.body.appendChild(element);
              
                //onClick property
                element.click();
              
                document.body.removeChild(element);
            }
              
            // Start file download.
            
            document.getElementById("btn")
            .addEventListener("click", function() {
                // Generate download of hello.txt 
                // file with some content
                var text = document.getElementById("text").value;
                var filename = "GFG.txt";
              
                download(filename, text);
            }, false);
         </script>
 -->

