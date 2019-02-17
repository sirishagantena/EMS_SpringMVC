package com.org.emp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="address")
public class Address {
	@Id
	@GeneratedValue
	@Column(length=10)
	private long id;
	@Column(length=100)
	private String street;
	@Column(length=50)
	private String city;
	@Column(length=2)
	private int stateId;
	@Column(length=6)
	private long pinCode;
	@Transient
	private String permanentStreet;
	@Transient
	private String permanentCity;
	@Transient
	private int permanentState;
	@Transient
	private long permanentPinCode;

	
	public long getPinCode() {
		return pinCode;
	}
	public void setPinCode(long pinCode) {
		this.pinCode = pinCode;
	}
	public String getPermanentStreet() {
		return permanentStreet;
	}
	public void setPermanentStreet(String permanentStreet) {
		this.permanentStreet = permanentStreet;
	}
	public String getPermanentCity() {
		return permanentCity;
	}
	public void setPermanentCity(String permanentCity) {
		this.permanentCity = permanentCity;
	}
	
	public long getPermanentPinCode() {
		return permanentPinCode;
	}
	public void setPermanentPinCode(long permanentPinCode) {
		this.permanentPinCode = permanentPinCode;
	}
	public int getPermanentState() {
		return permanentState;
	}
	public void setPermanentState(int permanentState) {
		this.permanentState = permanentState;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", city=" + city
				+ ", stateId=" + stateId + ", pinCode=" + pinCode
				+ ", permanentStreet=" + permanentStreet + ", permanentCity="
				+ permanentCity + ", permanentState=" + permanentState
				+ ", permanentPinCode=" + permanentPinCode + "]";
	}
	
}