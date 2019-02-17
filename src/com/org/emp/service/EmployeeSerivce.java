package com.org.emp.service;

import java.util.List;

import com.org.emp.model.Address;
import com.org.emp.model.Employee;

public interface EmployeeSerivce {
	public void saveEmployee(Employee emp);
	public List<Employee> showEmployeeDetails();
	public void deleteEmployeeById(long id);
	public Employee updateEmployee(Employee employee);
	public Employee getEmployeeById(long id);
	public Address saveAddress(Address address);
	public Address updateEmployeeAddress(Address address);
	public Address getAddressById(long id);
}