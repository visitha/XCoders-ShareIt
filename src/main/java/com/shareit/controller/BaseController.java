package com.shareit.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang.StringUtils;

import com.shareit.dao.DonatorDAO;
import com.shareit.model.Donator;
import com.shareit.model.ShareCase;
import com.shareit.service.ShareCasesService;
import com.shareit.service.UserService;

@Controller
public class BaseController {

	private static int counter = 0;
	private static final String VIEW_INDEX = "index";
	private final static org.slf4j.Logger logger = LoggerFactory
			.getLogger(BaseController.class);

	private final ShareCasesService shareCasesService;
	private final UserService userService;

	@Autowired
	public BaseController(ShareCasesService shareCasesService, UserService userService) {
		this.shareCasesService = shareCasesService;
		this.userService = userService;
	}

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// public String welcome(ModelMap model) {
	//
	// ConfigurableApplicationContext context = new
	// ClassPathXmlApplicationContext("applicationContext.xml");
	// DonatorDAO donatorDAO = (DonatorDAO) context.getBean("donatorDAO");
	//
	// Donator customer = new Donator("Visitha", 28);
	// donatorDAO.insert(customer);
	//
	// Donator customer1 = donatorDAO.findByCustomerId(1);
	// System.out.println(customer1.getName());
	//
	//
	// model.addAttribute("message", "Welcome");
	// model.addAttribute("counter", customer1.getName());
	// logger.debug("[welcome] counter : {}", customer1.getName());
	//
	// // Spring uses InternalResourceViewResolver and return back index.jsp
	// return VIEW_INDEX;
	//
	// }
	//
	// @RequestMapping(value = "/{name}", method = RequestMethod.GET)
	// public String welcomeName(@PathVariable String name, ModelMap model) {
	//
	// model.addAttribute("message", "Welcome " + name);
	// model.addAttribute("counter", ++counter);
	// logger.debug("[welcomeName] counter : {}", counter);
	// return VIEW_INDEX;
	//
	// }
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		model.setViewName("login");

		return model;

	}

	@RequestMapping(value = { "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title",
				"Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		List<ShareCase> finalShareCaseList = new ArrayList<ShareCase>();
		
		String logginUser = "";
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			logginUser = userDetail.getUsername();	
			model.addObject("username", userDetail.getUsername());
		}
		
		List<String> currentUserRoles = this.userService.getUserRoles(logginUser);
		
		for(String role : currentUserRoles){
			if(role.equalsIgnoreCase("ROLE_DONATOR")){
				List<ShareCase> shareCaseList = this.shareCasesService.getAllRefugeeShareCases();
				finalShareCaseList.addAll(shareCaseList);
			}else if(role.equalsIgnoreCase("ROLE_REFUGEE")){
				List<ShareCase> shareCaseList = this.shareCasesService.getAllDonationShareCases();
				finalShareCaseList.addAll(shareCaseList);
			}else if(role.equalsIgnoreCase("ROLE_BUYER")){
				List<ShareCase> shareCaseList = this.shareCasesService.getAllSellShareCases();
				finalShareCaseList.addAll(shareCaseList);
			}else if(role.equalsIgnoreCase("ROLE_SELLER")){
				List<ShareCase> shareCaseList = this.shareCasesService.getAllBuyShareCases();
				finalShareCaseList.addAll(shareCaseList);
			}
		}
//		List<ShareCase> shareCaseList = new ArrayList<ShareCase>();
//		shareCaseList = this.shareCasesService
//				.getShareCasesByUserName(logginUser);
		model.addObject("shareCasesList", finalShareCaseList);
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title",
				"Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}