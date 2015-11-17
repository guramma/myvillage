package com.ssis.village.user.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.MessageDto;
import com.ssis.village.model.Emails;
import com.ssis.village.model.EmailsAttached;

@Controller
@RequestMapping("/user")
public class EmailController extends CommonController implements CommonMessages {
	
	@RequestMapping("/emailinbox")
	public String emailInbox(Model model,Principal principal){
		List<Emails> emails = emailService.getEmailsByUserName(principal.getName());
		model.addAttribute("emails",emails);
		model.addAttribute("emailsactive",true);
		return "user/emails/allEmails";
		
	}
	
	@RequestMapping("/composeemail")
	public String composeemail(Model model,Principal principal){
		List<String> allemails = emailService.getAllEmails(principal.getName());
		model.addAttribute("allemails",allemails);
		model.addAttribute("emailsactive",true);
		return "user/emails/composeemail";
		
	}
	
	
	
	@RequestMapping(value="/sendemail",method=RequestMethod.POST)
	public String sendemail(@ModelAttribute Emails emails, Model model,final RedirectAttributes redirectAttributes,Principal principal) throws IOException{
		emails.setSenderEmail(principal.getName());
		List<EmailsAttached> emailsAttacheds = new ArrayList<EmailsAttached>();
		if(emails.getFiles()!=null){
			for(MultipartFile file : emails.getFiles()){
				if(StringUtils.hasText(file.getOriginalFilename())){
					EmailsAttached attached = new EmailsAttached();
					String fileName = file.getOriginalFilename();
					String modifiedFileName = FilenameUtils.getBaseName(fileName)+ "_"+ System.currentTimeMillis()+ "."	+ FilenameUtils.getExtension(fileName);
					File emailfile = uploadPathService.getFilesPath(modifiedFileName,"emailattchments");
					try {
						FileUtils.writeByteArrayToFile(emailfile,file.getBytes());
					} catch (IOException e) {
						e.printStackTrace();
					}
					attached.setEmailImageName(fileName);
					attached.setEmailImageModifiedName(modifiedFileName);
					emailsAttacheds.add(attached);	
					
				}
				
			}
		}
		
		emails.setInbox(true);
		emails.setReaded(false);
		emails.setSended(true);
		emails.setCreatedDate(new Date());
		emails.setSenderDeleteStatus(false);
		emails.setReceiverDeleteStatus(false);
		
		
		if(emails.getEmails().size()>0){
			for(String email : emails.getEmails()){
				emails.setRecieveremail(email);
				emailService.saveEmails(emails,emailsAttacheds);
			}
			redirectAttributes.addFlashAttribute("successmessage",EMAILINFOSENTSUCCESS);
		}
		
		return "redirect:/user/emailinbox";
		
	}
	
	@RequestMapping("/viewemail/{emailId}")
	public String viewemail(@PathVariable Integer emailId,Model model){
		Emails emails = emailService.changeReadable(emailId);
		model.addAttribute("email",emails);
		model.addAttribute("emailsactive",true);
		return "user/emails/viewemail";
	}
	
	
	@RequestMapping("/view-sent-email/{emailId}")
	public String viewsentemail(@PathVariable Integer emailId,Model model){
		Emails emails = genericService.getInfoById(Emails.class, emailId, "emailId");
		model.addAttribute("email",emails);
		model.addAttribute("emailsactive",true);
		return "user/emails/viewsentemail";
	}
	
	
	
	
	@RequestMapping("/all-sent-emails")
	public String viewemail(Model model,Principal principal){
		List<Emails> emails = emailService.getSendEmailsByUserName(principal.getName());
		model.addAttribute("emails",emails);
		model.addAttribute("emailsactive",true);
		return "user/emails/allSentEmails";
	}
	
	
	
	@RequestMapping("/reply-email")
	public String replyemail(@RequestParam Integer emailId,Model model){
		Emails emails = emailService.changeReadable(emailId);
		model.addAttribute("email",emails);
		model.addAttribute("emailsactive",true);
		return "user/emails/replyEmail";
	}
	
	
	@RequestMapping(value="/receiver-email-delete-by-id",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto receiveremaildeletebyid(@RequestParam Integer emailId){
		MessageDto messageDto = new MessageDto();
		if(emailId!=null){
		Emails emails = genericService.getInfoById(Emails.class, emailId, "emailId");
		if(emails!=null){
			if(emails.isSenderDeleteStatus()){
				List<EmailsAttached> emailsAttacheds = genericService.getDetailsById(EmailsAttached.class, emailId, "emails.emailId");
				if(emailsAttacheds!=null && emailsAttacheds.size()>0){
					for(EmailsAttached emailsAttached : emailsAttacheds){
						if(StringUtils.hasText(emailsAttached.getEmailImageModifiedName())){
							File filePath = new File(context.getRealPath("/emailattchments/"+emailsAttached.getEmailImageModifiedName()));
							if(filePath.exists()){
								filePath.delete();
							}
						}
						genericService.delete(EmailsAttached.class, emailsAttached.getEmailAttachedId());
					}
				}
				genericService.delete(Emails.class, emailId);
				messageDto.setStatus("success");
				messageDto.setMessage(EMAILINFODELETEDSUCCESS);
				
			}else{
				emailService.updateEmailStatusById(emailId,"receiver");
				messageDto.setStatus("success");
				messageDto.setMessage(EMAILINFODELETEDSUCCESS);
			}
		}
	}
		return messageDto;
	}
	
	
	
	
	@RequestMapping(value="/sender-email-delete-by-id",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto senderemaildeletebyid(@RequestParam Integer emailId){
		MessageDto messageDto = new MessageDto();
		if(emailId!=null){
		Emails emails = genericService.getInfoById(Emails.class, emailId, "emailId");
		if(emails!=null){
			if(emails.isReceiverDeleteStatus()){
				List<EmailsAttached> emailsAttacheds = genericService.getDetailsById(EmailsAttached.class, emailId, "emails.emailId");
				if(emailsAttacheds!=null && emailsAttacheds.size()>0){
					for(EmailsAttached emailsAttached : emailsAttacheds){
						if(StringUtils.hasText(emailsAttached.getEmailImageModifiedName())){
							File filePath = new File(context.getRealPath("/emailattchments/"+emailsAttached.getEmailImageModifiedName()));
							if(filePath.exists()){
								filePath.delete();
							}
						}
						genericService.delete(EmailsAttached.class, emailsAttached.getEmailAttachedId());
					}
				}
				genericService.delete(Emails.class, emailId);
				messageDto.setStatus("success");
				messageDto.setMessage(EMAILINFODELETEDSUCCESS);
				
			}else{
				emailService.updateEmailStatusById(emailId,"sender");
				messageDto.setStatus("success");
				messageDto.setMessage(EMAILINFODELETEDSUCCESS);
			}
		}
	}
		return messageDto;
	}
	
	
		
	@RequestMapping(value="/download-email-attachement",method={RequestMethod.GET,RequestMethod.POST})
	public String downloademailattachement(@RequestParam String attachedName,Model model,HttpServletResponse response){
		try
        {
				
		    if (StringUtils.hasText(attachedName)) {
			   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		       BufferedOutputStream zos = new BufferedOutputStream(baos);
		        byte bytes[] = new byte[2048];
		 
		        FileInputStream fis = new FileInputStream(context.getRealPath("/emailattchments/"+File.separator+attachedName));
	            BufferedInputStream bis = new BufferedInputStream(fis);
	 
	            int bytesRead;
	            while ((bytesRead = bis.read(bytes)) != -1) {
	                zos.write(bytes, 0, bytesRead);
	            }
	            bis.close();
	            fis.close();
		        zos.flush();
		        baos.flush();
		        zos.close();
		        baos.close();
		        byte[] zip =  baos.toByteArray();
		        ServletOutputStream sos = response.getOutputStream();
	             response.setContentType("*/*");
	             response.setHeader("Content-Disposition", "attachment; filename="+attachedName);
	             sos.write(zip);
	             sos.flush();
				 }
            }
            catch(IOException ioe)
            {
                    System.out.println("IOException :" + ioe);
            }
			
		return null;
	}
	
	
	
	@RequestMapping(value="/download-all-email-attachements",method={RequestMethod.GET,RequestMethod.POST})
	public String downloadallemailattachements(@RequestParam Integer emailId,Model model,HttpServletResponse response){
			List<EmailsAttached> festivalAttacheds = genericService.getDetailsById(EmailsAttached.class, emailId, "emails.emailId");
			if(festivalAttacheds!=null && festivalAttacheds.size()>0){
				List<String> sourceFiles = new ArrayList<String>();
				for(EmailsAttached emailsAttached : festivalAttacheds){
					if(StringUtils.hasText(emailsAttached.getEmailImageModifiedName())){
						String filePath = emailsAttached.getEmailImageModifiedName();
						sourceFiles.add(filePath);
					}
				}
				
			 String[] files =sourceFiles.toArray(new String[sourceFiles.size()]);
			 downloadAllEmailFilesAsZip(files,"emailattchments","emailAttchments.zip",response);
			}	 
		return null;
	}
	
	private void downloadAllEmailFilesAsZip(String[] files,String path,String zipName,HttpServletResponse response){
		try {
			
			 if (files != null && files.length > 0) {
				 
				 ByteArrayOutputStream baos = new ByteArrayOutputStream();
			        ZipOutputStream zos = new ZipOutputStream(baos);
			        byte bytes[] = new byte[122048];
			 
			        for (String fileName : files) {
			            FileInputStream fis = new FileInputStream(context.getRealPath("/"+path+"/"+File.separator+fileName));
			            BufferedInputStream bis = new BufferedInputStream(fis);
			            zos.putNextEntry(new ZipEntry(fileName));
			 
			            int bytesRead;
			            while ((bytesRead = bis.read(bytes)) != -1) {
			                zos.write(bytes, 0, bytesRead);
			            }
			            zos.closeEntry();
			            bis.close();
			            fis.close();
			        }
			        zos.flush();
			        baos.flush();
			        zos.close();
			        baos.close();
			        
			        byte[] zip =  baos.toByteArray();
			        ServletOutputStream sos = response.getOutputStream();
		             response.setContentType("application/zip");
		             response.setHeader("Content-Disposition", "attachment; filename="+zipName);
		             sos.write(zip);
		             sos.flush();
					 }
				}
		        catch(IOException ioe)
		        {
		                System.out.println("IOException :" + ioe);
		        }
	}
	
	
	
}
