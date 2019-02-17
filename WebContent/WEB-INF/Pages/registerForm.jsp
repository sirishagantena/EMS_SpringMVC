<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration Form</title>
		<script>
            function isInputNumber(evt){
            	var ch = String.fromCharCode(evt.which);
            	if(!(/[0-9]/.test(ch))){
                	evt.preventDefault();
                }
            }
            function validateEmail(emailField){
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(emailField.value) == false) 
                {
                    alert('Invalid Email Address');
                    return false;
                }
                return true;
        	}
            function validate(){
            	/* var email = document.registration.emailId.value;
            	atpos = email.indexOf("@");
            	  dotpos = email.lastIndexOf("."); */
            	  //var email = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            	if( document.registration.firstName.value == "" )
            		{
            	    	alert( "Please provide your Name!" );
            	    	document.registration.firstName.focus() ;
            	    	return false;
            	   }
            	if(( registration.gender[0].checked == false ) && ( registration.gender[1].checked == false ))
            	   	{
            	   		alert ( "Please choose your Gender: Male or Female" );
            	  		return false;
            	   }
            	if( document.registration.mobileNo.value == "" || isNaN( document.registration.mobileNo.value) || document.registration.mobileNo.value.length != 10 )
            		{
	            	    alert( "Please provide a Mobile No in the format 123." );
	            	    document.registration.mobileNo.focus() ;
	            	    return false;
            	   	}
            	if( document.registration.qualificationId.value == "0" )
            	   {
            	   		alert( "Please provide your Qualification!" );
                		return false;
            	   }
            	if( document.registration.skillId.value == "0" )
         	   		{
         	    	 	alert( "Please provide your Skills!" );
         	    		return false;
         	   		}
            	if( document.registration.dateOfBirth.value == "" )
            	   {
	            	    alert( "Please provide your DOB!" );
	            	    document.registration.dateOfBirth.focus() ;
	            	    return false;
            	   }
            	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(registration.emailId.value))
            	   {
              	     return true;
              	   }else{
              	     alert("You have entered an invalid email address!")
              	     return false;
              	   }
            		return true;
        	}
            function sameAsAddrees(){
            	var checkBox = document.getElementById("checkedVal");
            	if(checkBox.checked == true){
            		document.registration.permanentStreet.value=document.registration.street.value;
            		document.registration.permanentCity.value=document.registration.city.value;
            		document.registration.permanentState.value=document.registration.stateId.value;
            		document.registration.permanentPinCode.value=document.registration.pinCode.value;
            		
            		//var tempStreet=document.registration.street.value;
            		//var tempCity=document.registration.city.value;
            		//var tempState=document.registration.stateId.value;
            		//var tempPincode=document.registration.pinCode.value;
            		//var permanentStreet=document.registration.permanentStreet.value=tempStreet;
            		//var permanentCity=document.registration.permanentCity.value=tempCity;
            		//var permanentState=document.registration.permanentState.value=tempState;
            		//var permanentPinCode=document.registration.permanentPinCode.value=tempPincode;
            	 }else{
            		document.registration.permanentStreet.value='';
             		document.registration.permanentCity.value='';
             		document.registration.permanentState.value='';
             		document.registration.permanentPinCode.value='';
            	 }
        		
        	}
            
        </script>
	<style type="text/css">
		#required {
			color: red;
		}
		
		#table {
			padding: 30px;
			padding-bottom: 30px;
			position: absolute;
			top: 10px;
		}
		
	</style>
	</head>
	<body>
		<form action="saveEmployee" method="POST" name="registration" onsubmit="return(validate());">
			<table>
				<tr>
					<td colspan="5"><center><h2 style="color: lime;">Add Employee</h2></center></td>
				</tr>
				<tr>
					<td><span id="required">*</span>First Name:</td>
					<td><input type="text" name="firstName" maxlength="100" placeholder="Name must be  lessthan 100 characters" size="35"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" size="35" /></td>
				</tr>
				<tr>
					<td><span id="required">*</span>Gender:</td>
					<td><input type="radio" name="gender" value="M" id="male">Male
						<input type="radio" name="gender" value="F" id="female">Female
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td><span id="required">*</span>Date Of Birth:</td>
					<td><input type="text" name="dateOfBirth" placeholder="DD/MM/YYYY" size="35" /></td>
				</tr>
				<tr>
					<td><span id="required">*</span>Mobile No:</td>
					<td><input type="text" name="mobileNo" maxlength="10" placeholder="Mobile Number must be 10 Digits Only" size="35" onkeypress="isInputNumber(event)"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td><span id="required">*</span>Email:</td>
					<td><input type="text" name="emailId" id="txtemail" placeholder="Please Enter valid Email" size="35" onblur="validateEmail(this);" /></td>
				</tr>
				<tr>
					<td>Qualification Details:</td>
						<td>
							<select name="qualificationId">
								<option value="0">- Select -</option>
								<option value="1">M.Tech</option>
								<option value="2">M.Phil</option>
								<option value="3">M.A</option>
								<option value="4">M.C.A</option>
								<option value="5">M.BA</option>
								<option value="6">M.Sc</option>
								<option value="7">M.Com</option>
								<option value="8">B.Tech</option>
								<option value="9">B.Sc</option>
								<option value="10">B.Com</option>
							</select>
						</td>
						<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
						<td><span id="required">*</span>Department:</td>
						<td><select name="departmentId">
								<option value="0">- Select -</option>
								<option value="1">CSC</option>
								<option value="2">EEE</option>
								<option value="3">Civil</option>
								<option value="4">Mechanical</option>
								<option value="5">Finance</option>
								<option value="6">Marketing</option>
								<option value="7">Computers</option>
								<option value="8">Accounts</option>
								<option value="9">HR</option>
								<option value="10">Chemistry</option>
							</select>
						</td>
				</tr>
				<tr>
					<td><span id="required">*</span>Skills:</td>
					<td>
						<select name="skillId">
							<option value="0">- Select -</option>
							<option value="1">Java</option>
							<option value="2">C</option>
							<option value="3">C++</option>
							<option value="4">Android</option>
							<option value="5">.Net</option>
							<option value="6">Sql</option>
							<option value="7">Php</option>
						</select>
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Experience:</td>
					<td><select name="experiance">
							<option value="0">- Select -</option>
							<option value="0">Fresher</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Employee Type:</td>
					<td><input type="radio" name="employeeType" value="C" id="r1" onclick="show()">Contract
						<input type="radio" name="employeeType" value="P" id="r2" onclick="hide()">Permanent
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
				</tr>
				<!-- <tr style="visibility:hidden;" id="date"> -->
				<tr>
					<td>Join Date:</td>
					<td><input type="text" name="joinDate" placeholder="DD/MM/YYYY" size="35" id="joinDate" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>End Date:</td>
					<td><input type="text" name="endDate" placeholder="DD/MM/YYYY" size="35" id="endDate" /></td>
				</tr>
				<tr>
					<td><b>Temporary Address</b></td>
				</tr>
				<tr>
					<td>Street:</td>
					<td><input type="text" name="street" size="35" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>State:</td>
					<td>
						<select name="stateId">
							<option value="0">- Select -</option>
							<option value="1">Andhra Pradesh</option>
							<option value="2">Telangana</option>
							<option value="3">Karnataka</option>
							<option value="4">Tamil Nadu</option>
							<option value="5">Kerala</option>
							<option value="6">Maharashtra</option>
							<option value="7">Goa</option>
							<option value="8">Delhi</option>
							<option value="9">Haryana</option>
							<option value="10">Punjab</option>
							<option value="11">Chandigarh</option>
							<option value="12">Himachal Pradesh</option>
							<option value="13">Jammu and Kashmir</option>
							<option value="14">Uttar Pradesh</option>
							<option value="15">Rajasthan</option>
							<option value="16">Gujarat</option>
							<option value="17">Madhya Pradesh</option>
							<option value="18">Chhattisgarh</option>
							<option value="19">West Bengal</option>
							<option value="20">Sikkim</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td><input type="text" name="city" size="35" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Pin code:</td>
					<td><input type="text" name="pinCode" id="pinCode" size="35" maxlength="6" onkeypress="isInputNumber(event)"/></td>
				</tr>
				<tr>
					<td><b>Permanent Address</b></td>
				</tr>
				<tr>
					<td>Same As Temporary Address</td>
					<td><input type="checkbox" value="Dispaly Address" id="checkedVal" onclick="sameAsAddrees()" /></td>
				</tr>
				<tr>
					<td>Street:</td>
					<td><input type="text" name="permanentStreet" size="35" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>State:</td>
					<td>
						<select name="permanentState">
							<option value="0">- Select -</option>
							<option value="1">Andhra Pradesh</option>
							<option value="2">Telangana</option>
							<option value="3">Karnataka</option>
							<option value="4">Tamil Nadu</option>
							<option value="5">Kerala</option>
							<option value="6">Maharashtra</option>
							<option value="7">Goa</option>
							<option value="8">Delhi</option>
							<option value="9">Haryana</option>
							<option value="10">Punjab</option>
							<option value="11">Chandigarh</option>
							<option value="12">Himachal Pradesh</option>
							<option value="13">Jammu and Kashmir</option>
							<option value="14">Uttar Pradesh</option>
							<option value="15">Rajasthan</option>
							<option value="16">Gujarat</option>
							<option value="17">Madhya Pradesh</option>
							<option value="18">Chhattisgarh</option>
							<option value="19">West Bengal</option>
							<option value="20">Sikkim</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td><input type="text" name="permanentCity" size="35" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Pin code:</td>
					<td><input type="text" name="permanentPinCode" id="permanentPinCode" size="35" maxlength="6" onkeypress="isInputNumber(event)"/></td>
				</tr>
				<tr>
					<td colspan="5" align="center"><input type="submit" value="Register" /></td>
				</tr>
			</table>
		</form>
		<a href="show"><b style="color:blue;">View Employees</b></a>
	</body>
</html>