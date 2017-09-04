package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.BoardBean;

public interface BoardService {
	public String write(BoardBean article);
	public List<BoardBean> getArticles();
	public List<BoardBean> findById(String id);
	public BoardBean findBySeq(String seq);
	public String modify(BoardBean article);
	public String remove(String seq);
	public int count();
}
