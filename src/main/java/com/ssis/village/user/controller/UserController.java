package com.ssis.village.user.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.FestivalDto;
import com.ssis.village.dto.PasswordDto;
import com.ssis.village.model.Sarpanches;
import com.ssis.village.model.Users;

@Controller
@RequestMapping("/user")
public class UserController extends CommonController implements CommonMessages {
	
	@RequestMapping(value="/loginSuccess1")
	public @ResponseBody String loginSuccess1()
	{
		return "/user/dashboard";
	}
	
	@RequestMapping(value="/dashboard",method={RequestMethod.GET,RequestMethod.POST})
	public String userDashboard(Model model,Principal principal){
		List<Sarpanches> sarpanches = genericService.getAllByOrder(Sarpanches.class,"sarpanchStartDate");
		model.addAttribute("sarpanches",sarpanches);
		List<FestivalDto> festivalImages = festivalService.getAllFestivalImages();
		if(festivalImages!=null && festivalImages.size()>0){
			model.addAttribute("festivalImages", festivalImages);
		}
		model.addAttribute("dashboardactive", true);
		List<Users> users = gkpBookService.getRequestedUsersLitByUserName(principal.getName());
		System.out.println(users.size());
		if(users!=null && users.size()>0){
			model.addAttribute("users", users);
		}
		return "user/dashboard";
	}
	
	@RequestMapping(value="/alerts-information",method={RequestMethod.GET,RequestMethod.POST})
	public String alertsinformation(Model model){
		model.addAttribute("dashboardactive", true);
		return "user/alertinfo";
	}
	
	@RequestMapping(value="/my-profile",method={RequestMethod.GET,RequestMethod.POST})
	public String myprofile(Model model,Principal principal){
		model.addAttribute("dashboardactive", true);
		if(principal!=null){
			Users user = genericService.getUserByName(Users.class, principal.getName());
			if(user!=null){
				model.addAttribute("user", user);
			}
		}
		return "user/myprofile";
	}
	
	@RequestMapping(value="/edit-user-profile",method={RequestMethod.GET,RequestMethod.POST})
	public String edituserprofile(Model model,Principal principal){
		model.addAttribute("dashboardactive", true);
		if(principal!=null){
			Users user = genericService.getUserByName(Users.class, principal.getName());
			if(user!=null){
				model.addAttribute("user", user);
			}
		}
		return "user/editprofile";
	}
	
	
	@RequestMapping(value="/update-user-profile",method={RequestMethod.GET,RequestMethod.POST})
	public String updateuserprofile(@ModelAttribute Users users, Model model,final RedirectAttributes redirectAttributes){
		model.addAttribute("dashboardactive", true);
		Integer result = userService.updateUserProfile(users);
		if(result!=null){
			redirectAttributes.addFlashAttribute("successmessage", USERPROFILEUPDATEDSUCCESS);
		}
		return "redirect:/user/my-profile";
	}
	
	
	@RequestMapping(value="/change-password",method={RequestMethod.GET,RequestMethod.POST})
	public String changepassword(Model model,Principal principal){
		model.addAttribute("dashboardactive", true);
		if(principal!=null){
			Users user = genericService.getUserByName(Users.class, principal.getName());
			if(user!=null){
				model.addAttribute("user", user);
			}
		}
		return "user/changepassword";
	}
	
	@RequestMapping(value="/update-user-password",method={RequestMethod.GET,RequestMethod.POST})
	public String updateuserpassword(@ModelAttribute PasswordDto passwordDto, Model model,Principal principal,final RedirectAttributes redirectAttributes){
		model.addAttribute("dashboardactive", true);
		if(principal!=null){
			passwordDto.setUseremail(principal.getName());
			Integer result = userService.updateUserPassword(passwordDto);
			if(result!=null){
				redirectAttributes.addFlashAttribute("successmessage", USERNEWPASSWORDUPDATEDSUCCESS);
			}
		}
		return "redirect:/user/my-profile";
	}
}
