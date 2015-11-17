package com.ssis.village.user.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.AutoCompleteDto;
import com.ssis.village.dto.MessageDto;
import com.ssis.village.dto.PostYourAdsDto;
import com.ssis.village.model.GkpBookRequests;
import com.ssis.village.model.PostAdUserLikes;
import com.ssis.village.model.PostYourAd;
import com.ssis.village.model.PostYourAdAttachments;
import com.ssis.village.model.PostYourAdComments;
import com.ssis.village.model.Users;

@Controller
@RequestMapping("/user")
public class GkpBookController extends CommonController implements CommonMessages {
	
	@RequestMapping(value="/get-gkp-book",method={RequestMethod.GET,RequestMethod.POST})
	public String getgkpbook(Model model,Principal principal,HttpServletRequest request){
		List<AutoCompleteDto> autoCompleteDtos = new ArrayList<AutoCompleteDto>();
		List<Users> users = genericService.getAll(Users.class);
		if(users!=null && users.size()>0){
			for(Users user : users){
				if(!user.getEmail().equals(principal.getName())){
					AutoCompleteDto  autoCompleteDto = new AutoCompleteDto();
					autoCompleteDto.setLabel(user.getEmail());
					autoCompleteDto.setValue(user.getEmail());
					autoCompleteDto.setDesc(user.getFirstName()+" "+user.getLastName());
					autoCompleteDto.setIcon(user.getUserProfileModifiedName());
					autoCompleteDtos.add(autoCompleteDto);
				}
				
			}
			
		}
		
		if(request.getSession().getAttribute("sessionPostYourAds")!=null){
			request.getSession().removeAttribute("sessionPostYourAds");
		}
		
		Gson gson = new Gson();
		String data = gson.toJson(autoCompleteDtos);
		System.out.println(data);
		model.addAttribute("data", data);
		List<PostYourAd> postYourAds = gkpBookService.getPostAds(principal.getName());
		if(postYourAds!=null && postYourAds.size()>0){
			List<PostYourAd> postYourAdses = new ArrayList<PostYourAd>();
			if(postYourAds!=null){
				// int count =1;
				for(PostYourAd postYourAd : postYourAds){
					if(postYourAd!=null){
						/*if(count<=4)
			        	{*/
							List<PostYourAdAttachments> attachments = genericService.getDetailsById(PostYourAdAttachments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId");
							postYourAd.setPostYourAdAttachments(attachments);
							List<PostYourAdComments> comments = genericService.getOrderDetailsById(PostYourAdComments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId","commentDate");
							postYourAd.setPostYourAdComments(comments);
							List<PostAdUserLikes> postAdUserLikes = genericService.getDetailsById(PostAdUserLikes.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId");
							postYourAd.setPostAdUserLikes(postAdUserLikes);
							postYourAdses.add(postYourAd);
			        	}
					/*}else
		        	{
		        		break;
		        	}
		        	      count++;*/
				}
				
				
			}
			
			model.addAttribute("postYourAds",postYourAdses);
		    request.getSession().setAttribute("sessionPostYourAds",postYourAds);
		}else {
			model.addAttribute("successmessage",USERPOSTINFOMESSAGE);
		}
		
		model.addAttribute("gkpbookactive",true);
		return "user/gkpbook/gkpbooklist";
	}
	
	@RequestMapping(value="/search-user-posts",method={RequestMethod.GET,RequestMethod.POST})
	public String searchuserposts(@ModelAttribute Users userses, Model model,Principal principal,HttpServletRequest request){
		List<AutoCompleteDto> autoCompleteDtos = new ArrayList<AutoCompleteDto>();
		List<Users> users = genericService.getAll(Users.class);
		if(users!=null && users.size()>0){
			for(Users user : users){
				if(!user.getEmail().equals(principal.getName())){
					AutoCompleteDto  autoCompleteDto = new AutoCompleteDto();
					autoCompleteDto.setLabel(user.getEmail());
					autoCompleteDto.setValue(user.getEmail());
					autoCompleteDto.setDesc(user.getFirstName()+" "+user.getLastName());
					autoCompleteDto.setIcon(user.getUserProfileModifiedName());
					autoCompleteDtos.add(autoCompleteDto);
				}
				
			}
			
		}
		Integer datacount = 0;
		Gson gson = new Gson();
		String data = gson.toJson(autoCompleteDtos);
		System.out.println(data);
		model.addAttribute("data", data);
		List<PostYourAd> postYourAdsess = gkpBookService.getPostAds(principal.getName());
		if(postYourAdsess!=null && postYourAdsess.size()>0){
			for(PostYourAd postYourAd : postYourAdsess){
				if(postYourAd.getSenderEmail().equals(userses.getEmail())){
					datacount = datacount+1;
				}
			}
		}
		
		
		
		if(datacount>0){
			List<PostYourAd> postYourAds = genericService.getDetailsByEmail(PostYourAd.class, userses.getEmail(),"senderEmail");
			List<PostYourAd> postYourAdses = new ArrayList<PostYourAd>();
			if(postYourAds!=null){
				for(PostYourAd postYourAd : postYourAds){
					if(postYourAd!=null){
							List<PostYourAdAttachments> attachments = genericService.getDetailsById(PostYourAdAttachments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId");
							postYourAd.setPostYourAdAttachments(attachments);
							List<PostYourAdComments> comments = genericService.getOrderDetailsById(PostYourAdComments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId","commentDate");
							postYourAd.setPostYourAdComments(comments);
							List<PostAdUserLikes> postAdUserLikes = genericService.getDetailsById(PostAdUserLikes.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId");
							postYourAd.setPostAdUserLikes(postAdUserLikes);
							postYourAdses.add(postYourAd);
			        	}
				}
			}
			
			model.addAttribute("postYourAds",postYourAdses);
		}else{
			model.addAttribute("successmessage",USERSEARCHINFOMESSAGE);
		}
		
		model.addAttribute("gkpbookactive",true);
		return "user/gkpbook/gkpbooklist";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/get-all-bookusers",method={RequestMethod.GET,RequestMethod.POST})
	public String getallbookusers(Model model,Principal principal){
		List<AutoCompleteDto> autoCompleteDtos = new ArrayList<AutoCompleteDto>();
		List<Users> users = genericService.getAll(Users.class);
		List<GkpBookRequests> requestUsers = gkpBookService.getBookRequestByUserName(principal.getName());
		List<String> emails = new ArrayList<String>();
		Set<Users> userses = new HashSet<Users>();
		List<String> allemails = gkpBookService.getAllEmails(principal.getName());
		List<String> allfromemails = gkpBookService.getAllFromEmails(principal.getName());
		
		for(GkpBookRequests bookRequests : requestUsers){
		for(Users users2 : users){
			if(!(users2.getEmail().equalsIgnoreCase(principal.getName()))){
					if(bookRequests.getBookTo().equalsIgnoreCase(users2.getEmail())){
						if(emails.contains(users2.getEmail())){
						}else{
							emails.add(bookRequests.getBookTo());
							users2.setRequestedDate(bookRequests.getRequestedDate());
							users2.setStatus(true);
							userses.add(users2);
						}
					}
				}
			}
		}
		
		
		for(Users users2 : users){
			if(!(users2.getEmail().equalsIgnoreCase(principal.getName()))){
				if(emails.contains(users2.getEmail())){
				}else{
					if(!(allemails.contains(users2.getEmail())) && !(allfromemails.contains(users2.getEmail()))){
						users2.setStatus(false);
						userses.add(users2);	
					}else{
						
					}
					
				}
			}
		 }
		

		if(users!=null && users.size()>0){
			for(Users user : users){
				if(!user.getEmail().equals(principal.getName())){
					AutoCompleteDto  autoCompleteDto = new AutoCompleteDto();
					autoCompleteDto.setLabel(user.getEmail());
					autoCompleteDto.setValue(user.getEmail());
					autoCompleteDto.setDesc(user.getFirstName()+" "+user.getLastName());
					autoCompleteDto.setIcon(user.getUserProfileModifiedName());
					autoCompleteDtos.add(autoCompleteDto);
				}
				
			}
			
		}
		
		Gson gson = new Gson();
		String data = gson.toJson(autoCompleteDtos);
		System.out.println(data);
		model.addAttribute("data", data);
		model.addAttribute("users", userses);
		
		
		
		
		return "user/gkpbook/gkpbookuserslist";
	}
	
	
	@RequestMapping(value="/send-gkpbook-friend-request",method={RequestMethod.GET,RequestMethod.POST})
	public String sendgkpbookfriendrequest(@RequestParam String friendEmail, Model model,Principal principal){
		
		GkpBookRequests bookRequests = new GkpBookRequests();
		bookRequests.setAccepted(false);
		bookRequests.setBookFrom(principal.getName());
		bookRequests.setBookTo(friendEmail);
		bookRequests.setRequest(true);
		bookRequests.setRequestedDate(new Date());
		Integer result = genericService.save(bookRequests);
		if(result!=null){
			return "redirect:/user/get-all-bookusers";
		}
		
		return null;
	}
	
	
	
	@RequestMapping(value="/post-your-ad",method={RequestMethod.GET,RequestMethod.POST})
	public String postyourad(Model model,Principal principal){
		List<AutoCompleteDto> autoCompleteDtos = new ArrayList<AutoCompleteDto>();
		List<Users> users = genericService.getAll(Users.class);
		if(users!=null && users.size()>0){
			for(Users user : users){
				if(!user.getEmail().equals(principal.getName())){
					AutoCompleteDto  autoCompleteDto = new AutoCompleteDto();
					autoCompleteDto.setLabel(user.getEmail());
					autoCompleteDto.setValue(user.getEmail());
					autoCompleteDto.setDesc(user.getFirstName()+" "+user.getLastName());
					autoCompleteDto.setIcon(user.getUserProfileModifiedName());
					autoCompleteDtos.add(autoCompleteDto);
				}
				
			}
			
		}
		
		Gson gson = new Gson();
		String data = gson.toJson(autoCompleteDtos);
		System.out.println(data);
		model.addAttribute("data", data);
		
		model.addAttribute("gkpbookactive",true);
		return "user/gkpbook/postyourad";
	}
	
	@RequestMapping(value="/save-post-your-ad",method={RequestMethod.GET,RequestMethod.POST})
	public String savepostyourad(@ModelAttribute PostYourAdsDto postYourAdsDto,Principal principal,final RedirectAttributes redirectAttributes){
		Users user = genericService.getUserByName(Users.class, principal.getName());
		if(user!=null){
			Integer result = gkpBookService.savePostYourAd(postYourAdsDto,user);
			if(result!=null){
				redirectAttributes.addFlashAttribute("successmessage",POSTYOURADSUCCESS);
			}
		}
		
		return "redirect:/user/post-your-ad";
	}
	
	
	@RequestMapping(value="/save-comments",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto savecomments(@RequestParam Integer postId, @RequestParam String comment,Principal principal,final RedirectAttributes redirectAttributes){
		MessageDto messageDto = new MessageDto();
		Users user = genericService.getUserByName(Users.class, principal.getName());
		if(user!=null){
			
			PostYourAdComments postYourAdComments = new PostYourAdComments();
			postYourAdComments.setCommentDate(new Date());
			postYourAdComments.setComments(comment);
			postYourAdComments.setPostYourAd(new PostYourAd(postId));
			postYourAdComments.setUserName(user.getFirstName()+" "+user.getLastName());
			postYourAdComments.setUserProfileModifiedName(user.getUserProfileModifiedName());
			
			Integer result = genericService.save(postYourAdComments);
			if(result!=null){
				messageDto.setStatus("success");
			}
		}
		
		return messageDto;
	}
	
	@RequestMapping(value="/accept-request",method={RequestMethod.GET,RequestMethod.POST})
	public String acceptrequest(@RequestParam String userFromemail, @RequestParam String userToemail,Principal principal,final RedirectAttributes redirectAttributes){
			Integer result = gkpBookService.updateAccept(userFromemail,userToemail);
			if(result!=null){
				redirectAttributes.addFlashAttribute("successmessage",USERREQUESTACCEPTEDSUCCESS);
			}
		
		return "redirect:/user/dashboard";
	}
	
	@RequestMapping(value="/reject-request",method={RequestMethod.GET,RequestMethod.POST})
	public String rejectrequest(@RequestParam String userFromemail, @RequestParam String userToemail,Principal principal,final RedirectAttributes redirectAttributes){
		gkpBookService.rejectuserrequest(userFromemail,userToemail);
		redirectAttributes.addFlashAttribute("successmessage",USERREQUESTREJECTEDSUCCESS);
		
		return "redirect:/user/dashboard";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/morePostAdsResults",method=RequestMethod.GET)
	public String moreUserResults(HttpSession session,Model model,@RequestParam("i") Integer i,HttpServletRequest request) throws JAXBException, IOException{
		Integer begin = i*5;
		Integer end = begin+4;
		model.addAttribute("begin", begin-1);
		model.addAttribute("end", end);
		List<PostYourAd> postYourAds = (List<PostYourAd>)session.getAttribute("sessionPostYourAds");
		List<PostYourAd> postYourAdses = new ArrayList<PostYourAd>();
		if(postYourAds!=null){
			int count = 1;
			for(PostYourAd postYourAd : postYourAds){
				if(postYourAd!=null){
					if(count>=begin && count<=end)
		        	{
						List<PostYourAdAttachments> attachments = genericService.getDetailsById(PostYourAdAttachments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId");
						postYourAd.setPostYourAdAttachments(attachments);
						List<PostYourAdComments> comments = genericService.getOrderDetailsById(PostYourAdComments.class, postYourAd.getPostYourAdId(),"postYourAd.postYourAdId","commentDate");
						postYourAd.setPostYourAdComments(comments);
						postYourAdses.add(postYourAd);
		        	}
				}
	        	  count++;
			}
		}
		model.addAttribute("postYourAds",postYourAdses);
		return "user/gkpbook/morepostyourad";
	}
	
	@RequestMapping(value="/more-ad-images",method={RequestMethod.GET,RequestMethod.POST})
	public String moreadimages(@RequestParam Integer postAdId,Model model,Principal principal){
		
		List<AutoCompleteDto> autoCompleteDtos = new ArrayList<AutoCompleteDto>();
		List<Users> users = genericService.getAll(Users.class);
		if(users!=null && users.size()>0){
			for(Users user : users){
				if(!user.getEmail().equals(principal.getName())){
					AutoCompleteDto  autoCompleteDto = new AutoCompleteDto();
					autoCompleteDto.setLabel(user.getEmail());
					autoCompleteDto.setValue(user.getEmail());
					autoCompleteDto.setDesc(user.getFirstName()+" "+user.getLastName());
					autoCompleteDto.setIcon(user.getUserProfileModifiedName());
					autoCompleteDtos.add(autoCompleteDto);
				}
				
			}
			
		}
		
		Gson gson = new Gson();
		String data = gson.toJson(autoCompleteDtos);
		System.out.println(data);
		model.addAttribute("data", data);
		PostYourAd postYourAds = genericService.getInfoById(PostYourAd.class, postAdId, "postYourAdId");
		List<PostYourAdAttachments> attachments = genericService.getDetailsById(PostYourAdAttachments.class, postAdId,"postYourAd.postYourAdId");
		List<PostYourAdComments> comments = genericService.getOrderDetailsById(PostYourAdComments.class, postAdId,"postYourAd.postYourAdId","commentDate");
		List<PostAdUserLikes> postAdUserLikes = genericService.getDetailsById(PostAdUserLikes.class, postAdId,"postYourAd.postYourAdId");
		model.addAttribute("postYourAds",postYourAds);
		model.addAttribute("attachments",attachments);
		model.addAttribute("comments",comments);
		model.addAttribute("postAdUserLikes",postAdUserLikes);
		model.addAttribute("gkpbookactive",true);
		
		return "user/gkpbook/gkpmorebooklist";
	}
	
	
	
	
	@RequestMapping(value="/save-likes",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto savelikes(@RequestParam Integer postId,Principal principal,final RedirectAttributes redirectAttributes){
		MessageDto messageDto = new MessageDto();
		Users user = genericService.getUserByName(Users.class, principal.getName());
		if(user!=null){
			PostAdUserLikes postAdUserLikes = new PostAdUserLikes();
			postAdUserLikes.setPostYourAd(new PostYourAd(postId));
			postAdUserLikes.setEmail(user.getEmail());
			postAdUserLikes.setUserName(user.getFirstName()+" "+user.getLastName());
			postAdUserLikes.setUserProfileModifiedName(user.getUserProfileModifiedName());
			Integer result = genericService.save(postAdUserLikes);
			if(result!=null){
				messageDto.setStatus("success");
			}
		}
		
		return messageDto;
	}
}
