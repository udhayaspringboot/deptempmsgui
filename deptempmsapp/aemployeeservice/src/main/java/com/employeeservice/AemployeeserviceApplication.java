package com.employeeservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient

public class AemployeeserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AemployeeserviceApplication.class, args);
	}

}
