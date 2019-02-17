<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
</head>
<body>
	<h2><center>Employee Details</center></h2><a href="reg"><b style="color: blue;">Add Employee</b></a><br><br>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>DOB</th>
			<th>Mobile Number</th>
			<th>Email Id</th>
			<th>Qualification</th>
			<th>Skills</th>
			<th>Department</th>
			<th>Experience</th>
			<th>Employee Type</th>
			<th>Join Date</th>
			<th>End Date</th> 
			<th>Temporary Address</th>
			<th>Permanent Address</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${employeeList}" var="employees">
			<tr>
				<td>${employees.id}</td>
				<td>${employees.firstName}</td>
				<td>${employees.lastName}</td>
				<td>
					<c:choose>
						<c:when test='${employees.gender == "M"}'>
		                   	Male
				        </c:when>
				        <c:otherwise>
		                 	Female
				        </c:otherwise>
					</c:choose>
				</td>
				<td>${employees.dateOfBirthDDMMYYY}</td>
				<td>${employees.mobileNo}</td>
				<td>${employees.emailId}</td>
				<td>
					<c:choose>
					    <c:when test='${employees.qualificationId == "1"}'>
		                   	M.Tech
				        </c:when>
				        <c:when test='${employees.qualificationId == "2"}'>
		                    M.Phil
				        </c:when>
				        <c:when test='${employees.qualificationId == "3"}'>
		                   	M.A
				        </c:when>
				        <c:when test='${employees.qualificationId == "4"}'>
		                   	M.C.A
				        </c:when>
				        <c:when test='${employees.qualificationId == "5"}'>
		                   	M.BA
				        </c:when>
				        <c:when test='${employees.qualificationId == "6"}'>
		                   	M.Sc
				        </c:when>
				        <c:when test='${employees.qualificationId == "7"}'>
		                   	M.Com
				        </c:when>
				        <c:when test='${employees.qualificationId == "8"}'>
		                   	B.Tech
				        </c:when>
				        <c:when test='${employees.qualificationId == "9"}'>
		                   	B.Sc
				        </c:when>
				        <c:when test='${employees.qualificationId == "10"}'>
		                   B.Com
				        </c:when>
						</c:choose>
				</td>	
				<td>
					<c:choose>
						<c:when test='${employees.skillId == "1"}'>
		                   	Java
				        </c:when>
				        <c:when test='${employees.skillId == "2"}'>
		                   	C
				        </c:when>
				        <c:when test='${employees.skillId == "3"}'>
		                   	C++
				        </c:when>
				        <c:when test='${employees.skillId == "4"}'>
		                   	Android
				        </c:when>
				        <c:when test='${employees.skillId == "5"}'>
		                   	.Net
				        </c:when>
				        <c:when test='${employees.skillId == "6"}'>
		                   	Sql
				        </c:when>
				        <c:when test='${employees.skillId == "7"}'>
		                   	Php
				        </c:when>
				        </c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test='${employees.departmentId == "1"}'>
		                   	CSC
				        </c:when>
				        <c:when test='${employees.departmentId == "2"}'>
		                   	EEE
				        </c:when>
					    <c:when test='${employees.departmentId == "3"}'>
		                   	Civil
				        </c:when>
				        <c:when test='${employees.departmentId == "4"}'>
		                   	Mechanical
				        </c:when>
				        <c:when test='${employees.departmentId == "5"}'>
		                   	Finance
				        </c:when>
				        <c:when test='${employees.departmentId == "6"}'>
		                   	Marketing
				        </c:when>
				        <c:when test='${employees.departmentId == "7"}'>
		                   	Computers
				        </c:when>
				        <c:when test='${employees.departmentId == "8"}'>
		                   	Accounts
				         </c:when>
				        <c:when test="${employees.departmentId == '9'}">
		                   HR
				        </c:when>
				         <c:when test='${employees.departmentId == "10"}'>
		                   	Chemistry
				        </c:when>
					</c:choose>
				</td>
				<td>${employees.experiance}</td>
				<td>
					<c:choose>
					    <c:when test="${employees.employeeType == 'P'}">
		                   	Permanent
				        </c:when>
				        <c:otherwise>
		                 	Contract
				        </c:otherwise>
					</c:choose>
				</td>
				<td>${employees.joinDateDDMMYYY}</td>
				<td>${employees.endDateDDMMYYY}</td> 
				<td>${employees.tempararyAddress.street},${employees.tempararyAddress.city},
					<c:choose>
					    <c:when test="${employees.tempararyAddress.stateId == '1'}">
		                   Andhra Pradesh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '2'}">
		                   Telangana
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '3'}">
		                   Karnataka
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '4'}">
		                   Tamil Nadu
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '5'}">
		                   Kerala
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '6'}">
		                   Maharashtra
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '7'}">
		                   Goa
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '8'}">
		                   Delhi
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '9'}">
		                   Haryana
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '10'}">
		                   Punjab
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '11'}">
		                   Chandigarh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '12'}">
		                   Himachal Pradesh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '13'}">
		                   Jammu and Kashmir
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '14'}">
		                   Uttar Pradesh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '15'}">
		                   Rajasthan
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '16'}">
		                   Gujarat
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '17'}">
		                   Madhya Pradesh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '18'}">
		                   Chhattisgarh
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '19'}">
		                   West Bengal
				         </c:when>
				         <c:when test="${employees.tempararyAddress.stateId == '20'}">
		                   Sikkim
				         </c:when>
					</c:choose>
					,${employees.tempararyAddress.pinCode}</td>
				<td>${employees.permanentAddress.street},${employees.permanentAddress.city},
					<c:choose>
					    <c:when test="${employees.permanentAddress.stateId == '1'}">
		                   Andhra Pradesh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '2'}">
		                   Telangana
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '3'}">
		                   Karnataka
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '4'}">
		                   Tamil Nadu
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '5'}">
		                   Kerala
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '6'}">
		                   Maharashtra
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '7'}">
		                   Goa
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '8'}">
		                   Delhi
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '9'}">
		                   Haryana
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '10'}">
		                   Punjab
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '11'}">
		                   Chandigarh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '12'}">
		                   Himachal Pradesh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '13'}">
		                   Jammu and Kashmir
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '14'}">
		                   Uttar Pradesh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '15'}">
		                   Rajasthan
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '16'}">
		                   Gujarat
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '17'}">
		                   Madhya Pradesh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '18'}">
		                   Chhattisgarh
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '19'}">
		                   West Bengal
				         </c:when>
				         <c:when test="${employees.permanentAddress.stateId == '20'}">
		                   Sikkim
				         </c:when>
					</c:choose>
					,${employees.permanentAddress.pinCode}</td>
				<td><a href="editEmployeeDetails?id=${employees.id}">Edit</a></td>
				<td><a href="deleteEmployee?id=${employees.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>