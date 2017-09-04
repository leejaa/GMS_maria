package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;

import com.gms.web.command.Command;
import com.gms.web.factory.CommandFactory;

public class Separator {
	public static Command cmd=new Command();
	public static void init(HttpServletRequest request){
		
		String servletPath=request.getServletPath();
		String dir=servletPath.substring(1, servletPath.indexOf("."));
		
		cmd=CommandFactory.createCommand(dir, 
				request.getParameter("action"),
				request.getParameter("page"),
				request.getParameter("pageNumber"),
				request.getParameter("column"),
				request.getParameter("search")
				);
	}
	
}
