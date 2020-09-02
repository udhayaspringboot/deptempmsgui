package com.deptempservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.deptempservice.model.Department;

@Service
public class DeptEmpService implements DepEmpServ{

	
	@Autowired
	RestTemplate restTemplate;

	@Override
	public Department saveSev(Department dept) {
		
			return restTemplate.postForObject("http://gateway-service/department/saveDept", dept,
					Department.class);
		
	}
	
	
}
