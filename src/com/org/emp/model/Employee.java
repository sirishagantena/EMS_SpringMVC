package com.org.emp.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="employeeDetails")
public class Employee {
	@Id
	@GeneratedValue
	@Column(length=10)
	private long id;
	@Column(length=100)
	private String firstName;
	@Column(length=100)
	private String lastName;
	@Column(length=1)
	private String gender;
	@Temporal(TemporalType.DATE)
	private Date dateOfBirth;
	@Column(length=10,unique=true)
	private String mobileNo;
	@Column(length=100,unique=true)
	private String emailId;
	@Column(length=10)
	private int qualificationId;
	@Column(length=2)
	private int experiance;
	@Column(length=1)
	private String employeeType;
	@Temporal(TemporalType.DATE)
	private Date joinDate;
	@Temporal(TemporalType.DATE)
	private Date endDate;
	@Column(length=10)
	private String departmentId;
	@Column(length=10)
	private int skillId;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="tempararyAddressId")
	private Address tempararyAddress;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="permanentAddressId")
	private Address permanentAddress;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public int getQualificationId() {
		return qualificationId;
	}
	public void setQualificationId(int qualificationId) {
		this.qualificationId = qualificationId;
	}
	public int getExperiance() {
		return experiance;
	}
	public void setExperiance(int experiance) {
		this.experiance = experiance;
	}
	public String getEmployeeType() {
		return employeeType;
	}
	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public int getSkillId() {
		return skillId;
	}
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	public Address getTempararyAddress() {
		return tempararyAddress;
	}
	public void setTempararyAddress(Address tempararyAddress) {
		this.tempararyAddress = tempararyAddress;
	}
	public Address getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(Address permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	@Transient
	public String getDepartmentName() {
		String department = null;
		if (this.departmentId.equals(1))
			department = "CSC";
		else if (this.departmentId.equals(2))
			department = "EEE";
		else if (this.departmentId.equals(3))
			department = "Civil";
		else if (this.departmentId.equals(4))
			department = "Mechanical";
		else if (this.departmentId.equals(5))
			department = "Finance";
		else if (this.departmentId.equals(6))
			department = "Marketing";
		else if (this.departmentId.equals(7))
			department = "Computers";
		else if (this.departmentId.equals(8))
			department = "Accounts";
		else if (this.departmentId.equals(9))
			department = "HR";
		else if (this.departmentId.equals(10))
			department = "Chemistry";
		return department;
	}
	@Transient
	public String getDateOfBirthDDMMYYY(){
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if(this.dateOfBirth != null){
			String date = format.format(this.dateOfBirth);
			return date;
		}
		return null;
	}
	
	@Transient
	public String getJoinDateDDMMYYY(){
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if(this.joinDate != null){
			String date = format.format(this.joinDate);
			return date;
		}
		return null;
	}
	@Transient
	public String getEndDateDDMMYYY(){
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		if(this.endDate != null){
			String date = format.format(this.endDate);
			return date;
		}
		return null;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", gender=" + gender
				+ ", dateOfBirth=" + dateOfBirth + ", mobileNo=" + mobileNo
				+ ", emailId=" + emailId + ", qualificationId="
				+ qualificationId + ", experiance=" + experiance
				+ ", employeeType=" + employeeType + ", joinDate=" + joinDate
				+ ", endDate=" + endDate + ", departmentId=" + departmentId
				+ ", skillId=" + skillId + ", tempararyAddress="
				+ tempararyAddress + ", permanentAddress=" + permanentAddress
				+ "]";
	}
	
}