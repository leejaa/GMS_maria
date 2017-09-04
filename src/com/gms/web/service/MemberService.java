package com.gms.web.service;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public interface MemberService {
	public String addMember(Map<?,?> map);
	public List<?> getMembers(Command cmd);
	public String countMembers(Command cmd);
	public String countMembersByName(Command cmd);
	public StudentBean studentById(Command cmd);
	public MemberBean memberById(Command cmd);
	public List<?> getMemberByName(Command cmd);
	public String modify(Map<?,?> map);
	public String remove(Command cmd);
	public MemberBean login(Command cmd);
	
}
