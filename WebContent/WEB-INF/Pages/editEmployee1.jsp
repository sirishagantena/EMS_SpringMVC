<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            	if( document.editEmployee.firstName.value == "" ) {
            	    	alert( "Please provide your Name!" );
            	    	document.registration.firstName.focus() ;
            	    	return false;
            	}
            	if(( editEmployee.gender[0].checked == false ) && ( editEmployee.gender[1].checked == false )) {
            	   		alert ( "Please choose your Gender: Male or Female" );
            	  		return false;
            	}
            	if( document.editEmployee.mobileNo.value == "" || isNaN( document.editEmployee.mobileNo.value) || document.editEmployee.mobileNo.value.length != 10 ){
	            	    alert( "Please provide a Mobile No in the format 123." );
	            	    document.registration.mobileNo.focus() ;
	            	    return false;
            	}
            	if( document.editEmployee.qualificationId.value == "0" ) {
            	   		alert( "Please provide your Qualification!" );
                		return false;
            	}
            	if( document.editEmployee.skillId.value == "0" ) {
         	    	 	alert( "Please provide your Skills!" );
         	    		return false;
         	    }
            	if( document.editEmployee.dateOfBirth.value == "" ) {
	            	    alert( "Please provide your DOB!" );
	            	    document.registration.dateOfBirth.focus() ;
	            	    return false;
            	}
            	if( document.editEmployee.pinCode.value == "" || isNaN( document.editEmployee.pinCode.value) || document.editEmployee.pinCode.value.length != 6 ){
	            	   alert( "Please provide a pincode in the format 123456." );
	            	   document.registration.pinCode.focus() ;
	            	   return false;
            	}
            		return true;
        	}
            function sameAsAddrees(){
            	var checkBox = document.getElementById("checkedVal");
            	if(checkBox.checked == true){
            		document.editEmployee.permanentStreet.value=document.editEmployee.street.value;
            		document.editEmployee.permanentCity.value=document.editEmployee.city.value;
            		document.editEmployee.permanentState.value=document.editEmployee.stateId.value;
            		document.editEmployee.permanentPinCode.value=document.editEmployee.pinCode.value;
            	 }else{
            		document.editEmployee.permanentStreet.value='';
             		document.editEmployee.permanentCity.value='';
             		document.editEmployee.permanentState.value='';
             		document.editEmployee.permanentPinCode.value='';
            	 }
        		
            }
            /* function show(){
                	if (document.getElementById('r1').checked) {
	                        document.getElementById('joinDate').style.visibility = 'visible';
	                        document.getElementById('endDate').style.visibility = 'visible';
                	}
                	else {
	                    	document.getElementById('joinDate').style.visibility = 'hidden';
	                    	document.getElementById('endDate').style.visibility = 'hidden';
                    	 }
            }
            function hide(){
            	
                	if (document.getElementById('r2').checked) {
	                        document.getElementById('joinDate').style.visibility = 'hidden';
	                        document.getElementById('endDate').style.visibility = 'hidden';
                	}
                	else
                    	{
	                    	document.getElementById('joinDate').style.visibility = 'visible';
	                    	document.getElementById('endDate').style.visibility = 'visible';
                    	}
            } */
            
        </script>
	<style type="text/css">
		#required {
			color: red;
		}
	</style>
	</head>
	<body>
		<form action="updateEmployeeDetails" method="POST" name="editEmployee" onsubmit="return(validate());">
			<input type="hidden" name="id" value="${employee.id}"/>
			<input type="hidden" name="tempararyAddress.id" value="${employee.tempararyAddress.id}"/>
			<input type="hidden" name="permanentAddress.id" value="${employee.permanentAddress.id}"/>
			<table>
				<tr>
					<td><span id="required">*</span>First Name:</td>
					<td><input type="text" name="firstName" maxlength="100" placeholder="Name must be  lessthan 100 characters" size="35" value="${employee.firstName}" /></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" size="35" value="${employee.lastName}"/></td>
				</tr>
				<tr>
					<td><span id="required">*</span>Gender:</td>
					<td>
						<c:choose>
							<c:when test='${employee.gender == "M"}'>
			                	<input type="radio" name="gender" value="M" id="male" checked="checked">Male
								<input type="radio" name="gender" value="F" id="female" >Female
					        </c:when>
					  		<c:otherwise>
			                 	<input type="radio" name="gender" value="M" id="male">Male
								<input type="radio" name="gender" value="F" id="female" checked="checked">Female
					    	</c:otherwise>
						</c:choose>
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td><span id="required">*</span>Date Of Birth:</td>
					<td><input type="text" name="dateOfBirth" placeholder="DD/MM/YYYY" size="35" value="${employee.dateOfBirthDDMMYYY}"/></td>
				</tr>
				<tr>
					<td><span id="required">*</span>Mobile No:</td>
					<td><input type="text" name="mobileNo" maxlength="10" placeholder="Mobile Number must be 10 Digits Only" size="35" value="${employee.mobileNo}" onkeypress="isInputNumber(event)"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td><span id="required">*</span>Email:</td>
					<td><input type="text" name="emailId" placeholder="Please Enter valid Email" size="35" value="${employee.emailId}" onblur="validateEmail(this);"/></td>
				</tr>
				<tr>
					<td>Qualification Details:</td>
						<td>
							<select name="qualificationId">
								<option value="0">- Select -</option>
								<option value="1" ${employee.qualificationId== '1' ? 'selected' : ''}>M.Tech</option>
								<option value="2" ${employee.qualificationId== '2' ? 'selected' : ''}>M.Phil</option>
								<option value="3" ${employee.qualificationId== '3' ? 'selected' : ''}>M.A</option>
								<option value="4" ${employee.qualificationId== '4' ? 'selected' : ''}>M.C.A</option>
								<option value="5" ${employee.qualificationId== '5' ? 'selected' : ''}>M.BA</option>
								<option value="6" ${employee.qualificationId== '6' ? 'selected' : ''}>M.Sc</option>
								<option value="7" ${employee.qualificationId== '7' ? 'selected' : ''}>M.Com</option>
								<option value="8" ${employee.qualificationId== '8' ? 'selected' : ''}>B.Tech</option>
								<option value="9" ${employee.qualificationId== '9' ? 'selected' : ''}>B.Sc</option>
								<option value="10" ${employee.qualificationId== '10' ? 'selected' : ''}>B.Com</option>
							</select>
						</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td><span id="required">*</span>Department:</td>
					<td>
						<select name="departmentId" >
							<option value="0">- Select -</option>
							<option value="1" ${employee.departmentId== '1' ? 'selected' : ''}>CSC</option>
							<option value="2" ${employee.departmentId== '2' ? 'selected' : ''}>EEE</option>
							<option value="3" ${employee.departmentId== '3' ? 'selected' : ''}>Civil</option>
							<option value="4" ${employee.departmentId== '4' ? 'selected' : ''}>Mechanical</option>
							<option value="5" ${employee.departmentId== '5' ? 'selected' : ''}>Finance</option>
							<option value="6" ${employee.departmentId== '6' ? 'selected' : ''}>Marketing</option>
							<option value="7" ${employee.departmentId== '7' ? 'selected' : ''}>computers</option>
							<option value="8" ${employee.departmentId== '8' ? 'selected' : ''}>Accounts</option>
							<option value="9" ${employee.departmentId== '9' ? 'selected' : ''}>hr</option>
							<option value="10" ${employee.departmentId== '10' ? 'selected' : ''}>Chemistry</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><span id="required">*</span>Skills:</td>
					<td>
						<select name="skillId" value="${employee.skillId}">
							<option value="0">- Select -</option>
							<option value="1" ${employee.skillId== '1' ? 'selected' : ''}>Java</option>
							<option value="2" ${employee.skillId== '2' ? 'selected' : ''}>C</option>
							<option value="3" ${employee.skillId== '3' ? 'selected' : ''}>C++</option>
							<option value="4" ${employee.skillId== '4' ? 'selected' : ''}>Android</option>
							<option value="5" ${employee.skillId== '5' ? 'selected' : ''}>.Net</option>
							<option value="6" ${employee.skillId== '6' ? 'selected' : ''}>Sql</option>
							<option value="7" ${employee.skillId== '7' ? 'selected' : ''}>Php</option>
						</select>
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Experience:</td>
					<td>
						<select name="experiance" value="${employee.experiance}">
							<option value="0">- Select -</option>
							<option value="0" ${employee.experiance== '0' ? 'selected' : ''}>Fresher</option>
							<option value="1" ${employee.experiance== '1' ? 'selected' : ''}>1</option>
							<option value="2" ${employee.experiance== '2' ? 'selected' : ''}>2</option>
							<option value="3" ${employee.experiance== '3' ? 'selected' : ''}>3</option>
							<option value="4" ${employee.experiance== '4' ? 'selected' : ''}>4</option>
							<option value="5" ${employee.experiance== '5' ? 'selected' : ''}>5</option>
							<option value="6" ${employee.experiance== '6' ? 'selected' : ''}>6</option>
							<option value="7" ${employee.experiance== '7' ? 'selected' : ''}>7</option>
							<option value="8" ${employee.experiance== '8' ? 'selected' : ''}>8</option>
							<option value="9" ${employee.experiance== '9' ? 'selected' : ''}>9</option>
							<option value="10" ${employee.experiance== '10' ? 'selected' : ''}>10</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Employee Type:</td>
					<td>
						<c:choose>
					    	<c:when test="${employee.employeeType == 'P'}">
		                  		<input type="radio" name="employeeType"  value="P" checked="checked">Permanent 
								<input type="radio" name="employeeType"  value="C">Contract
				         	</c:when>
				        	<c:otherwise>
		                 		<input type="radio" name="employeeType"  value="P"> Permanent
								<input type="radio" name="employeeType"  value="C" checked="checked">Contract
				        	</c:otherwise>
						</c:choose>
					</td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
				</tr>
				<tr>
					<td>Join Date:</td>
					<td><input type="text" name="joinDate" placeholder="YYYY-MM-DD" size="35" value="${employee.joinDateDDMMYYY}"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>End Date:</td>
					<td><input type="text" name="endDate" placeholder="YYYY-MM-DD" size="35" value="${employee.endDateDDMMYYY}"/></td>
				</tr>
				<tr>
					<td><b>Temporary Address</b></td>
				</tr>
				<tr>
					<td>Street:</td>
					<td><input type="text" name="street" size="35" value="${employee.tempararyAddress.street}"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>State:</td>
					<td>
						<select name="stateId" value="${employee.tempararyAddress.stateId}">
							<option value="0" ${employee.tempararyAddress.stateId== '0' ? 'selected' : ''}>- Select -</option>
							<option value="1" ${employee.tempararyAddress.stateId== '1' ? 'selected' : ''}>Andhra Pradesh</option>
							<option value="2" ${employee.tempararyAddress.stateId== '2' ? 'selected' : ''}>Telangana</option>
							<option value="3" ${employee.tempararyAddress.stateId== '3' ? 'selected' : ''}>Karnataka</option>
							<option value="4" ${employee.tempararyAddress.stateId== '4' ? 'selected' : ''}>Tamil Nadu</option>
							<option value="5" ${employee.tempararyAddress.stateId== '5' ? 'selected' : ''}>Kerala</option>
							<option value="6" ${employee.tempararyAddress.stateId== '6' ? 'selected' : ''}>Maharashtra</option>
							<option value="7" ${employee.tempararyAddress.stateId== '7' ? 'selected' : ''}>Goa</option>
							<option value="8" ${employee.tempararyAddress.stateId== '8' ? 'selected' : ''}>Delhi</option>
							<option value="9" ${employee.tempararyAddress.stateId== '9' ? 'selected' : ''}>Haryana</option>
							<option value="10" ${employee.tempararyAddress.stateId== '10' ? 'selected' : ''}>Punjab</option>
							<option value="11" ${employee.tempararyAddress.stateId== '11' ? 'selected' : ''}>Chandigarh</option>
							<option value="12" ${employee.tempararyAddress.stateId== '12' ? 'selected' : ''}>Himachal Pradesh</option>
							<option value="13" ${employee.tempararyAddress.stateId== '13' ? 'selected' : ''}>Jammu and Kashmir</option>
							<option value="14" ${employee.tempararyAddress.stateId== '14' ? 'selected' : ''}>Uttar Pradesh</option>
							<option value="15" ${employee.tempararyAddress.stateId== '15' ? 'selected' : ''}>Rajasthan</option>
							<option value="16" ${employee.tempararyAddress.stateId== '16' ? 'selected' : ''}>Gujarat</option>
							<option value="17" ${employee.tempararyAddress.stateId== '17' ? 'selected' : ''}>Madhya Pradesh</option>
							<option value="18" ${employee.tempararyAddress.stateId== '18' ? 'selected' : ''}>Chhattisgarh</option>
							<option value="19" ${employee.tempararyAddress.stateId== '19' ? 'selected' : ''}>West Bengal</option>
							<option value="20" ${employee.tempararyAddress.stateId== '20' ? 'selected' : ''}>Sikkim</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td><input type="text" name="city" size="35" value="${employee.tempararyAddress.city}"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Pin code:</td>
					<td><input type="text" name="pinCode" id="pinCode" size="35" maxlength="6" value="${employee.tempararyAddress.pinCode}" onkeypress="isInputNumber(event)"/></td>
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
					<td><input type="text" name="permanentStreet" size="35" value="${employee.permanentAddress.street}"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>State:</td>
					<td>
						<select name="permanentState" value="${employee.permanentAddress.stateId}">
							<option value="0" ${employee.permanentAddress.stateId== '0' ? 'selected' : ''}>- Select -</option>
							<option value="1" ${employee.permanentAddress.stateId== '1' ? 'selected' : ''}>Andhra Pradesh</option>
							<option value="2" ${employee.permanentAddress.stateId== '2' ? 'selected' : ''}>Telangana</option>
							<option value="3" ${employee.permanentAddress.stateId== '3' ? 'selected' : ''}>Karnataka</option>
							<option value="4" ${employee.permanentAddress.stateId== '4' ? 'selected' : ''}>Tamil Nadu</option>
							<option value="5" ${employee.permanentAddress.stateId== '5' ? 'selected' : ''}>Kerala</option>
							<option value="6" ${employee.permanentAddress.stateId== '6' ? 'selected' : ''}>Maharashtra</option>
							<option value="7" ${employee.permanentAddress.stateId== '7' ? 'selected' : ''}>Goa</option>
							<option value="8" ${employee.permanentAddress.stateId== '8' ? 'selected' : ''}>Delhi</option>
							<option value="9" ${employee.permanentAddress.stateId== '9' ? 'selected' : ''}>Haryana</option>
							<option value="10" ${employee.permanentAddress.stateId== '10' ? 'selected' : ''}>Punjab</option>
							<option value="11" ${employee.permanentAddress.stateId== '11' ? 'selected' : ''}>Chandigarh</option>
							<option value="12" ${employee.permanentAddress.stateId== '12' ? 'selected' : ''}>Himachal Pradesh</option>
							<option value="13" ${employee.permanentAddress.stateId== '13' ? 'selected' : ''}>Jammu and Kashmir</option>
							<option value="14" ${employee.permanentAddress.stateId== '14' ? 'selected' : ''}>Uttar Pradesh</option>
							<option value="15" ${employee.permanentAddress.stateId== '15' ? 'selected' : ''}>Rajasthan</option>
							<option value="16" ${employee.permanentAddress.stateId== '16' ? 'selected' : ''}>Gujarat</option>
							<option value="17" ${employee.permanentAddress.stateId== '17' ? 'selected' : ''}>Madhya Pradesh</option>
							<option value="18" ${employee.permanentAddress.stateId== '18' ? 'selected' : ''}>Chhattisgarh</option>
							<option value="19" ${employee.permanentAddress.stateId== '19' ? 'selected' : ''}>West Bengal</option>
							<option value="20" ${employee.permanentAddress.stateId== '20' ? 'selected' : ''}>Sikkim</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td><input type="text" name="permanentCity" size="35" value="${employee.permanentAddress.city}"/></td>
					<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
					<td>Pin code:</td>
					<td><input type="text" name="permanentPinCode" id="permanentPinCode" size="35" maxlength="6" value="${employee.permanentAddress.pinCode}" onkeypress="isInputNumber(event)"/></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="5" align="center"><input type="submit" value="Update" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>