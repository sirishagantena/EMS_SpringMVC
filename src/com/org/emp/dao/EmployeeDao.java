package com.org.emp.dao;

import java.util.List;

import com.org.emp.model.Address;
import com.org.emp.model.Employee;

public interface EmployeeDao {
	public void saveEmployee(Employee emp);
	public List<Employee> showEmployeeDetails();
	public void deleteEmployeeById(long id);
	public Employee getEmployeeById(long id);
	public Employee updateEmployee(Employee employee);
	public void saveAddress(Address address);
	public Address updateEmployeeAddress(Address address);
	public Address getAddressById(long id);
}