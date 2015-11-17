package com.ssis.village.user.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.FestivalDto;
import com.ssis.village.dto.MessageDto;
import com.ssis.village.model.FestivalImages;
import com.ssis.village.model.FestivalList;
import com.ssis.village.model.FestivalMusics;
import com.ssis.village.model.FestivalVideos;
import com.ssis.village.model.Festivals;
import com.ssis.village.model.Users;

@Controller
@RequestMapping("/user")
public class FestivalController extends CommonController implements CommonMessages{
	
	private static final Logger LOGGER = Logger.getLogger(FestivalController.class);
	
	//All Festival Images, Videos & Musics
	
	@RequestMapping(value="/all-festivals",method={RequestMethod.GET,RequestMethod.POST})
	public String getAllFestivals(Model model){
		LOGGER.info("Inside All Festival Info Page");
		
		List<FestivalDto> festivalDtos = festivalService.getAllFestivalImages();
		if(festivalDtos!=null && festivalDtos.size()>0){
			model.addAttribute("festivalDtos", festivalDtos);
		}
		List<FestivalDto> festivalVideos = festivalService.getAllFestivalvideos();
		if(festivalVideos!=null && festivalVideos.size()>0){
			model.addAttribute("festivalVideos", festivalVideos);
		}
		List<FestivalDto> festivalMusics = festivalService.getAllFestivalMusics();
		if(festivalMusics!=null && festivalMusics.size()>0){
			model.addAttribute("festivalMusics", festivalMusics);
		}
		
		model.addAttribute("festivalsactive", true);
		return "user/festival/allFestivals";
	}
	
	
	//Festival Images Section //
	
		@RequestMapping(value="/all-festival-images",method={RequestMethod.GET,RequestMethod.POST})
		public String allfestivalimages(Model model){
			LOGGER.info("Inside All Festival Images Info Page");
			
			List<FestivalDto> festivalDtos = festivalService.getAllFestivalImages();
			if(festivalDtos!=null && festivalDtos.size()>0){
				model.addAttribute("festivalDtos", festivalDtos);
			}
			model.addAttribute("festivalsactive", true);
			return "user/festival/allFestivalImages";
		}
		
		@RequestMapping(value="/view-festival-images",method={RequestMethod.GET,RequestMethod.POST})
		public String viewfestival(@RequestParam String festivalname,Model model){
			LOGGER.info("Inside View Festival Images Info Page");
			
			List<FestivalImages> festivalImages = festivalService.getFestivalImagesByFestivalName(festivalname);
			if(festivalImages!=null && festivalImages.size()>0){
				model.addAttribute("festivalImages", festivalImages);
				model.addAttribute("festivalName", festivalname);
			}
			model.addAttribute("festivalsactive", true);
			return "user/festival/viewFestivalImages";
		}
		
		
		
		@RequestMapping(value="/download-festival-images",method={RequestMethod.GET,RequestMethod.POST})
		public String downloadfestivalimages(@RequestParam String festivalname,Model model,HttpServletResponse response){
			LOGGER.info("Inside Download All Festival Images as Zip Info Page");
				List<FestivalImages> festivalImages = festivalService.getFestivalImagesByFestivalName(festivalname);
				if(festivalImages!=null && festivalImages.size()>0){
					List<String> sourceFiles = new ArrayList<String>();
					for(FestivalImages festivalImage : festivalImages){
						if(StringUtils.hasText(festivalImage.getFestivalModifiedName())){
							String filePath = festivalImage.getFestivalModifiedName();
							sourceFiles.add(filePath);
						}
					}
					
				 String[] files =sourceFiles.toArray(new String[sourceFiles.size()]);
				 downloadFilesAsZip(files,"festivalImages","festivalImages.zip",response);
				}	 
			return null;
		}
		
		
		
		@RequestMapping(value="/download-festival-image",method={RequestMethod.GET,RequestMethod.POST})
		public String downloadfestivalimage(@RequestParam String festivalname,Model model,HttpServletResponse response){
			try
	        {
					
			    if (StringUtils.hasText(festivalname)) {
				   ByteArrayOutputStream baos = new ByteArrayOutputStream();
			       BufferedOutputStream zos = new BufferedOutputStream(baos);
			        byte bytes[] = new byte[2048];
			 
			        FileInputStream fis = new FileInputStream(context.getRealPath("/festivalImages/"+File.separator+festivalname));
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
		             response.setHeader("Content-Disposition", "attachment; filename="+festivalname);
		             sos.write(zip);
		             sos.flush();
					 }
	            }
	            catch(IOException ioe)
	            {
	                    System.out.println("IOException :" + ioe);
	            }
				
			model.addAttribute("festivalName", festivalname);
			model.addAttribute("festivalsactive", true);
			return null;
		}

	@RequestMapping(value="/all-festival-musics",method={RequestMethod.GET,RequestMethod.POST})
	public String allfestivalmusics(Model model){
		List<FestivalDto> festivalMusics = festivalService.getAllFestivalMusics();
		if(festivalMusics!=null && festivalMusics.size()>0){
			model.addAttribute("festivalMusics", festivalMusics);
		}
		model.addAttribute("festivalsactive", true);
		return "user/festival/allFestivalMusics";
	}
	
	
	@RequestMapping(value="/view-festival-musics",method={RequestMethod.GET,RequestMethod.POST})
	public String viewfestivalmusics(@RequestParam String festivalname,Model model){
		
		List<FestivalMusics> festivalMusics = festivalService.getFestivalMusicsByFestivalName(festivalname);
		if(festivalMusics!=null && festivalMusics.size()>0){
			model.addAttribute("festivalMusics", festivalMusics);
			model.addAttribute("festivalName", festivalname);
		}
		model.addAttribute("festivalsactive", true);
		return "user/festival/viewFestivalMusics";
	}
	
	
	@RequestMapping(value="/download-festival-musics",method={RequestMethod.GET,RequestMethod.POST})
	public String downloadfestivalmusics(@RequestParam String festivalname,Model model,HttpServletResponse response){
		try
        {
				
		    if (StringUtils.hasText(festivalname)) {
		    	System.out.println(festivalname);
			   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		       BufferedOutputStream zos = new BufferedOutputStream(baos);
		        byte bytes[] = new byte[2048];
		        FileInputStream fis = new FileInputStream(context.getRealPath("/festivalMusics/"+File.separator+festivalname));
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
	             response.setHeader("Content-Disposition", "attachment; filename="+festivalname);
	             sos.write(zip);
	             sos.flush();
				 }
            }
            catch(IOException ioe)
            {
                    System.out.println("IOException :" + ioe);
            }
			
		model.addAttribute("festivalName", festivalname);
		model.addAttribute("festivalsactive", true);
		return null;
	}
	
	
	
	@RequestMapping(value="/download-festival-video",method={RequestMethod.GET,RequestMethod.POST})
	public String downloadfestivalvideo(@RequestParam String festivalname,Model model,HttpServletResponse response){
		try
        {
		    if (StringUtils.hasText(festivalname)) {
			   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		       BufferedOutputStream zos = new BufferedOutputStream(baos);
		        byte bytes[] = new byte[122048];
		        FileInputStream fis = new FileInputStream(context.getRealPath("/festivalVideos/"+File.separator+festivalname));
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
	             response.setHeader("Content-Disposition", "attachment; filename="+festivalname);
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
	
	@RequestMapping(value="/download-festival-all-musics",method={RequestMethod.GET,RequestMethod.POST})
	public String downloadfestivalallmusics(@RequestParam String festivalname,Model model,HttpServletResponse response){
			List<FestivalMusics> festivalMusics = festivalService.getFestivalMusicsByFestivalName(festivalname);
			if(festivalMusics!=null && festivalMusics.size()>0){
				List<String> sourceFiles = new ArrayList<String>();
				for(FestivalMusics festivalMusic : festivalMusics){
					if(StringUtils.hasText(festivalMusic.getFestivalModifiedName())){
						String filePath = festivalMusic.getFestivalModifiedName();
						sourceFiles.add(filePath);
					}
				}
			 String[] files =sourceFiles.toArray(new String[sourceFiles.size()]);
			 downloadFilesAsZip(files,"festivalMusics","festivalMusics.zip",response);
            }
        
		return null;
	}

	@RequestMapping(value="/all-festival-videos",method={RequestMethod.GET,RequestMethod.POST})
	public String allfestivalvideos(Model model){
		List<FestivalDto> festivalVideos = festivalService.getAllFestivalvideos();
		if(festivalVideos!=null && festivalVideos.size()>0){
			model.addAttribute("festivalVideos", festivalVideos);
		}
		model.addAttribute("festivalsactive", true);
		return "user/festival/allFestivalVideos";
	}
	
	@RequestMapping(value="/view-festival-videos",method={RequestMethod.GET,RequestMethod.POST})
	public String viewfestivalvideos(@RequestParam String festivalname,Model model){
		List<FestivalVideos> festivalVideos = festivalService.getFestivalVideosByFestivalName(festivalname);
		if(festivalVideos!=null && festivalVideos.size()>0){
			model.addAttribute("festivalVideos", festivalVideos);
			model.addAttribute("festivalName", festivalname);
		}
		
		model.addAttribute("festivalsactive", true);
		return "user/festival/viewAllFestivalVideos";
	}
	
	
	
	@RequestMapping(value="/view-festival-videos-name",method={RequestMethod.GET,RequestMethod.POST})
	public String viewfestivalvideosname(@RequestParam String festivalname,@RequestParam String festivalvideoname, Model model){
		
		model.addAttribute("festivalName", festivalname);
		model.addAttribute("festivalvideoname", festivalvideoname);
		model.addAttribute("festivalsactive", true);
		return "user/festival/viewFestivalVideos";
	}
	
	
	@RequestMapping(value="/download-festival-videos",method={RequestMethod.GET,RequestMethod.POST})
	public String downloadfestivalvideos(@RequestParam String festivalname,Model model,HttpServletResponse response){
			List<FestivalVideos> festivalVideos = festivalService.getFestivalVideosByFestivalName(festivalname);
			if(festivalVideos!=null && festivalVideos.size()>0){
				List<String> sourceFiles = new ArrayList<String>();
				for(FestivalVideos festivalVideo : festivalVideos){
					if(StringUtils.hasText(festivalVideo.getFestivalModifiedName())){
						String filePath = festivalVideo.getFestivalModifiedName();
						sourceFiles.add(filePath);
					}
				}
			 String[] files =sourceFiles.toArray(new String[sourceFiles.size()]);
			 downloadFilesAsZip(files,"festivalVideos","festivalVideos.zip",response);
            }
			
		return null;
	}
	
	//Festival Images Adding
	
	@RequestMapping(value="/add-festival-images",method={RequestMethod.GET,RequestMethod.POST})
	public String getAddFestivals(Model model,Principal principal){
		List<FestivalList> festivalLists = genericService.getAll(FestivalList.class);
		if(festivalLists!=null){
			model.addAttribute("festivalLists", festivalLists);
		}
		Users user = genericService.getUserByName(Users.class, principal.getName());
		if(user!=null){
			List<Festivals> festivals = genericService.getDetailsById(Festivals.class, user.getUserId(),"users.userId");
			model.addAttribute("festivals", festivals);
		}
		
		model.addAttribute("festivalsImagesactive", true);
		return "user/festival/addFestivalImages";
	}
	
	@RequestMapping(value="/view-festival-info",method={RequestMethod.GET,RequestMethod.POST})
	public String viewfestivalinfo(@RequestParam Integer festivalId, Model model,Principal principal){
		
		Festivals festivals = genericService.getInfoById(Festivals.class, festivalId, "festivalId");
		model.addAttribute("festivals", festivals);
		
		List<FestivalImages> festivalImages = genericService.getDetailsById(FestivalImages.class, festivalId,"festivals.festivalId");
		model.addAttribute("festivalImages", festivalImages);
		
		List<FestivalVideos> festivalVideos = genericService.getDetailsById(FestivalVideos.class, festivalId,"festivals.festivalId");
		model.addAttribute("festivalVideos", festivalVideos);
		
		List<FestivalMusics> festivalMusics = genericService.getDetailsById(FestivalMusics.class, festivalId,"festivals.festivalId");
		model.addAttribute("festivalMusics", festivalMusics);
		
		model.addAttribute("festivalId", festivalId);
		model.addAttribute("festivalsImagesactive", true);
		return "user/festival/viewFestivalDetails";
	}

	@RequestMapping(value="/save-festival-images",method={RequestMethod.GET,RequestMethod.POST})
	public String savefestivalimages(@ModelAttribute FestivalDto festivalDto,Principal principal,final RedirectAttributes redirectAttributes){
		if(principal!=null){
			Users user = genericService.getUserByName(Users.class, principal.getName());
			if(user!=null){
				festivalDto.setUserId(user.getUserId());
				festivalDto.setFestivalDate(stringtoDate(festivalDto.getDateofFestival()));
				Integer result = festivalService.saveFestivalDetails(festivalDto);
				if(result!=null){
					redirectAttributes.addFlashAttribute("successmessage", FESTIVALDETAILSUCCESS);
				}
			}
		}
		return "redirect:/user/add-festival-images";
	}
	
	
	@RequestMapping(value="/delete-details-by-id",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto deleteDetailsById(@RequestParam Integer id,@RequestParam String path,@RequestParam String fileName,@RequestParam Integer festivalId){
		MessageDto messageDto = new MessageDto();
		if(StringUtils.hasText(path)){
			File filePath = new File(context.getRealPath("/"+path+"/"+fileName));
			if(filePath.exists()){
				filePath.delete();
			}
			if(path.equals("festivalImages")){
				genericService.delete(FestivalImages.class, id);
				messageDto.setStatus("success");
				messageDto.setMessage(FESTIVALIMAGEDELETEDSUCCESS);
			  }
			else if(path.equals("festivalVideos")){
				genericService.delete(FestivalVideos.class, id);
				messageDto.setStatus("success");
				messageDto.setMessage(FESTIVALVIDEODELETEDSUCCESS);
			  }
			else if(path.equals("festivalMusics")){
				genericService.delete(FestivalMusics.class, id);
				messageDto.setStatus("success");
				messageDto.setMessage(FESTIVALMUSICDELETEDSUCCESS);
			 }
		}
		
		List<FestivalImages> festivalImages = genericService.getDetailsById(FestivalImages.class, festivalId, "festivals.festivalId");
		List<FestivalVideos> festivalVideos = genericService.getDetailsById(FestivalVideos.class, festivalId, "festivals.festivalId");
		List<FestivalMusics> festivalMusics = genericService.getDetailsById(FestivalMusics.class, festivalId, "festivals.festivalId");
		
		if(festivalImages.size()==0 && festivalVideos.size()==0 && festivalMusics.size()==0){
			genericService.delete(Festivals.class,festivalId);
			messageDto.setFullstatus("success");
			
		}
		
		return messageDto;
	}
	
	@RequestMapping(value="/delete-festival-info",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody MessageDto deletefestivalinfo(@RequestParam Integer festivalId){
		MessageDto messageDto = new MessageDto();
		
		List<FestivalImages> festivalImages = genericService.getDetailsById(FestivalImages.class, festivalId, "festivals.festivalId");
		if(festivalImages!=null && festivalImages.size()>0){
			for(FestivalImages images : festivalImages){
				if(StringUtils.hasText(images.getFestivalModifiedName())){
					File filePath = new File(context.getRealPath("/festivalImages/"+images.getFestivalModifiedName()));
					if(filePath.exists()){
						filePath.delete();
					}	
				}
				genericService.delete(FestivalImages.class, images.getFestivalImageId());
			}
		}
		
		List<FestivalVideos> festivalVideos = genericService.getDetailsById(FestivalVideos.class, festivalId, "festivals.festivalId");
		if(festivalVideos!=null && festivalVideos.size()>0){
			for(FestivalVideos videos : festivalVideos){
				if(StringUtils.hasText(videos.getFestivalModifiedName())){
					File filePath = new File(context.getRealPath("/festivalVideos/"+videos.getFestivalModifiedName()));
					if(filePath.exists()){
						filePath.delete();
					}	
				}
				genericService.delete(FestivalVideos.class, videos.getFestivalVideoId());
			}
		}
		
		List<FestivalMusics> festivalMusics = genericService.getDetailsById(FestivalMusics.class, festivalId, "festivals.festivalId");
		if(festivalMusics!=null && festivalMusics.size()>0){
			for(FestivalMusics musics : festivalMusics){
				if(StringUtils.hasText(musics.getFestivalModifiedName())){
					File filePath = new File(context.getRealPath("/festivalMusics/"+musics.getFestivalModifiedName()));
					if(filePath.exists()){
						filePath.delete();
					}	
				}
				genericService.delete(FestivalMusics.class, musics.getFestivalMusicId());
			}
		}

		genericService.delete(Festivals.class,festivalId);
		messageDto.setStatus("success");
		messageDto.setMessage(FESTIVALINFODELETEDSUCCESS);
		return messageDto;
	}
	
	private void downloadFilesAsZip(String[] files,String path,String zipName,HttpServletResponse response){
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
