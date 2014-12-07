package com.shareit.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shareit.model.ShareCase;
import com.shareit.model.User;
import com.shareit.model.UserRole;
import com.shareit.service.ShareCasesService;
import com.shareit.service.UserService;

@Controller
public class UserController {

	private final static org.slf4j.Logger logger = LoggerFactory
			.getLogger(BaseController.class);

	private final ShareCasesService shareCasesService;
	private final UserService userService;

	@Autowired
	public UserController(ShareCasesService shareCasesService, UserService userService) {
		this.shareCasesService = shareCasesService;
		this.userService = userService;
	}
	
	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public String getCreateCasePage(Map<String, Object> model) {
        
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.put("username", userDetail.getUsername());
		}
		
        List<Integer> caseTypesList = new ArrayList<>();
        caseTypesList.add(1);
        caseTypesList.add(2);
        caseTypesList.add(3);
        model.put("caseTypes", caseTypesList);
	
        User userForm = new User();    
        model.put("userForm", userForm);
		final List<UserRole> userRoleList = this.userService.getAllUserRoles();
		model.put("userRoles", userRoleList);
		return "CreateUser";

	}
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public String addNewUser(@ModelAttribute("userForm")User user, 
			   ModelMap model,  final BindingResult bindingResult) {
		String logginUser = "";
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			logginUser = userDetail.getUsername();
			model.addAttribute("username", userDetail.getUsername());
			model.addAttribute("msg", "sucess");
			int userId = this.userService.getUserIdByName(logginUser);
		
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println(dateFormat.format(date)); 

		}
		
		this.userService.saveUser(user);
		for(String role : user.getRoles()){
			this.userService.saveUserRole(user.getUsername(), role);
		}
//		final List<UserRole> userRoleList = this.userService.getAllUserRoles();
//		model.put("userRoles", userRoleList);
		
//		List<ShareCase> shareCaseList = new ArrayList<ShareCase>();
//		shareCaseList = this.shareCasesService
//				.getShareCasesByUserName(logginUser);
//		model.addAttribute("shareCasesList", shareCaseList);
//	
//		model.addAttribute("username", logginUser);
		
		return "login";

	}
}
