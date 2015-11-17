package com.ssis.village.service;

import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RandomPasswordServiceImpl implements RandomPasswordService {
	
	
	 private final char[] alphanumeric=alphanumeric();
	    private final Random rand;
	 
	    public RandomPasswordServiceImpl(){this(null);}
	 
	    public RandomPasswordServiceImpl(Random rand){
	      this.rand=(rand!=null) ? rand : new Random();
	    }
	 
	    private String get(int len){
	        StringBuffer out=new StringBuffer();
	         
	        while(out.length() < len){
	            int idx=Math.abs(( rand.nextInt() % alphanumeric.length ));
	            out.append(alphanumeric[idx]);
	        }
	        return out.toString();
	    }
	 
	    // create alphanumeric char array
	    private char[] alphanumeric(){
	        StringBuffer buf=new StringBuffer(128);
	        for(int i=48; i<= 57;i++)buf.append((char)i); // 0-9
	        for(int i=65; i<= 90;i++)buf.append((char)i); // A-Z
	        for(int i=97; i<=122;i++)buf.append((char)i); // a-z
	        return buf.toString().toCharArray();
	    }	
	
	@Override
	public String getRandomPassword(Integer size) {
		return get(size);
	}

}
