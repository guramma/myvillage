package com.ssis.village.common;

import java.lang.ref.WeakReference;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ssis.village.model.Users;
import com.ssis.village.service.EmailService;
import com.ssis.village.service.FestivalService;
import com.ssis.village.service.GenericService;
import com.ssis.village.service.GkpBookService;
import com.ssis.village.service.RandomPasswordService;
import com.ssis.village.service.SarpanchService;
import com.ssis.village.service.UploadPathService;
import com.ssis.village.service.UserService;

public class CommonController {

	@Autowired
	protected ServletContext context;
	@Autowired
	protected GenericService genericService;
	@Autowired
	protected FestivalService festivalService;
	@Autowired
	protected EmailService emailService;
	@Autowired
	protected UploadPathService uploadPathService;
	@Autowired
	protected SarpanchService sarpanchService;
	@Autowired
	protected GkpBookService gkpBookService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected RandomPasswordService randomPasswordService;
	
	
	
	
	@ModelAttribute
	public void alwaysCall(Model model,Principal principal){
		if(principal!=null){
			Users user = genericService.getUserByName(Users.class, principal.getName());
			if(user!=null){
				model.addAttribute("userdisplay", user);
			}
		}
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"MM/dd/yyyy hh:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	public static Date stringtoDate(String strDate) {
		DateFormat df = new SimpleDateFormat("MM/dd/yyy");

		System.out.println("StrDate:" + strDate);
		Date date = null;
		try {
			// Converting the input String to Date
			date = df.parse(strDate);

		} catch (ParseException pe) {
			pe.printStackTrace();
		}

		System.out.println("Date:" + date);
		return date;

	}

	public static Date getDate(Integer size) {
		Date today = new Date();
		Calendar cal = new GregorianCalendar();
		cal.setTime(today);
		cal.add(Calendar.DAY_OF_MONTH, size);
		Date nextDate = cal.getTime();
		return nextDate;
	}

	public static Integer getDays(Date start, Date end) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(start);
		cal2.setTime(end);

		int numberOfDays = 0;
		while (cal1.before(cal2)) {
			numberOfDays++;
			cal1.add(Calendar.DATE, 1);
		}

		System.out.println(numberOfDays);
		return numberOfDays;

	}

	@SuppressWarnings("rawtypes")
	public static void gc() {
		Object obj = new Object();
		WeakReference ref = new WeakReference<Object>(obj);
		obj = null;
		while (ref.get() != null) {
			System.gc();
			System.out.println("DATA CLEANED");
		}
	}

	public static Date convertStringtoDate(String strDate) {

		DateFormat df = new SimpleDateFormat("MM/dd/yyyy hh:mm");

		System.out.println("StrDate:" + strDate);
		Date date = null;
		try {
			// Converting the input String to Date
			date = df.parse(strDate);

		} catch (ParseException pe) {
			pe.printStackTrace();
		}

		System.out.println("Date:" + date);
		return date;

	}

	public static Date convertStringtoUserDate(String strDate) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		System.out.println("StrDate:" + strDate);
		Date date = null;
		try {
			// Converting the input String to Date
			date = df.parse(strDate);

		} catch (ParseException pe) {
			pe.printStackTrace();
		}

		System.out.println("Date:" + date);
		return date;

	}

}
