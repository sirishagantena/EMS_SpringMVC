package com.org.emp.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.org.emp.dao.EmployeeDao;
import com.org.emp.model.Address;
import com.org.emp.model.Employee;

@Repository("employeeDao")
public class EmployeeDaoImpl implements EmployeeDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveEmployee(Employee employee) {
		Session session=null;
		Transaction tx=null;
		try {
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			session.saveOrUpdate(employee);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Employee> showEmployeeDetails() {
		Session session=null;
		Criteria criteria=null;
		List<Employee> employeeList=null;
		try {
			session=sessionFactory.openSession();
			criteria=session.createCriteria(Employee.class);
			employeeList=criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return employeeList;
	}
	public void deleteEmployeeById(long id) {
		Session session=null;
		Transaction tx=null;
		Employee employee=null;
		try {
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			employee=(Employee)session.get(Employee.class, id);
			session.delete(employee);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	public Employee getEmployeeById(long id) {
		Session session=null;
		Transaction tx=null;
		Employee employee=null;
		try{
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			employee=(Employee) session.get(Employee.class, id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return employee;
	}
	public Employee updateEmployee(Employee employee) {
		Session session=null;
		Transaction tx=null;
		try{
			session = this.sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			session.update(employee);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		return employee;
	}
	public void saveAddress(Address address) {
		Session session=null;
		Transaction tx=null;
		try {
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			session.saveOrUpdate(address);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public Address updateEmployeeAddress(Address address) {
		Session session = this.sessionFactory.openSession();
		session.update(address);
		return address;
	}
	public Address getAddressById(long id) {
		Session session=null;
		Transaction tx=null;
		Address address=null;
		try{
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			tx.begin();
			address=(Address) session.get(Address.class, id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return address;
	}

}