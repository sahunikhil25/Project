<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="Header.jsp"></jsp:include>

<style type="text/css">


 
 .div1
{
   /*  <!-- text-align: center;
    inline-size: auto;
    margin-top: 27px; */
    inline-size: inherit;
    padding-top: 30px;

}

.div2
{
 inline-size: inherit;
    padding-top: 30px;
    color: red;
   
}
.div3
{
   
    inline-size: inherit;
    padding-top: 30px;
    background: content-box;
   color: red;

}
.div4
{
 inline-size: inherit;
    padding-top: 30px;
}
.div5
{
 inline-size: inherit;
    padding-top: 30px;
}
#showDetails
{
inline-size: 274px;
font-size:19px;
color: 'red';
margin-left: 524px;
/* margin-bottom:300px; */
color:red;
}

element.style {
    margin-left: 562px;
    margin-top: 55px;
   
}







</style>

</head>

<body>
<div >
			<div id="showDetails">
				
					<div class="div1">
						
						<tr>
					  <td><a href="ViewDoctorList.jsp" id="" style="color:red;">View Doctor List</a></td>
				      </tr>
						
					</div>
					
					
					<div class="div2" >
						
						<tr>
					   <td><a href="ViewNurseList.jsp" id="" style="color:red;">View Nurse List</a></td>
				       </tr>
				       			
					</div>
			
			         <div class="div3">
			         
						<tr>
					    <td><a href="PatientList.jsp" id="" style="color:red;">View Patient List</a></td>
			          	</tr>
						
					</div>
					
					 <div class="div4">
			         
						<tr>
					    <td><a href="ViewDepartmentList.jsp" id="department" style="color:red;">View Department List</a></td>
			          	</tr>
						
					</div>
					 <div class="div5">
			         
						<tr>
					    <td><a href="ViewEmployeeList.jsp" id="employee" style="color:red;">View Employee List</a></td>
			          	</tr>
						
					</div>
				<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>