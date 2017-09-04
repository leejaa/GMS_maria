package com.gms.web.util;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

import com.gms.web.constant.Database;

public class DataInsert {
	public static void main(String[] args) {
		
		for(int i=0;i<50;i++){
		
		Random random=new Random();
		String member = String.valueOf((char) ((int) (random.nextInt(26)) + 97))+String.valueOf((char) ((int) (random.nextInt(26)) + 97));
		int subj_id=(int)(Math.random()*2011+1);
		int score=(int)(Math.random()*100+1);
		String pw="aaa";
		int birthday=(int)(Math.random()*50+1950);
		String num=String.valueOf((int)(Math.random()*5+2005));
		int grade=(int)(Math.random()*4+1);
		//String ssn=String.valueOf(num)+"0419"+"-"+String.valueOf(num2)+"249432";
		int major_id=(int)(Math.random()*4+1);
		String phone="010-"+(int)(Math.random()*9999+1)+"-"+(int)(Math.random()*9999+1);
		String email=member+"@gmail.com";
		String profile="default.jpg";
		int month=(int)(Math.random()*12+1);
		int day=(int)(Math.random()*30+1);
		String birthDay=String.format("%d-%d-%d",birthday, month,day);
		int[] deptNos={101,102,201,202,100,200,10};
		
		
		int deptNo=deptNos[(int)(Math.random()*7)];
		int[] profs={9005,9006,9007,9008};
		int prof=profs[(int)(Math.random()*4)];
		int height=(int)(Math.random()*100+100);
		String title="";
		for(int j=0;j<10;j++){
			title += String.valueOf((char) ((int) (random.nextInt(26)) + 97))+String.valueOf((char) ((int) (random.nextInt(26)) + 97));
		}
		
		 StringBuffer buffer = new StringBuffer();
	        
	        for(int j=0; j<3; j++){
	            char ch = (char)((Math.random() * 11172) + 0xAC00);
	            buffer.append(ch);
	        }
	        String koreanName=buffer.toString();
	        
		try {
			Class.forName(Database.ORACLE_DRIVER);
			PreparedStatement psmt=DriverManager.getConnection("jdbc:mariadb://localhost:3306/sample","lee","lee")
			.prepareStatement("INSERT INTO MEMBER_SUBJECT VALUES(?,?)");
			psmt.setString(1, member);
			psmt.setString(2, num);
			int result=psmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}
		
	}
}
