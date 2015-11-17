package com.ssis.village.user.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssis.village.common.CommonController;
import com.ssis.village.common.CommonMessages;
import com.ssis.village.dto.StudentAttendenceDto;
import com.ssis.village.front.controller.HomeController;
import com.ssis.village.model.Student;

@Controller
@RequestMapping("/user")
public class GkpSchoolController extends CommonController implements CommonMessages {
	
	private static Logger logger = Logger.getLogger(HomeController.class);
	
	@RequestMapping(value="/get-gkp-school-info",method={RequestMethod.GET,RequestMethod.POST})
	public String getgkpschoolinfo(Model model){
		model.addAttribute("schoolactive", true);
		List<Student> students = genericService.getAll(Student.class);
		model.addAttribute("students", students);
		return "user/school/schoolhomepage";
	}
	
	
	@RequestMapping(value="/student-attendence",method={RequestMethod.GET,RequestMethod.POST})
	public String studentattendence(Model model){
		model.addAttribute("schoolactive", true);
		return "user/school/studentattendence";
	}
	
	
	@RequestMapping(value="/student-attendence-form",method={RequestMethod.GET,RequestMethod.POST})
	public String studentattendenceform(@ModelAttribute StudentAttendenceDto studentAttendenceDto, Model model){
		model.addAttribute("schoolactive", true);
		model.addAttribute("studentAttendenceDto", studentAttendenceDto);
		return "user/school/studentattendencefrom";
	}
	
	
	
	@RequestMapping(value="/add-new-student",method={RequestMethod.GET,RequestMethod.POST})
	public String addnewstudent(Model model){
		model.addAttribute("schoolactive", true);
		return "user/school/addnewstudent";
	}
	
	
	@RequestMapping(value="/student-registration-process",method={RequestMethod.GET,RequestMethod.POST})
	public String studentregistrationprocess(@ModelAttribute Student student, Model model,final RedirectAttributes redirectAttributes){
		
		logger.info("Inside Sign-Up Page");
		student.setPassword(randomPasswordService.getRandomPassword(10));
		Integer result = genericService.saveStudentDetails(student);
		if(result!=null){
			redirectAttributes.addFlashAttribute("successmessage", STUDENTDETAILSSUUCESS);
		}
		model.addAttribute("schoolactive", true);
		return "redirect:/user/add-new-student";
	}
	
	
	@RequestMapping(value="/edit-student-details",method={RequestMethod.GET,RequestMethod.POST})
	public String editstudentdetails(@RequestParam Integer studentId, Model model){
		
		Student student = genericService.getInfoById(Student.class, studentId, "studentId");
		model.addAttribute("student", student);
		model.addAttribute("schoolactive", true);
		return "user/school/editstudentdetails";
	}
	
	
	
	
	
	
	
	
	
	
}
