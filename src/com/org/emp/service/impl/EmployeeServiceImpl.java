package com.org.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.emp.dao.EmployeeDao;
import com.org.emp.model.Address;
import com.org.emp.model.Employee;
import com.org.emp.service.EmployeeSerivce;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeSerivce{
	@Autowired
	private EmployeeDao employeeDao;
	public void saveEmployee(Employee emp) {
		try {
			employeeDao.saveEmployee(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Employee> showEmployeeDetails() {
		List<Employee> employeeList=null;
		try {
			employeeList=employeeDao.showEmployeeDetails();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeeList;
	}
	public Employee getEmployeeById(long id) {
		return employeeDao.getEmployeeById(id);
	}
	public void deleteEmployeeById(long id) {
		try {
			employeeDao.deleteEmployeeById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Employee updateEmployee(Employee employee) {
		try {
			employee=employeeDao.updateEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	public Address saveAddress(Address address) {
		try {
			employeeDao.saveAddress(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return address;
	}

	public Address updateEmployeeAddress(Address address) {
		try {
			address=employeeDao.updateEmployeeAddress(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return address;
	}
	public Address getAddressById(long id) {
		try {
			return employeeDao.getAddressById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
