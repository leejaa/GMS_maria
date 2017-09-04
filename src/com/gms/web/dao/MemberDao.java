package com.gms.web.dao;

import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public interface MemberDao {
	public String insert(Map<?,?>map);
	public List<?> selectAll(Command cmd);
	public String count(Command cmd);
	public StudentBean selectById(Command cmd);
	public MemberBean memberById(Command cmd);
	public List<StudentBean> selectByName(Command cmd);
	public String update(Map<?,?> map);
	public String delete(Command cmd);
	public String countByName(Command cmd);
	public MemberBean login(Command cmd);
}
