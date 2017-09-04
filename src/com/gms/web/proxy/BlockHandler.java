package com.gms.web.proxy;

import com.gms.web.command.Command;

public class BlockHandler{

	public static int[] attr(PageProxy pxy){
		Command cmd=new Command();
		int[] result=new int[6];
		int theNumberOfPage=0,startPage=1,endPage=1;
		theNumberOfPage=(pxy.getTheNumberOfRows()%pxy.getPageSize())==0?pxy.getTheNumberOfRows()/pxy.getPageSize():pxy.getTheNumberOfRows()/pxy.getPageSize()+1;
		if(theNumberOfPage==0){
			theNumberOfPage=1;
		}
		startPage=pxy.getPageNumber()-((pxy.getPageNumber()-1)%pxy.getBlockSize());
		endPage=(startPage+pxy.getBlockSize()-1<=theNumberOfPage)?startPage+pxy.getBlockSize()-1:theNumberOfPage;
		
		result[0]=pxy.getPageNumber();
		result[1]=theNumberOfPage;
		result[2]=startPage;
		result[3]=endPage;
		result[4]=(startPage-(theNumberOfPage/pxy.getBlockSize()))<=0?1:startPage-(theNumberOfPage/pxy.getBlockSize());
		result[5]=(startPage+(theNumberOfPage/pxy.getBlockSize()))<=0?1:startPage+(theNumberOfPage/pxy.getBlockSize());
		
		System.out.println(
				"pageNumber is "+result[0]+",\n"+
				"theNumberOfPages is "+result[1]+",\n"+
				"startPage is "+result[2]+",\n"+
				"endPage is "+result[3]+",\n"+
				"prevBlock is "+result[4]+",\n"+
				"nextBlock is "+result[5]+",\n"
				);
		return result;
	}
	

}
