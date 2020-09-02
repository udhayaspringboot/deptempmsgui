package com.deptempgateway.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import reactor.core.publisher.Mono;

@RestController
public class FallBackController {
	
	@RequestMapping("/deartmentfallback")
	public Mono<String> deptFallBack()
	{
		return  Mono.just("Its taking too much time to respond or down !please try again later");
		
	}

}
