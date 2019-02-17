<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<script>
	function validate(){
		var fname=document.registration.firstName.value;
		var mobileNo=document.registration.mobileNo.value;
		var emailId=document.registration.emailId.value;
		var atPosition=emailId.indexOf("@");
		var dotPosition=emailId.lastIndexOf(".");
		var skills=document.registration.skills.value;
		var dateOfBirth=document.registration.dateOfBirth.value;
		var department=document.registration.department.value;
		var gender=document.registration.gender.value;
		
		if(fname == null || fname == "") {
			alert("Please Enter Name < 100 chars");
			return false;
		}else if(isNaN(mobileNo) || mobileNo.length !=10){
			alert("Enter Numeric value only,Enter between 0-9");
			return false;
		}else if(gender == null || gender == ""){
			alert("Please ckeck your Gender");
			return false;
		}else if(skills==null || skills==""){
			alert("Please select skills");
			return false;
		}else if(dateOfBirth=="" && (!dateOfBirth.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/))){
			alert('date format is wrong');
	        return false;
		}else if(atPosition<1 || dotPosition<atPosition+2 || dotPosition+2>=emailId.length && emailId.length > 100){
			alert("invalid Eamil Id");
			return false;
		}else if(department == null || department == ""){
			alert("Please select the Departmen t");
			return false;
		}else{
			return true;
		}
		for (var i=0; i<gender.length; i++) {
			if (gender[i].checked)
				break;
		}
		if (i==gender.length)
			return alert("Please select yiur Gender");
	}
	function sameAsAddrees(){
		var tempStreet=document.registration.street.value;
		var tempCity=document.registration.city.value;
		var tempState=document.registration.stateId.value;
		var tempPincode=document.registration.pinCode.value;
		var permanentStreet=document.registration.permanentStreet.value=tempStreet;
		var permanentCity=document.registration.permanentCity.value=tempCity;
		var permanentState=document.registration.permanentState.value=tempState;
		var permanentPinCode=document.registration.permanentPinCode.value=tempPincode;
		alert("Function is Calling");
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
	<form action="saveEmployee" method="POST" name="registration" onsubmit="return validate()">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><span id="required">*</span>First Name:</td>
							<td><input type="text" name="firstName" maxlength="100" placeholder="Name must be  lessthan 100 characters" size="40" /></td>
						</tr>
						<tr>
							<td><span id="required">*</span>Gender:</td>
							<td><input type="radio" name="gender" value="M" id="male">Male
								<input type="radio" name="gender" value="F" id="female">FeMale
							</td>
						</tr>
						<tr>
							<td><span id="required">*</span>Mobile No:</td>
							<td><input type="text" name="mobileNo" maxlength="10" placeholder="Mobile Number must be 10 Digits Only" size="40" /></td>
						</tr>
						<tr>
							<td>Educational Details:</td>
							<td><select name="qualificationId">
									<!-- it will get by the db -->
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
									<option value=".net">.Net</option>
									<option value="5">Sql</option>
									<option value="6">Php</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Employee Type:</td>
							<td><input type="radio" name="employeeType" value="c">Contract
								<input type="radio" name="employeeType" value="p">Permanent
							</td>
						</tr>
						<tr>
							<td>Join Date:</td>
							<td><input type="text" name="joinDate" placeholder="DD/MM/YYYY" size="30" /></td>
						</tr>
						<tr>
							<td><b>Temporary Address</b></td>
						</tr>
						<tr>
							<td>Street:</td>
							<td><input type="text" name="street" size="30" /></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" name="city" size="30" /></td>
						</tr>
						<tr>
							<td>Same As Temporary Address</td>
							<td><input type="checkbox" value="Dispaly Address" onclick="sameAsAddrees()" /></td>
						</tr>
						<tr>
							<td><b>Permanent Address</b></td>
						</tr>
						<tr>
							<td>Street:</td>
							<td><input type="text" name="permanentStreet" size="30" /></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" name="permanentCity" size="30" /></td>
						</tr>
					</table>
				</td>
				<td>
					<table id="table">
						<tr>
							<td>Last Name:</td>
							<td><input type="text" name="lastName" size="30" /></td>
						</tr>
						<tr>
							<td><span id="required">*</span>dateOfBirth:</td>
							<td><input type="text" name="dateOfBirth" placeholder="DD/MM/YYYY" size="30" /></td>
						</tr>
						<tr>
							<td><span id="required">*</span>Email Id:</td>
							<td><input type="text" name="emailId" placeholder="Please Enter valid Email Id" size="30" /></td>
						</tr>
						<tr></tr>
						<tr>
							<td><span id="required">*</span>Department:</td>
							<td><select name="departmentId">
									<option value="0">- Select -</option>
									<option value="1">CSC</option>
									<option value="2">EEE</option>
									<option value="3">Civil</option>
									<option value="4">Mechanical</option>
									<option value="5">Finance</option>
									<option value="6">Marketing</option>
									<option value="7">computers</option>
									<option value="8">Accounts</option>
									<option value="9">hr</option>
									<option value="10">Chemistry</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Experience:</td>
							<td><select name="experiance">
									<option value="0">- Select -</option>
									<option value="fresher">Fresher</option>
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
							</select></td>
						</tr>
						<tr>
							<td>End Date:</td>
							<td><input type="text" name="endDate" size="30" /></td>
						</tr>
						<tr>
							<td>State:</td>
							<td><select name="stateId">
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
							<td>Pin code:</td>
							<td><input type="text" name="pinCode" id="pinCode" size="30" maxlength="6" /></td>
						</tr>
						<tr>
							<td>State:</td>
							<td><select name="permanentState">
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
							<td>Pin code:</td>
							<td><input type="text" name="permanentPinCode" id="permanentPinCode" size="30" maxlength="6" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Register" /></td>
			</tr>
		</table>
	</form>
</body>
</html>