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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shareit.model.ShareCase;
import com.shareit.service.ShareCasesService;
import com.shareit.service.UserService;

@Controller
public class CaseController {

	private final static org.slf4j.Logger logger = LoggerFactory
			.getLogger(BaseController.class);

	private final ShareCasesService shareCasesService;
	private final UserService userService;

	@Autowired
	public CaseController(ShareCasesService shareCasesService, UserService userService) {
		this.shareCasesService = shareCasesService;
		this.userService = userService;
	}
	
	@RequestMapping(value = "/getCreateCasePage", method = RequestMethod.GET)
	public String getCreateCasePage(Map<String, Object> model) {

//		ModelAndView model = new ModelAndView();
//		model.addObject("msg", "You've been logged out successfully.");
//		model.setViewName("createcase");
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
		
			ShareCase userForm = new ShareCase();    
	        model.put("userForm", userForm);
	        List<Integer> caseTypesList = new ArrayList<>();
	        caseTypesList.add(1);
	        caseTypesList.add(2);
	        caseTypesList.add(3);
	        model.put("caseTypes", caseTypesList);
	        
			model.put("username", userDetail.getUsername());

		}

		return "createcase";

	}
	
	@RequestMapping(value = "/createCase", method = RequestMethod.POST)
	public String createCase(@ModelAttribute("userForm")ShareCase shareCase, 
			   ModelMap model,  final BindingResult bindingResult) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
		
			model.addAttribute("username", userDetail.getUsername());
			model.addAttribute("msg", "sucess");
			int userId = this.userService.getUserIdByName(userDetail.getUsername());
		
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println(dateFormat.format(date)); 
			shareCase.setCreatedDate(dateFormat.format(date));
			shareCase.setDonatorId(userId);

		}
		
		this.shareCasesService.insertShareCaseToDB(shareCase);
		
		return "createcase";

	}
	
}
