package com.ssis.village.front.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.model.Users;

@Controller
public class HomeController extends CommonController implements CommonMessages {
	
	private static Logger logger = Logger.getLogger(HomeController.class);
	
	@RequestMapping(value="/",method={RequestMethod.GET,RequestMethod.POST})
	public String homePage(Model model){
		logger.info("Inside First Home Page");
		return "front/homepage";
	}
	
	@RequestMapping(value="/login",method={RequestMethod.GET,RequestMethod.POST})
	public String loginPage(Model model){
		logger.info("Inside Login Page");
		return "front/loginpage";
	}
	
	@RequestMapping(value="/sign-up",method={RequestMethod.GET,RequestMethod.POST})
	public String signup(Model model){
		logger.info("Inside Sign-Up Page");
		return "front/signuppage";
	}
	
	@RequestMapping(value="/logout",method={RequestMethod.GET,RequestMethod.POST})
	public String logout(Model model){
		logger.info("Inside Sign-Up Page");
		return "redirect:/";
	}
	
	
	/*@RequestMapping(value="/registration-process",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto registrationprocess(@ModelAttribute Users users,MultipartHttpServletRequest servletRequest,Model model){
		logger.info("Inside Sign-Up Page");
		MessageDto messageDto = new MessageDto();
		MultipartFile multipartFile = servletRequest.getFile("file");
		System.out.println(multipartFile.getOriginalFilename());
		Integer result = genericService.saveUserDetails(users);
		if(result!=null){
			messageDto.setStatus("success");
			messageDto.setMessage(USERREGISTRATIONSUCCESS);
		}else{
			messageDto.setStatus("failure");
			messageDto.setMessage(USERREGISTRATIONFAILURE);
		}
		
		
		return messageDto;
	}
*/
	
	@RequestMapping(value="/registration-process",method={RequestMethod.GET,RequestMethod.POST})
	public String registrationprocess(@ModelAttribute Users users, Model model){
		logger.info("Inside Sign-Up Page");
		Integer result = genericService.saveUserDetails(users);
		if(result!=null){
			model.addAttribute("email", users.getEmail());
			model.addAttribute("password", users.getPassword());
			model.addAttribute("message", USERREGISTRATIONSUCCESS);
			model.addAttribute("users", users);
			
			return "front/dummysignuppage";
		}else{
		}
		return "redirect:/sign-up";
	}	
	
	@RequestMapping(value="/test",method={RequestMethod.GET,RequestMethod.POST})
	public String test() throws FileNotFoundException{
		
		String website = "https://hostiorg3y.cloudconvert.com/download/DpfdtHiXQG6WskAMaqEY";
		boolean exists = (new File(context.getRealPath("/test/"))).exists();
		if (!exists) {
			new File(context.getRealPath("/test/")).mkdir();
		}
		String modifiedFilePath =context.getRealPath("/test/"+File.separator+"jannatein.mp4");
		File file = new File(modifiedFilePath);
		try{
	         
	         System.out.println("Downloading File From: " + website);
	         URL url = new URL(website);
	         InputStream inputStream = url.openStream();
	         OutputStream outputStream = new FileOutputStream(file);
	         byte[] buffer = new byte[2048];
	         
	         int length = 0;
	         
	         while ((length = inputStream.read(buffer)) != -1) {
	            System.out.println("Buffer Read of length: " + length);
	            outputStream.write(buffer, 0, length);
	         }
	         
	         inputStream.close();
	         outputStream.close();
	         
	      }catch(Exception e){
	         System.out.println("Exception: " + e.getMessage());
	      }

		return "redirect:/sign-up";
	}
	
	@RequestMapping(value="/facebooksignup",method={RequestMethod.GET,RequestMethod.POST})
	public String facebooksignup(@RequestParam String firstName,@RequestParam String lastName,@RequestParam String email,Model model){
		logger.info("Inside Sign-Up Page");
		model.addAttribute("firstName",firstName);
		model.addAttribute("lastName",lastName);
		model.addAttribute("email",email);
		return "front/signuppage";
	}
	
	
	
	
	
	
}
