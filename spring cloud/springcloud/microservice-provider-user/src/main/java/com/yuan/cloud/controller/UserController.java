package com.yuan.cloud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.DiscoveryClient;
import com.netflix.discovery.EurekaClient;
import com.yuan.cloud.entity.User;
import com.yuan.cloud.repository.UserRepository;

@RestController
public class UserController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private EurekaClient eurekaClient;
	
	
	@GetMapping("/user/{id}")
	public User findById(@PathVariable Long id){
		return this.userRepository.findOne(id);
	}
	
	@GetMapping("/eureka-intance")
	public String serviceUrl(){
																		//applicationName
		InstanceInfo instance = eurekaClient.getNextServerFromEureka("microservice-provider-user", false);
		return instance.getHomePageUrl();
	}
	

	
	
}
