package com.gms.web.dao;
import java.util.List;

import com.gms.web.domain.BoardBean;

public interface ArticleDao {
	public int insert(BoardBean article);
	public List<BoardBean> selectAll();
	public List<BoardBean> selectById(String id);
	public BoardBean selectBySeq(String seq);
	public int update(BoardBean article);
	public int delete(String seq);
	public int count();
}
