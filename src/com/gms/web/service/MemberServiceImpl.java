package com.gms.web.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.dao.MemberDaoImpl;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public class MemberServiceImpl implements MemberService{
	public static MemberServiceImpl getInstance() {
		return new MemberServiceImpl();
	}
	private MemberServiceImpl() {}
	@Override
	public String addMember(Map<?,?> map) {
		return MemberDaoImpl.getInstance().insert(map)=="0"?"join":"main";
	}
	@Override
	public List<?> getMembers(Command cmd) {
		return MemberDaoImpl.getInstance().selectAll(cmd);
	}
	@Override
	public String countMembers(Command cmd) {
		return MemberDaoImpl.getInstance().count(cmd);
	}
	@Override
	public StudentBean studentById(Command cmd) {
		return MemberDaoImpl.getInstance().selectById(cmd);
	}
	@Override
	public List<StudentBean> getMemberByName(Command cmd) {
		return MemberDaoImpl.getInstance().selectByName(cmd);
	}
	@Override
	public String modify(Map<?,?> map) {
		return MemberDaoImpl.getInstance().update(map)=="0"?"update":"list";
	}
	@Override
	public String remove(Command cmd) {
		return MemberDaoImpl.getInstance().delete(cmd)=="0"?"회원탈퇴실패":"회원탈퇴성공";
	}
	@Override
	public MemberBean login(Command cmd) {
		return MemberDaoImpl.getInstance().login(cmd);
	}
	@Override
	public MemberBean memberById(Command cmd) {
		return MemberDaoImpl.getInstance().memberById(cmd);
	}
	@Override
	public String countMembersByName(Command cmd) {
		return MemberDaoImpl.getInstance().countByName(cmd);
	}
}
