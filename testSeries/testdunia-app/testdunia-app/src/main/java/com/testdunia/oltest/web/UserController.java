package com.testdunia.oltest.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.testdunia.oltest.model.Role;
import com.testdunia.oltest.model.UserBase;
import com.testdunia.oltest.repository.RoleRepository;
import com.testdunia.oltest.repository.UserRepository;
import com.testdunia.oltest.util.TestDuniaConstants;

@Controller
public class UserController extends TestDuniaConstants {
	protected static Logger logger = LoggerFactory.getLogger(UserController.class);
    
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;
	
	PasswordEncoder passwordEncoder;
	
	@RequestMapping("/registration")
	public String registerUser(Model m) {
		logger.info("courseBaseController : inside regsiter user  ");
		UserBase userBase = new UserBase();
		return "registration";
	}

	@RequestMapping(value="/registerUser",method=RequestMethod.POST)
	public String registerUser(@RequestParam Map<String,String> req,Model m) {
				
			String isExistingEmail=req.get("email");
			UserBase alreadyExistsUserBase=userRepository.findByEmail(isExistingEmail);
			if(alreadyExistsUserBase!=null) {
				m.addAttribute("error", "Email already Exists !!!");
				logger.info("Registration already Exists with email "+alreadyExistsUserBase.getEmail());
			}else {
				String fullName=req.get("fullname");
				String password=req.get("password");
				String retypePassword=req.get("passwordConfirm");
				
				UserBase ub=new UserBase();
				ub.setFullName(fullName);
				ub.setEmail(isExistingEmail);
				
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				
				ub.setPassword(passwordEncoder.encode(password));
				ub.setEnabled(true);
				
				Role role=roleRepository.findByName("ROLE_USER");
				ub.setRole(role);
				ub.setPasswordConfirm(passwordEncoder.encode(retypePassword));
				
//				userRepository.save(ub);
				logger.info("Data saved successfully in userbase table");
				m.addAttribute(ub);
				return "testhome";
			}
				
			return "registration";
	}

}
