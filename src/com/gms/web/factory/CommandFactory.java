package com.gms.web.factory;

import com.gms.web.command.Command;
import com.gms.web.command.ListCommand;
import com.gms.web.command.MoveCommand;
import com.gms.web.command.SearchCommand;
import com.gms.web.constant.Action;

public class CommandFactory {
	public static Command createCommand(String dir,String action,String page,String pageNumber,String column,String search){
		Command cmd=null;
		if(action==null){
			action=Action.MOVE;
		}
		switch (action) {
		case Action.MOVE:case Action.LOGIN:case Action.JOIN:case "dbtest":case Action.LOGOUT:case Action.DETAIL:
		case Action.UPDATE:
			cmd=new MoveCommand(dir, action, page);
			break;
		case Action.LIST:
			cmd=new ListCommand(dir, action, page, pageNumber);
			break;
		case Action.SEARCH:
			cmd=new SearchCommand(dir, action, page, pageNumber, column, search);
			break;
		default:
			System.out.println("Command Fail..");
			break;
		}
		return cmd;
		
	}
}
