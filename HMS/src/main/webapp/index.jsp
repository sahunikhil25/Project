<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>


<style>
table.a {
	position: absolute;
	left: 980px;
	border: 2px solid black;
	top: 190px;
	
}

table.d {
	position: absolute;
	margin-left:975px;
	border: 2px solid black;
	margin-top: 85px;
	height: 50px;
	background-color:grey
}


table.tab {
	position: absolute;
	margin: auto;
	left: 510px;
	height: 501px;
	border: 2px solid black;
	top: 190px;
}

.buttonHolder {
	font-size: 18px;
	width: 65px;
	text-align: center;
	margin-left: 75px;
	margin-top: 16px;
	background-color: green;
	color: white;
}

.ancr {
	text-align: right;
}
    .vl {
  border-left: 2px solid #000;
  height: 40px;
}
</style>
</head>
<body style="font-family: Futara">

	<%
		response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	%>
	<jsp:include page="HomePageHeader.jsp"></jsp:include>

	<table width="50%" style="float: left";>
		<tr class="text">
			<td float="left"><img src="exstyle/Images/Apollo-Hospital1-770x433.jpg"
				height="500px" width="500px"></img></td>
		</tr>
	</table>


	<table class="tab" width="35%" style="float: left">
		<tr>
			<td>
				<h2 align="center">About Hospital Management</h2>
				<p>
					<strong><font size="3">A Hospital  management
							 is known as Management or administration of hospitals.
							 Hospital management provides the direct connection between 
							 health care services and those supplying they require.
							 Hospital Management Career involves ensuring effective use
							 of physical & financial resources of hospital. 
							 </font></strong>
				</p>
			</td>
		</tr>
	</table>



	<form action="LoginServlet" method="POST" name="loginform" id="login"
		onsubmit="return validation()">
		<center>
			<table class="a" style="padding: 10px; padding-bottom: 487px;"
				width=27%>
              <table class="d" width=25% style=margin-left:985px;>
				<tr>
					<td><h2 style="margin-top: 80px;">Admin</h2></td>
				</tr>
				<tr>
					<td>Name:</td>

					<td><input style="margin-bottom: 10px;" type="text"
						name="name" id="name" /><span id="nameerror"></span></td>
				</tr>

				<tr>
					<td>Password:</td>
					<td><input style="margin-bottom: 10px;" type="password"
						name="password" id="password"><span id="passworderror"></span></td>
				</tr>
				<tr>

					<!-- <input  type="submit" value="Sign in" class="buttonHolder"/> -->
					<!-- <td colspan="2" align="center"><br><br><input style="background:green;color:white; margin-left:80px;font-size:16px;" type="submit" value="Sign in"><br><br> </td> -->

					<td colspan="3" align="center"><input class="buttonHolder"
						type="submit" value="Sign in"></td>

				</tr>

				<!-- <tr>
					<td><a href="Register.jsp" class="ancr">click here to Registered</a></td>
					<td colspan="2"><h5 style="margin-top: 18px; margin-left:50px;" align="center">
							Not yet registered ? <a href="Register.jsp">click here to
								Registered</a>
						</h5></td>
				</tr> -->

				<tr>

					<td colspan="2"><h5 style="m
					argin-top: 15px;" align="center">
							Forgot password ? <a href="">click here</a>
						</h5></td>
				</tr>
			</table>
			</table>
		</center>


	</form>



	<table style="float: clear; margin-bottom:10px;"></table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr color="#525864" size="3" width="100%">
	<table width="30%" style="float: left;">
		<!-- <tr>
			<td><p>
					<strong><font size="4">Contact Us:</font></strong>
				</p>
				<p>
					Scheme Number- 74 C, Sector D, Bhanvarkuan<br>
                   Landmark: Near Power House
                    Vijay Nagar, Indore.<br>Contact
					 No.0731-2445566
					
				</p></td>
		</tr> -->
	</table>


	<br>
	<br>
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>

	
	<script>
		function validation() {

			var filter =/^[a-zA-Z\s]{3,}$/;
			var name =document.getElementById("name").value;
			var password =document.getElementById("password").value;
        /* /* 	if(name=='')
    		{
    			alert('Please enter a name');
    			return false
    		}
    		else if(!filter.test(name))
    		{
    			alert('Name field required only alphabet characters');
    			return false
    		}
    		else */ */ if(password=='')
    		{
    			alert('Please enter your password');
    			return false;
    		}
    		else 
    			{
    			return true;
    			}
    	
		}
	</script>

</body>
</html>