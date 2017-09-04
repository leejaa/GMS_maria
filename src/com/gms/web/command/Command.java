package com.gms.web.command;



import com.gms.web.constant.Extension;
import com.gms.web.constant.Path;

import lombok.Getter;
import lombok.Setter;



public class Command implements Commandable{
	@Getter
	protected String action,pageNumber,view;
	@Getter @Setter
	protected String dir,startRow,endRow,page,column,search,member_id,password;
	
	public void setPageNumber(String pageNumber) {
		this.pageNumber =(pageNumber==null)?"1":pageNumber;
	}
	
	public void setAction(String action) {
		this.action =(action==null)?"move":action;
	}
	
	@Override
	public void process() {
		this.view=(dir.equals("/common"))?"/WEB-INF/view/common/main.jsp":
		Path.VIEW+dir+Path.SEPARATOR+page+Extension.JSP+"?pageNumber="+this.pageNumber+"&action="+this.action;
		System.out.println("이동페이지 : "+this.view);
	}

	
}
