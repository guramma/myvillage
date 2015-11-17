package com.ssis.village.user.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.MessageDto;
import com.ssis.village.model.SarpanchUserComments;
import com.ssis.village.model.Sarpanches;
import com.ssis.village.model.Users;

@Controller
@RequestMapping("/user")
public class SarpanchesController extends CommonController implements CommonMessages {
	
	@RequestMapping("/all-sarpanches")
	public String emailInbox(Model model,Principal principal){
		
		List<Sarpanches> sarpanches = genericService.getAllByOrder(Sarpanches.class,"sarpanchStartDate");
		model.addAttribute("sarpanches",sarpanches);
		model.addAttribute("sarpanchactive",true);
		return "user/sarpanch/allsarpanches";
	}
	
	
	@RequestMapping("/view-sarpanch-info")
	public String emailInbox(@RequestParam Integer sarpanchId,Model model,Principal principal){
		Sarpanches sarpanch = genericService.getInfoById(Sarpanches.class, sarpanchId, "sarpanchId");
		List<SarpanchUserComments> sarpanchComments = genericService.getOrderDetailsById(SarpanchUserComments.class,sarpanchId,"sarpanches.sarpanchId","commentDate");
		model.addAttribute("sarpanch",sarpanch);
		model.addAttribute("sarpanchComments",sarpanchComments);
		model.addAttribute("sarpanchactive",true);
		return "user/sarpanch/viewsarpanchinfo";
	}
	
	@RequestMapping("/user-rating-sapranch")
	public @ResponseBody MessageDto userratingsapranch(@RequestParam Integer sarpanchId,@RequestParam double userrating, Model model,Principal principal){
		MessageDto messageDto = new MessageDto();
		Sarpanches sarpanch = genericService.getInfoById(Sarpanches.class, sarpanchId, "sarpanchId");
		if(sarpanch!=null){
			Integer totalusers =  sarpanch.getTotalPersons()+1;
			double totaluserRating = sarpanch.getTotalUsersRating()+userrating;
			double totalRating = totaluserRating/totalusers;
			Integer result = sarpanchService.updateUserRating(totalusers,totaluserRating,totalRating,sarpanchId);
			if(result!=null){
				messageDto.setStatus("success");
				messageDto.setMessage(USERRATINGSUCCESS);
			}
		}
		return messageDto;
	}
	
	
	@RequestMapping("/user-comment")
	public String usercomment(@ModelAttribute SarpanchUserComments comments,Principal principal,final RedirectAttributes redirectAttributes){
		
		Users users = genericService.getUserByName(Users.class,principal.getName());
		if(users!=null){
			comments.setCommentDate(new Date());
			comments.setSarpanches(new Sarpanches(comments.getSarpanchId()));
			comments.setUserName(users.getFirstName()+" "+users.getLastName());
			comments.setUserProfileModifiedName(users.getUserProfileModifiedName());
			Integer result = genericService.save(comments);
			if(result!=null){
				redirectAttributes.addFlashAttribute("successmessage", USERCOMMENTSUCCESS);
			}
		}
		
		return "redirect:/user/view-sarpanch-info?sarpanchId="+comments.getSarpanchId();
	}
	
	
	
	
	
	
	
	
}
