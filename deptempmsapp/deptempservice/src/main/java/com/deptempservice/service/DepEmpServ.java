package com.deptempservice.service;

import org.springframework.stereotype.Service;

import com.deptempservice.model.Department;
@Service
public interface DepEmpServ {
	
	Department saveSev(Department dept);

}
