<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:scriptlet>String Name = (String) session.getAttribute("name");

if (Name == null) {
	response.sendRedirect("index.jsp");
}</jsp:scriptlet>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Department</title>

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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style>
body {
	background-color: #f1f1f1;
	margin: auto;
	font-size: 1rem;
	font-weight: 700;
	line-height: 2.5
}

h1 {
	text-align: center;
	margin-left: 190px;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Futara;
	border: 1px solid #aaaaaa;
}

button {
	background-color: #04AA6D;
	color: #ffffff;
	border: none;
	padding: 3px 20px;
	font-size: 15px;
	font-family: Raleway;
	cursor: pointer;
	margin-left: 15px;
}

button:hover {
	opacity: 0.8;
}

.card {
	height: 330px;
	margin-left: 380px;
	background-color: white;
	background-clip: border-box;
	border: 1px solid;
	padding-right: 33px;
	width: 670px;
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
		<h1>Department</h1>
		<div class="card">
			<div class="card-body">
				<form class="col-lg-5 offset-lg-4 " action="" method="POST"
					name="form1" id="Form1"  onsubmit="return validateForm()">



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
						<div style="float: center; decoration: none; text-align: center;">
							<button type="submit">Submit</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>


	<script>
		function validateForm() {
			var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
			var departmentname = document.getElementById("departmentname").value;
			var headofdepartment = document.getElementById("headofdepartment").value;

			var dataString = 'departmentname=' + departmentname
					+ '&headofdepartment=' + headofdepartment;

			alert("page running");

			if (!pattern.test(departmentname)) {
				alert("please enter valid department name");
				return false;
			} else if (!pattern.test(headofdepartment)) {
				alert("please enter valid head of department");
				return false;
			} else {
				alert("you sre");
				$.ajax({

					type : "POST",
					url : "DepartmentServlet",
					data : dataString,		
					success : function(data) {
						
						window.location.href = "SuccessMessage.jsp";
					},
					 error : function() {
							alert("Something Want Wrong !!!!");
						} 
					/* 	$("#Form1").html(data);
						alert("Successfully Added !!!!");
					
					 error : function() {
						alert("Something Want Wrong !!!!");
					} */ 
				});
			}

			return true;
		}
		
		
		

		/* 
		 function validateForm() {
			var pattern = /^[a-zÀ-ÿ ,.'-]+$/i;
		  	var departmentname = document.getElementById("departmentname").value;
		var headofdepartment = document.getElementById("headofdepartment").value;
		
		var dataString = 'departmentname=' + departmentname + '&headofdepartment='
		+ headofdepartment;
		alert("Do You Want to Add Project !!!!");
		
		jQuery.ajax({
		           type: "POST",    
		           url: "DepartmentServlet",  
		           data: dataString,
		          // alert("ajax running");
		           success: function (data) {
		           	
		           	 $("#Form1").html(data);
				     alert("Successfully Added !!!!");
		           		  
		               },  
		              error : function() {
					alert("Something Want Wrong !!!!");
				}
		           	
		       		
		
		       }); 
			return true;
		}  */
	</script>
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>