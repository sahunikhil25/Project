
<%@page import="java.util.ArrayList"%>
<%@page import="com.velociter.hms.database.HospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.velociter.hms.model.Patient"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.velociter.hms.database.Operation"%>
<%@page import="com.velociter.hms.model.Employee"%>

<jsp:scriptlet>String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}</jsp:scriptlet>

<%
HospitalDAO employeeDaoObject = new HospitalDAO();
session.setAttribute("DesList", employeeDaoObject.getDesignationNames());
%>

<%
HospitalDAO employeeDaoObj = new HospitalDAO();
session.setAttribute("SpecialtiesList", employeeDaoObj.getSpecialtiesNames());
%>
<%
HospitalDAO appointmentDaoObj = new HospitalDAO();
session.setAttribute("DoctorList", appointmentDaoObj.getDoctorNames());
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="exstyle/pagestyle.css" rel="stylesheet">

<title>Welcome Page</title>

<script src="js/JsProperties.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-color: #f1f1f1;
	margin: 8px;
	height: 100vh;
	overflow-y: scroll;
	overflow-x: hidden; /* hides the horizontal scroll bar */
}

* {
	box-sizing: border-box;
}

.row {
	height: 100vh;
}

.column {
	float: left;
	padding: 10px;
	height: 100vh; /* Should be removed. Only for demonstration */
}

.left {
	width: 20%;
	border-right: 2px solid #000;
	/* //background-color: #aaa; */
}

.right {
	width: 80%;
	/* background-color: #bbb; */
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.row .column table tr {
	margin: 70px 55px;
	padding: -13px;
	font-size: 18px;
	bottom-border: 19px;
	text-decoration: none;
}

.row .column table {
	margin: 3px -11px;
	margin-left: 20px;
}

.row .column table td {
	padding: 8px;
	border-bottom: groove;
}

.row .column table td a {
	text-decoration: none;
	font-size: 20px;
	padding: 30px;
	/* color: #000; */
}

/*---------------*/
* {
	box-sizing: border-box;
}

.row-1 {
	margin: 57px 68px;
}
/* Create three equal columns that floats next to each other */
.column-1 {
	float: left;
	width: 26.33%;
	padding: 10px;
	border: 1px solid #000;
	margin: 31px;
	height: 154px; /* Should be removed. Only for demonstration */
	box-shadow: inset 0 -3em 3em rgba(0, 0, 0, 0.1), 0 0 0 2px
		rgb(255, 255, 255), 0.3em 0.3em 1em rgba(0, 0, 0, 0.3);
}

/* Clear floats after the columns */
.row-1:after {
	content: "";
	display: table;
	clear: both;
}

.row-2 {
	margin: 57px 68px;
}
/* Create three equal columns that floats next to each other */
.column-2 {
	float: left;
	width: 26.33%;
	padding: 10px;
	border: 1px solid #000;
	margin: 31px;
	height: 154px; /* Should be removed. Only for demonstration */
	box-shadow: inset 0 -3em 3em rgba(0, 0, 0, 0.1), 0 0 0 2px
		rgb(255, 255, 255), 0.3em 0.3em 1em rgba(0, 0, 0, 0.3);
}

/* Clear floats after the columns */
.row-2:after {
	content: "";
	display: table;
	clear: both;
}

#employeecard {
	width: 728px;
	margin-left: 180px;
	background-color: white;
	background-clip: border-box;
	border: 1px solid;
	padding-right: 49px;
	margin-bottom: 180px;
	height: max-content;
	scroll-margin-bottom: 200px;
}

#showEmployee {
	margin: auto;
	font-size: 1rem;
	font-weight: 700;
	line-height: 1.8;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
<body style="font-family: Futara;">
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<div class="row">
		<div class="column left">
			<table>
				<!-- 	<tr>
					<td><a href="#" id="adddoctor">Add Doctor</a></td>
				</tr>
				<tr>
					<td><a href="#" id="addnurse">Add Nurse</a></td>
				</tr> -->

				<tr>
					<td><a href="#" id="addpatient">Add Patient</a></td>
				</tr>

				<tr>
					<td><a href="#" id="department">Add Department</a></td>
				</tr>

				<tr>
					<td><a href="#" id="employee">Add Employee</a></td>
				</tr>

				<tr>
					<td><a href="#" id="appointment">Add Appointment</a></td>
				</tr>

				<tr>
					<td><a href="ViewDetails.jsp" id="viewDetails">View
							Details</a></td>
				</tr>

			</table>
		</div>
		<div class="column right" id="number">
			<div id="numberDetails">
				<h4 style="margin-left: 860px; color: red;">
					Welcome:<%=session.getAttribute("name")%></h4>


				<div class="row-1">
					<div style="text-align: center; background-color: silver;"
						class="column-1">

						<h4><%=Operation.totalDoctor()%></h4>
						<h4>Total No. of Doctor</h4>
					</div>
					<div style="text-align: center; background-color: white;"
						class="column-1">
						<h4><%=Operation.totalNurse()%></h4>
						<h4>Total No. of Nurse</h4>
					</div>
					<div style="text-align: center; background-color: pink;"
						class="column-1">
						<h4><%=Operation.totalPatient()%></h4>
						<h4>Total No.of Patient</h4>
					</div>
				</div>
				<div class="row-2">
					<div style="text-align: center; background-color: grey"
						; class="column-2">
						<h4>0</h4>
						<h4>
							<p>Today appoinment</p>
						</h4>
					</div>
					<div style="text-align: center; background-color: lightblue;"
						class="column-2">
						<h4>0</h4>
						<h4>
							<p>Total No. of appointment</p>
						</h4>
					</div>

				</div>
			</div>



			<!--------------------Add Doctor---------------------->
			<%-- <div id="showDoctor">
				<h1>Add Doctor</h1>
				<div class="card" id="doctorcard">
					<div class="card-body">

						<form style="margin-top: 2px;" class="col-lg-5 offset-lg-4 "
							action="" method="POST" name="form1" id="Form1"
							onsubmit="return validateDoctor()">


							<div class="form-group">
								<label for="name">Full Name<span class="required-field">:</span></label>
								<input type="text" class="form-control" placeholder="Full Name"
									name="name3" id="name3" required>
							</div>

							<div class="form-group">
								<label for="position">Position<span
									class="required-field">:</span></label> <input type="text"
									class="form-control" placeholder="Enter position"
									name="doctorposition" id="doctorposition" required>

							</div>

							<div class="form-group">
								<label for="Select Specialties">Select Specialties<span
									class="required-field">:</span></label> <select name="doctorspecialties" id="doctorspecialties"
									required>
									<option value="">Select Specialties</option>
									<%
									List<String> list = Operation.getSpecialties().list();
									for (String doctor : list) {
//use jstl 									%>
									<option>
										<%=doctor%>
									</option>
									<%
									}
									%>
								</select>


							</div>


							<div class="form-group">
								<label for="ssn">SSN*(9-digits)<span
									class="required-field">:</span></label> <input type="number"
									class="form-control" placeholder="Enter ssn(123456789)"
									name="ssn3" id="ssn3" required>
							</div>
							<div class="form-group">
								<p>
									<label for="join date">Join date:</label> <input type="date"
										placeholder="join date" oninput="this.className = ''"
										id="doctorjoindate" name="doctorjoindate" required>
								</p>
							</div>


							<div style="overflow: auto;">
								<div
									style="float: center; decoration: none; text-align: center;">
									<button type="submit" id="doctorButton">Submit</button>

								</div>

							</div>


						</form>

					</div>
				</div>
			</div>
			<!--------------------Add Nurse---------------------->

			<div id="showNurse">
				<h1>Add Nurse</h1>
				<div class="card" id="nursecard">
					<div class="card-body">

						<form class="col-lg-5 offset-lg-4 " style="margin-top: -22px;"
							action="" method="POST" name="form1" id="form1"
							onsubmit="return validateNurse()">



							<div class="form-group">
								<label for="name">Full Name<span class="required-field">:</span></label>
								<input type="text" class="form-control" placeholder="Full Name"
									name="name2" id="name2" required>
							</div>

							<div class="form-group">
								<label"position">Position<span class="required-field">:</span></label>
								<input type="text" class="form-control"
									placeholder="Enter position" name="position2" id="position2"
									required>
							</div>



							Registerd:
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault2" value="yes"
									checked /> <label class="form-check-label"
									for="flexRadioDefault2">Yes</label>
							</div>
							<!-- Default checked radio -->
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault1" value="no" /> <label
									class="form-check-label" for="flexRadioDefault1">No</label>
							</div>

							<div class="form-group">
								<label for="ssn">SSN*(9-digits)<span
									class="required-field">:</span></label> <input type="number"
									class="form-control" placeholder="Enter ssn(123456789) "
									name="ssn2" id="ssn2" required>
							</div>
							<div>
								<label for="join date">Joining date<span
									class="required-field">:</span></label> <input type="date"
									class="form-control" placeholder="join date" id="joindate2"
									name="joindate2" required>
							</div>
                               

							<div style="overflow: auto;">
								<div 
									style="float: center; decoration: none; text-align: center;">
									<button type="submit" id="nursebutton">Submit</button>

								</div>

							</div>

						</form>

					</div>
				</div>
			</div>

 --%>
			<!-------------------------Add Employee ---------------------------->

			<div id="showEmployee">
				<h1>Add Employee</h1>
				<div class="card" id="employeecard">
					<div class="card-body">
						<div>
							<input type="hidden" name="d_Id" id="d_Id" />
						</div>
						<div>
							<input type="hidden" name="specialityId" id="specialityId" />
						</div>
						<form style="margin-top: 2px;" class="col-lg-5 offset-lg-4 "
							action="" method="POST" name="employeeform" id="employeeform"
							onsubmit="return validateEmployee()">


							<div class="form-group">
						
								<label for="name">Full Name<span class="required-field">:</span></label>
								<input type="text" class="form-control" placeholder="Full Name"
									name="name" id="name" required>
							</div>

							<div class="form-group">
								<label for="Designation">Select Designation<span
									class="required-field">:</span></label> <select name="designation"
									id="designation" required>
									<option value="">Select Designation</option>
									 <c:forEach items="${DesList}" var="des">
										<option value="${des.designationId}">${des.designationName}<br>
										</option>
									</c:forEach>
									<%-- <%
									List<String> list1 = Operation.getDesignation().list();
									for (String designation : list1) {
									%>
									<option value="<%=designationId %>">
										<%=designation%>
									</option>
									<%
									}
									%> --%>

								</select>

							</div>

							<div class="form-group">
								<label for="Select Specialties" id="labelspecialties">Select
									Specialties<span class="required-field">:</span>
								</label> <select name="specialties" id="specialties" required>
									<option value="">Select Specialties</option>
									<c:forEach items="${SpecialtiesList}" var="spes">
										<option value="${spes.specialityId}">${spes.specialityName}<br>
										</option>
									</c:forEach>
									<%-- 	<%
									List<String> list = Operation.getSpecialties().list();
									for (String doctor : list) {
									%>
									<option>
										<%=doctor%>
									</option>
									<%
									}
									%> --%>
								</select>
							</div>
							<div class="form-group">
								<label for="ssn">SSN*(9-digits)<span
									class="required-field">:</span></label> <input type="number"
									class="form-control" placeholder="Enter ssn(123456789)"
									name="ssn" id="ssn" onkeypress="return validate(event)"
									required>
							</div>
							<div class="form-group">
								<p>
									<label for="join date">Join date:</label> <input type="date"
										placeholder="join date" oninput="this.className = ''"
										id="joindate" name="joindate" required>
								</p>
							</div>
							<div style="overflow: auto;">
								<div
									style="float: center; decoration: none; text-align: center;">
									<button type="submit" id="addButton">Submit</button>
									<span id="success"></span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!--------------------Add Patient---------------------->


			<div id="showPatient">
				<h1 style="margin-left: 450px;">Add patient</h1>
				<div class="card" id="patientcard">
					<div class="card-body">
						<form class="col-lg-5 offset-lg-4 " action="" method="POST"
							name="myform1" id="myform1" onsubmit="return validatePatient()">


							<div class="form-group class="rowjustify-content-center"">
								<label for="name"> Name<span class="required-field">:</span></label>
								<input type="text" class="form-control" placeholder="Full Name"
									name="patientname" id="patientname" required>
							</div>

							<div class="form-group">
								<label for="Address">Address<span class="required-field">:</span></label>
								<textarea rows="3" cols="45" name="address" id="address"
									required>
         
         </textarea>
							</div>

							<div class="form-group">
								<label for="mobile no">Mobile No<span
									class="required-field">:</span></label> <input type="number"
									class="form-control" placeholder="Enter mobile No "
									name="mobilenumber" id="mobilenumber"
									onkeypress="return validateMobile(event)" required>

							</div>



							<div style="overflow: auto;">
								<div
									style="float: center; decoration: none; text-align: center;">
									<button type="submit" id="patientButton">Submit</button>
									<span id="successPatient"></span>

								</div>

							</div>

						</form>
					</div>
				</div>
			</div>


			<!--------------------Department---------------------->

			<div id="showDepartment">
				<h1 id="h1">Department</h1>
				<div class="card" id="card1">
					<div class="card-body">
						<form class="col-lg-5 offset-lg-4 " action="" method="POST"
							name="departmentform" id="departmentform"
							onsubmit=" return validateDepartment()">



							<div class="form-group">
								<label for="DepartmentName"> Department Name<span
									class="required-field">:</span></label> <input type="text"
									class="form-control" placeholder="Enter department name"
									name="departmentname" id="departmentname" required>
							</div>

							<div class="form-group ">
								<label for="HeadOfDepartment"> Head Of Department<span
									class="required-field">:</span></label> <input type="text"
									class="form-control" placeholder="Enter head of department"
									name="headofdepartment" id="headofdepartment" required>
							</div>
							<div style="overflow: auto;">
								<div
									style="float: center; decoration: none; text-align: center;">
									<button id="departmentButton" type="submit">Submit</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>

			<!--------------------Appointment---------------------->

			<div id="showAppointment">
				<h1>Add Appointment</h1>
				<div class="card" id="appointmentcard">
					<div class="card-body">

    					   <div>
							<input type="hidden" name="empId" id="empId"/>
						  </div>
						
						<form style="margin-top: 2px;" class="col-lg-5 offset-lg-4 "
							action="" method="POST" name="appointmentform"
							id="appointmentform" onsubmit="return validateAppointment()">

							<div class="form-group">
								<label for="Patient Name">Patient Name<span
									class="required-field">:</span></label> <input type="text"
									class="form-control" placeholder="Patient Name"
									name="patientappointmentname" id="patientappointmentname"
									required>


							</div>
							<div class="form-group">
								<label for="mobile no">Mobile No<span
									class="required-field">:</span></label> <input type="number"
									class="form-control" placeholder="Enter mobile No "
									name="appointmentmobilenumber" id="appointmentmobilenumber"
									onkeypress="return validateAppointmentMobile(event)" required>
							</div>

							<div class="form-group">
								<label for="name">City<span class="required-field">:</span></label>
								<input type="text" class="form-control" placeholder="City Name"
									name="cityname" id="cityname" required>

							</div>


							<div class="form-group">
								<label for="position">Select Doctor<span
									class="required-field">:</span></label> <select name="doctorname"
									id="doctorname" required>
									 <option value="">Select Doctor</option>
				 			        <%--   <c:forEach items="${DoctorList}" var="doc">
										<option value="${Integer.parseInt(doc.employeeId)}">${doc.employeeName}<br>
										</option>
									</c:forEach> --%>
								
								   <c:forEach items="${DoctorList}" var="doc">
									<option value="${doc.employeeId}">${doc.employeeName} <br>
									<option hidden id="docdate"  value="${doc.employeeId}">${doc.joinDate} <br>
									 
									</option>
									</c:forEach>
								
                                    
                                     

                                   <%--  <%
									HospitalDAO  hospitalDaoObj = new HospitalDAO();
									List<Employee>employeeObj= new ArrayList<Employee>(hospitalDaoObj.getDoctorList());
					                for( Employee doctorList:employeeObj){
									%>
									<option>
										<%=doctorList.getEmployeeName()%>
									</option >
									
										<option id="empId" name="empId">
										<%=doctorList.getEmployeeId()%>
									</option>
									<%
									}
									%> --%>

								</select>

							</div>

							<div class="form-group">
								<p>
									<label for="join date">Appointment date:</label> <input
										type="date" placeholder="appointment date"
										oninput="this.className =''" id="appointmentdate"
										name="appointmentdate" required>
								</p>
							</div>

							<div style="overflow: auto;">
								<div
									style="float: center; decoration: none; text-align: center;">
									<button type="submit" id="appointmentButton">Submit</button>

								</div>

							</div>

						</form>

					</div>
				</div>
			</div>



			<!--------------------success message---------------------->
			<div id="successmessage">
				<h2>Record Added successfully</h2>
				<img class="img" src="exstyle/Images/green-check-mark-icon.jpg">
				<div>
					<a href="welcome.jsp">Go to welcome page</a>
				</div>
			</div>

		</div>
	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		    $('#showDoctor').hide();
			$('#showNurse').hide();
			$('#showEmployee').hide();
			$('#showPatient').hide();
			$('#showDepartment').hide();
			$('#successmessage').hide();
			$('#showAppointment').hide();
			 
			$('#adddoctor').click(function() {
				$('#showDoctor').show();
				$('#showNurse').hide();
				$('#showDepartment').hide();
				$('#numberDetails').hide();
				$('#showPatient').hide();
				$('#showEmployee').hide();
				$('#showAppointment').hide();

			});
			$('#addnurse').click(function() {
				$('#showNurse').show();
				$('#showDepartment').hide();
				$('#showDoctor').hide();
				$('#showPatient').hide();
				$('#numberDetails').hide();
				$('#showEmployee').hide();
				$('#showAppointment').hide();
				
				
			});
			$('#addpatient').click(function() {
				$('#showPatient').show();
				$('#showDepartment').hide();
				$('#showNurse').hide();
				$('#showDoctor').hide();
				$('#numberDetails').hide();
				$('#showEmployee').hide();
				$('#showAppointment').hide();
				
				
			});
			$('#department').click(function() {
				$('#showDepartment').show();
				$('#showNurse').hide();
				$('#showDoctor').hide();
				$('#showPatient').hide();
				$('#numberDetails').hide();
				$('#showEmployee').hide();
				$('#showAppointment').hide();
				
				
			
			});
			
			$ ('#employee').click(function() {
				$('#showEmployee').show();
				$('#showDepartment').hide();
				$('#showAppointment').hide();
				$('#showNurse').hide();
				$('#showDoctor').hide();
				$('#showPatient').hide();
				$('#showAppointment').hide();
				$('#numberDetails').hide();
				
			});
			
		 	$ ('#appointment').click(function() {
				$('#showAppointment').show();
				$('#showEmployee').hide();
				$('#showDepartment').hide();
				$('#showNurse').hide();
				$('#showDoctor').hide();
				$('#showPatient').hide();
				$('#numberDetails').hide();
				
			});
				    
	});
		
		
		/*................Doctor ajax..........  */
		
 		  /*  function validateDoctor() {
			var pattern =/^[a-zÀ-ÿ ,.'-]+$/i;
			var ssnPattern = /[A-Za-z\s]+$/;
			
		  	var name3 = document.getElementById("name3").value;
			var doctorposition = document.getElementById("doctorposition").value;
			var doctorspecialties = document.getElementById("doctorspecialties").value;
			var ssn3 = document.getElementById("ssn3").value;
			var doctorjoindate = document.getElementById("doctorjoindate").value;
			
			var dataString ='&ssn3='+ ssn3 + '&doctorposition='+ doctorposition 
			+'&doctorspecialties=' + doctorspecialties + 
			'&name3=' + name3 + '&doctorjoindate='+doctorjoindate;
			
			alert(dataString);
			
	
			if (!name3.match(pattern)) {
				alert("please enter valid name");
				return false;
			} else if (!doctorposition.match(pattern)) {
				alert("please enter valid Position name");
				return false;
			}
		    if (ssn3.match(ssnPattern)) {
				alert("please enter valid ssn name");
				return false;
			} else if (ssn3.length != 9 || ssn3.length < 9) {
				alert("ssn number should be 9 digits");
				return false;
			} else {
				alert("Do You Want to Add Doctor !!!!");	
				$.ajax({

					type : "POST",
					url : "AddDoctorServlet",
					data : dataString,		
					
					success : function() {
						alert("Data was succesfully captured"); 
						document.getElementById("Form1").reset();
						$('#showDepartment').hide();
						$('#showNurse').hide();
						$('#showDoctor').hide();
						$('#showPatient').hide();
						$('#numberDetails').hide();
						$('#successmessage').show()   
					},
					
					 error : function() {
							alert("Something Want Wrong !!!!");
						} 
					
					
					});
				return false;	
		}
			
	}  
		
		
 */		
		    /*...................-.......PATIENT AJAX......................  */
		
		        
		    /* 	$('#patientButton').click(function() {
		    		
		    	 alert("some thing running");   
		    	 alert('Please wait while form is submitting');
		    	 $('#myform1').submit();
		    	}); */
		   
            
		    
		    function validatePatient()
		    {
			
		    	var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
				var MobileNumberPattern=/[A-Za-z\s]+$/;
			
				
				var patientname=document.getElementById("patientname").value;
				var mobilenumber=document.getElementById("mobilenumber").value;
				var address=document.getElementById("address").value;
			    
				
			   			    
				var dataString = '&patientname=' + patientname
				+ '&mobilenumber=' + mobilenumber +'&address='+ address;
			
			
				if(!patientname.match(pattern))
					{
					alert("please enter valid name");
					document.myform1.patientname.focus();
					return false;
					}else if(mobilenumber.match(MobileNumberPattern))
							{
								alert("please enter valid mobile number");
								document.myform1.mobilenumber.focus();
								return false;
							}else if(mobilenumber.length!=10) {
								
								alert("Mobile Number should  be 10 digit  ! ");
								document.myform1.mobilenumber.focus();
				                return false;	
							} else {
								 
							    alert("do you want to add record");
								$.ajax({
									
									type : "POST",
									url : "AddPatientServlet",
									data : dataString,
									
									success : function(response) {   
		                        			
										// clearing the input field
										
									   	 if(response=="False")
										 { 
									   	    //$('#successPatient').html("<p style='color:red; margin-bottom:40px;'>mobile number already resigetred</p>").show();
									   	    alert("mobile number already resigetred");
									   	    return false;
									   	    
										}
									   	else 
										{
									        //$('#successPatient').html("<p style='color:red; margin-bottom:40px;'>mobile number already resigetred</p>").hide();
									        document.getElementById("myform1").reset();
								            alert("Record added successfully");
									        //$('#successPatient').html("<h3  style='font-size:22px; margin-top:32px; color:green; font-weight: bold;'>Record added successfully</h3><img class='img' src='exstyle/Images/Check_Mark.jpg'>").show();
									        
									        //window.location.href='SuccessMessage.jsp?'+response; 
					 					}
							
									   
										
									 
									},
									
									 error : function() {
									
											alert("Something Went Wrong !!!!");
										}
									
									
			 					});
								
							}
				
							return false;
 	}  
		   
	
		    function validateMobile(key)
          	{
		    var keycode = (key.which) ? key.which : key.keyCode;
		    var mobilenumber = document.getElementById('mobilenumber');
		    
		    //comparing pressed keycodes
		    if (!(keycode==8 || keycode==46)&&(keycode < 48 || keycode > 57))
		    {
		    return false;
		    }else if (mobilenumber.value.length <10)
		    {	
		    return true;
		    }
		    else
		    {
		    alert("Mobile Number should not be more than 10 digit  ! "); 		
		    return false;
		    }
		    }
		    
		    /* -----------------Employee ajax-----------------  */
		    
		    function validateEmployee() {
			var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
			var ssnPattern = /[A-Za-z\s]+$/;
			var name = document.getElementById("name").value;
			var designation = document.getElementById("designation").value;
			var ssn = document.getElementById("ssn").value;
			var joindate = document.getElementById("joindate").value;
			
			var specialties = document.getElementById("specialties").value;
			
			
			var e = document.getElementById("designation");
			var strUser = e.options[e.selectedIndex].value;
			var designation = e.options[e.selectedIndex].text;
			
			var d_Id = document.getElementById("d_Id").value = strUser;

			
			var s = document.getElementById("specialties");
			//alert("EL :"+e)
			var strvalue = s.options[s.selectedIndex].value;
			var specialties= s.options[s.selectedIndex].text;

			
			
			var specialityId = document.getElementById("specialityId").value = strvalue;
 
			
			var dataString='&name=' + name
			+ '&d_Id=' + d_Id + '&specialityId=' + specialityId +'&ssn=' + ssn +'&designation=' + designation + '&joindate=' + joindate + '&specialties='+ specialties;
			//'&designation=' + designation +
			
			if (!name.match(pattern)) {
				alert("please enter valid name");
				return false;
			} else if (!designation.match(pattern)) {
				alert("please enter valid designation  name");
				return false;
			}
			if (ssn.match(ssnPattern)) {
				alert("please enter valid ssn name");
				return false;
			} else if (ssn.length != 9 || ssn.length < 9) {
				alert("ssn number should be 9 digits");
				return false;
			} else {
				
				alert("do you want to add record");
				$.ajax({
				
					type: "POST",
				    url:  "AddEmployeeServlet",
				    data: dataString,
				    
				    success:function(response)
				    {
				    	
				    	if(response=="false")
				    		{
				    		
				    		 //$('#success').html("<p style='color:red; margin-bottom:40px;'>ssn number already resigetred</p>").show();
				    		 alert("This ssn number already registered");
				    		 
				    		
				    		}
				    	else
				    		{
				    		//$('#success').html("<p style='color:red; margin-bottom:40px;'>ssn number already resigetred</p>").hide();
				    		document.getElementById("employeeform").reset();
				    		//$('#success').html("<h3  style='font-size:22px; margin-top:23px; color:green; font-weight: bold;'>Record added successfully</h3><img class='img' src='exstyle/Images/Check_Mark.jpg'>").show();
				    		alert("Record added successfully");
				    		
				    		}
				    },
				    
				    error: function() {
				    	alert("something went wrong");
				    }
				    
				});
				
					
				
			}
			
			return false;
		}
		
		/*     $('#designation').change(function(){
			   if($(this).val()=="2")
			   {    
				   $("#labelspecialties").show();
				   $("#specialties").show();
				   document.getElementById("specialties").disabled = false;
			   }
			    else
			    {
			       $("#labelspecialties").hide();
			       $("#specialties").hide();
			       document.getElementById("specialties").disabled = true;
			    }
			});
		  
		  $(document).ready(function(){
			
			  $("#labelspecialties").hide();
			  $("#specialties").hide();
			  document.getElementById("specialties").disabled = true;
			  
			  
		  }) */
		  
		 function validate(key)
		    {
			    var keycode = (key.which) ? key.which : key.keyCode;
			    var ssn = document.getElementById('ssn');
			    
			    //comparing pressed keycodes
			    if ((keycode==7 || keycode==45)&&(keycode < 47 || keycode > 57))
			    {
			    return false;
			    }else if (ssn.value.length<9)
			    {	
			    return true;
			    }
			    else
			    {
			    alert("ssn  should not be more than 9 digit  ! "); 		
			    return false;
			    }  
			  
		    }
		
		    
		    /*...................NURSE AJAX....................  */
		    
		    /* function validateNurse()
		    {
				var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
				var ssnPattern = /[A-Za-z\s]+$/;
				
				var name2= document.getElementById("name2").value;
				var position2 =document.getElementById("position2").value;
				var ssn2 = document.getElementById("ssn2").value;
				var joindate2 = document.getElementById("joindate2").value;
				
				var dataString='name2=' + name2
				+ '&position2='+position2 + '&ssn2=' + ssn2
				+ '&joindate2='+joindate2;
				
			
				if (!name2.match(pattern)) {
					alert("please enter valid name");
					return false;
				} else if (!position2.match(pattern)) {
					alert("please enter valid Position name");
					return false;
				}
				if (ssn2.match(ssnPattern)) {
					alert("please enter valid ssn name");
					return false;
				} else if (ssn2.length != 9 || ssn2.length < 9) {
					alert("ssn number should be 9 digits");
					return false;
				} else {
					alert(dataString);
						$.ajax({

							type : "POST",
							url : "AddNurseServlet",
							data : dataString,		
							success : function() {
							   alert("Data  succesfully captured");
								$('#showDepartment').hide();
								$('#showNurse').hide();
								$('#showDoctor').hide();
								$('#showPatient').hide();
								$('#numberDetails').hide();
								$('#successmessage').show()
								//window.location.href='SuccessMessage.jsp';   
								 
							},
							
							 error : function() {
									alert("Something Want Wrong !!!!");
								} 				
	 					});
						
					return false;
			}
		
	    }
 
 */
  
					
 		   /*................... Department ajax................ */
 		   
         	function validateDepartment() {
				var pattern =/^[a-zÀ-ÿ ,.'-]+$/i;
				
				var departmentname = document.getElementById("departmentname").value;
				var headofdepartment = document.getElementById("headofdepartment").value;

				var dataString = '&departmentname=' + departmentname
						+ '&headofdepartment=' + headofdepartment;
				
				alert(dataString);

				alert("page running");

				if (!pattern.test(departmentname)) {
					alert("please enter valid department name");
					return false;
				} else if (!pattern.test(headofdepartment)) {
					alert("please enter valid head of department");
					return false;
				} else {
					alert("you sure");
					$.ajax({

						type : "POST",
						url : "DepartmentServlet",
						data : dataString,		
						success : function(response) {
					
							alert(response);
							
                            if(response=="False")
                            	{
                            	alert("This Department name already registered");
                            	}
                            else
                            	{
                            	
                            	document.getElementById("departmentform").reset();
                            	alert("record added successfully");
                            	
                            	}
							
							
						},
						
						 error : function() {
								alert("Something Want Wrong !!!!");
							} 
						
						
 					});
					return false;
					     
				}
				
			}  
 
 
              /*................Appointment Ajax...................*/
			
               function validateAppointment()
		    {
            	  
			
		    	var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
				var MobileNumberPattern=/[A-Za-z\s]+$/;
			
				
				var patientappointmentname=document.getElementById("patientappointmentname").value;
				var appointmentmobilenumber=document.getElementById("appointmentmobilenumber").value;
				var cityname=document.getElementById("cityname").value;
				var appointmentdate=document.getElementById("appointmentdate").value;
				
				var joindate = document.getElementById("docdate").text;
				alert("joinDate text is:"+ joindate);
				
				
				
				var d = document.getElementById("doctorname");
				
				
				//alert("EL :"+e)
				var doctorvalue = d.options[d.selectedIndex].value;
				var  doctorname= d.options[d.selectedIndex].text;

				alert(" First doctor  value : " + doctorvalue);
				alert("Second DoctorName : " + doctorname);
				
				var empId = document.getElementById("empId").value = doctorvalue;
				
 

				/* var empId =document.getElementById("empId").value;
				alert(empId);
				 */
			   			    
				var dataString = '&patientappointmentname=' + patientappointmentname
				+ '&appointmentmobilenumber='+ appointmentmobilenumber + '&empId='+ empId + '&doctorname=' + doctorname +'&cityname='+ cityname
				+ '&appointmentdate='+ appointmentdate +'&joindate=' + joindate;
			
			      alert(dataString);
				
				if(!patientappointmentname.match(pattern))
					{
					alert("please enter valid name");
					document.appointmentform.patientappointmentname.focus();
					return false;
					}else if(appointmentmobilenumber.match(MobileNumberPattern))
							{
								alert("please enter valid mobile number");
								document.appointmentform.appointmentmobilenumber.focus();
								return false;
							}else if(appointmentmobilenumber.length!=10) {
								
								alert("Mobile Number should  be 10 digit  ! ");
								document.appointmentform.appointmentmobilenumber.focus();
				                return false;	
							} if(!cityname.match(pattern))
								{
								alert("please enter valid city name");
								document.appointmentform.cityname.focus();
								return false;
								}else {
								
							    alert("do you want to add record");
								$.ajax({
									
									type : "POST",
									url : "AddAppointmentServlet",
									data : dataString,
									
									success : function(response) {   
		                        		
									   	 if(response=="False")
										 { 
									   	    //$('#successPatient').html("<p style='color:red; margin-bottom:40px;'>mobile number already resigetred</p>").show();
									   	    alert("This mobile number already resigetred");
									
										}
									   	else 
										{
									        //$('#successPatient').html("<p style='color:red; margin-bottom:40px;'>mobile number already resigetred</p>").hide();
									        
									        document.getElementById("appointmentform").reset();
								            alert("Record added successfully");
									        //$('#successPatient').html("<h3  style='font-size:22px; margin-top:32px; color:green; font-weight: bold;'>Record added successfully</h3><img class='img' src='exstyle/Images/Check_Mark.jpg'>").show();

									        //window.location.href='SuccessMessage.jsp?'+response; 
					 					}
							
									 
									},
									
									 error : function() {
									     
											alert("Something Went Wrong !!!!");
										}
									
									
			 					});
								
							}
				
							return false;
 	}  
              

   		    function validateAppointmentMobile(key)
             	{
   		    var keycode = (key.which) ? key.which : key.keyCode;
   		    var mobilenumber = document.getElementById('appointmentmobilenumber');
   		    
   		    //comparing pressed keycodes
   		    if (!(keycode==8 || keycode==46)&&(keycode < 48 || keycode > 57))
   		    {
   		    return false;
   		    }else if (appointmentmobilenumber.value.length <10)
   		    {	
   		    return true;
   		    }
   		    else
   		    {
   		    alert("Mobile Number should not be more than 10 digit  ! "); 		
   		    return false;
   		    }
   		    }     
	            
	</script>

</body>
</body>

<jsp:include page="Footer.jsp"></jsp:include>
</html>