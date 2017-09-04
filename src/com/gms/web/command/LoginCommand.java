package com.gms.web.command;

import lombok.Getter;
import lombok.Setter;

public class LoginCommand extends Command{
	@Getter @Setter
	protected String member_id,password;
}
