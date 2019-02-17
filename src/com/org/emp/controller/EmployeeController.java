package com.org.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.emp.model.Address;
import com.org.emp.model.Employee;
import com.org.emp.service.EmployeeSerivce;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeSerivce employeeSerivce;
	@RequestMapping(value="/reg",method=RequestMethod.GET)
	public ModelAndView registerForm(){
		ModelAndView mav=new ModelAndView("registerForm");
		return mav;
	}
	@RequestMapping(value="/error",method=RequestMethod.GET)
	public ModelAndView errorForm(){
		ModelAndView mav=new ModelAndView("errorPage");
		return mav;
	}
	@RequestMapping(value="/saveEmployee",method=RequestMethod.POST)
	public String saveEmployee(@ModelAttribute("employee") Employee employee, @ModelAttribute("address") Address address, BindingResult result){
		System.out.println("Inside 'saveEmployee' method");
		try {
			Address tempAddress = employeeSerivce.saveAddress(address);
			employee.setTempararyAddress(tempAddress);
			
			Address permanentAddress = new Address();
			permanentAddress.setStreet(address.getPermanentStreet());
			permanentAddress.setCity(address.getPermanentCity());
			permanentAddress.setStateId(address.getPermanentState());
			permanentAddress.setPinCode(address.getPermanentPinCode());
			//permanentAddress = employeeSerivce.saveAddress(permanentAddress);
			employee.setPermanentAddress(permanentAddress);
			
			/*if(employee.getJoinDate()!=null){
				employee.setJoinDate(employee.getJoinDate());
			}else{
				employee.setJoinDate(null);
			}
			if(employee.getEndDate()!=null){
				employee.setEndDate(employee.getEndDate());
			}else{
				employee.setEndDate(null);
			}*/
			
			employeeSerivce.saveEmployee(employee);
			return "redirect:/ems/show";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/ems/error";
		}
	}
	@RequestMapping("/show")
	public ModelAndView displayEmployeeDetails(@ModelAttribute("employee") Employee employee){
		System.out.println("Inside 'displayEmployeeDetails' method");
		try {
			List<Employee> employeeList=employeeSerivce.showEmployeeDetails();
			return new ModelAndView("viewEmployees","employeeList",employeeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
    @RequestMapping(value="/deleteEmployee")
    public ModelAndView deleteEmployee(@RequestParam("id") long id) {
    	System.out.println("Inside 'deleteEmployee' method");
    	try {
    		employeeSerivce.deleteEmployeeById(id);
            return new ModelAndView("redirect:/ems/show");
		} catch (Exception e) {
			e.printStackTrace();
		}
        return null;
    }
    @RequestMapping(value="/editEmployeeDetails")
    public ModelAndView editEmployeeDetails(@RequestParam("id") long id){
    	System.out.println("Inside 'editEmployeeDetails' method");
    	try {
    		Employee employee = employeeSerivce.getEmployeeById(id);
        	System.out.println(employee.toString());
            ModelAndView mvc = new ModelAndView("editEmployee");
            mvc.addObject("employee", employee);
            return mvc;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    @RequestMapping(value="/updateEmployeeDetails",method=RequestMethod.POST)
    public String updateEmployeeDetails(@ModelAttribute("employee") Employee employee, @ModelAttribute("address") Address address, BindingResult result){
    	System.out.println("Inside 'updateEmployeeDetails' method");
    	System.out.println(employee.toString());
    	try {
    		Address tempararyAddress = employeeSerivce.getAddressById(employee.getTempararyAddress().getId());
        	tempararyAddress.setStreet(address.getStreet());
        	tempararyAddress.setCity(address.getCity());
        	tempararyAddress.setStateId(address.getStateId());
        	tempararyAddress.setPinCode(address.getPinCode());
        	employee.setTempararyAddress(tempararyAddress);
        	
        	Address permanentAddress = employeeSerivce.getAddressById(employee.getPermanentAddress().getId());
    		permanentAddress.setStreet(address.getPermanentStreet());
    		permanentAddress.setCity(address.getPermanentCity());
    		permanentAddress.setStateId(address.getPermanentState());
    		permanentAddress.setPinCode(address.getPermanentPinCode());
    		employee.setPermanentAddress(permanentAddress);
    		
    		System.out.println("Emp end: "+employee.toString());		
    		employeeSerivce.updateEmployee(employee);
    		return "redirect:/ems/show";
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
}