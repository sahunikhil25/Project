<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.velociter.hms.database.Operation"%>

<jsp:scriptlet>String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}</jsp:scriptlet>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>

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


<!--********************  -->
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
	margin: auto;
	font-weight: 700;
}

h1 {
	text-align: center;
	margin-left: 125px;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Futara;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

button {
	background-color: #04AA6D;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
	margin-bottom: 40px;
}

button:hover {
	opacity: 0.8;
}

.card {
	width: 750px;
	height: 525px;
	margin-left: 330px;
	background-color: white;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 1.125);
	margin-bottom: 120px;
}

select {
	padding: 8px;
	min-width: -webkit-fill-available;
}

</style>

<script src="js/JsProperties.js"></script>

</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<div>
		<h1>Add Employee</h1>
		<div class="card">
			<div class="card-body">

				<form style="margin-top: 2px;" class="col-lg-5 offset-lg-4 "
					action="AddEmployeeServlet" method="POST" name="form1" id="Form1"
					onsubmit="return validateForm()">


					<div class="form-group">
						<label for="name">Full Name<span class="required-field">:</span></label>
						<input type="text" class="form-control" placeholder="Full Name"
							name="name" id="name" required>
					</div>

					<div class="form-group">
						<label for="position">Select Designation<span class="required-field">:</span></label>
							<select name="designation" id="designation"
							required>
							<option value="">Select Designation</option>
							<%
							List<String> list1 = Operation.getDesignation().list();
							for (String designation : list1) {
							%>
							<option>
							<%=designation%>
							</option>
							<%
							}
						   %>
							
						</select>

					</div>

					<div class="form-group">
						<label for="Select Specialties" id="labelspecialties">Select Specialties<span
							class="required-field">:</span></label> <select name="specialties" id="specialties"
							required>
							<option value="">Select Specialties</option>
							<%
							List<String> list = Operation.getSpecialties().list();
							for (String doctor : list) {
							%>
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
							name="ssn" id="ssn" onkeypress="return validate(event)" required >
					</div>
					<div class="form-group">
						<p>
							<label for="join date">Join date:</label> <input type="date"
								placeholder="join date" oninput="this.className = ''"
								id="joindate" name="joindate" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div style="float: center; decoration: none; text-align: center;">
							<button type="submit" id="addButton" >Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
			var ssnPattern = /[A-Za-z\s]+$/;
			var name = document.getElementById("name").value;
			var designation = document.getElementById("designation").value;
			var ssn = document.getElementById("ssn").value;

			if (!name.match(pattern)) {
				alert("please enter valid name");
				return false;
			} else if (!designation.match(pattern)) {
				alert("please enter valid Position name");
				return false;
			}
			if (ssn.match(ssnPattern)) {
				alert("please enter valid ssn name");
				return false;
			} else if (ssn.length != 9 || ssn.length < 9) {
				alert("ssn number should be 9 digits");
				return false;
			} else {
				return true;
			}
		}
		  $("#designation").change(function(){
			   if($(this).val()=="Doctor")
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
			  
			  
		  })
		  
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
		
	</script>

	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html> --%>