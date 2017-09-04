package com.gms.web.util;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gms.web.constant.Database;

public class insertbirthday {
	public static void main(String[] args) {
		
		
		try {
			Class.forName(Database.ORACLE_DRIVER);
			PreparedStatement psmt=DriverManager.getConnection(Database.ORACLE_URL,Database.USERID,Database.PASSWORD)
			.prepareStatement("SELECT * FROM STUDENT");
			ResultSet rs=psmt.executeQuery();
			while(rs.next()){
				Class.forName(Database.ORACLE_DRIVER);
				PreparedStatement psmt2=DriverManager.getConnection(Database.ORACLE_URL,Database.USERID,Database.PASSWORD)
				.prepareStatement("UPDATE STUDENT SET BIRTHDAY=?");
				int birthday=rs.getInt("birthday");
				int month=(int)(Math.random()*12+1);
				int day=(int)(Math.random()*30+1);
				String birthday2=String.format("%d-%d-%d",birthday, month,day);
				psmt2.setString(1, birthday2);
				int result=psmt2.executeUpdate();
				System.out.println(result);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
