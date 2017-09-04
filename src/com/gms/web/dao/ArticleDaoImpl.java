package com.gms.web.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gms.web.constant.Database;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.BoardBean;
import com.gms.web.factory.DatabaseFactory;

public class ArticleDaoImpl implements ArticleDao{
List<BoardBean> articles;
BoardBean article;

public static ArticleDaoImpl getInstance() {
	try {
		Class.forName(Database.ORACLE_DRIVER);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return new ArticleDaoImpl();
}
	@Override
	public int insert(BoardBean article) {
		int result=0;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_INSERT);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setInt(4, article.getHitcount());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<BoardBean> selectAll() {
		articles=new ArrayList<>();
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_LIST).executeQuery();
			while(rs.next()){
				article=new BoardBean();
				article.setArticleSeq(rs.getInt(Database.ARTICLE_SEQ));
				article.setId(rs.getString(Database.ARTICLE_ID));
				article.setTitle(rs.getString(Database.ARTICLE_TITLE));
				article.setContent(rs.getString(Database.ARTICLE_CONTENT));
				article.setHitcount(rs.getInt(Database.ARTICLE_HITCOUNT));
				article.setRegdate(rs.getString(Database.ARTICLE_REGDATE));
				articles.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}

	@Override
	public List<BoardBean> selectById(String id) {
		articles=new ArrayList<>();
		try {
			Class.forName(Database.ORACLE_DRIVER);
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_FINDBYID);
			articles=selectAll();
			for(BoardBean a:articles){
				if(a.getId().contains(id)){
					id=a.getId();
					articles=new ArrayList<>();
				}
			}
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				article=new BoardBean();
				article.setArticleSeq(rs.getInt(Database.ARTICLE_SEQ));
				article.setId(rs.getString(Database.ARTICLE_ID));
				article.setTitle(rs.getString(Database.ARTICLE_TITLE));
				article.setContent(rs.getString(Database.ARTICLE_CONTENT));
				article.setHitcount(rs.getInt(Database.ARTICLE_HITCOUNT));
				article.setRegdate(rs.getString(Database.ARTICLE_REGDATE));
				articles.add(article);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}

	@Override
	public BoardBean selectBySeq(String seq) {
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_FINDBYSEQ);
			pstmt.setString(1, seq);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				article=new BoardBean();
				article.setArticleSeq(rs.getInt(Database.ARTICLE_SEQ));
				article.setId(rs.getString(Database.ARTICLE_ID));
				article.setTitle(rs.getString(Database.ARTICLE_TITLE));
				article.setContent(rs.getString(Database.ARTICLE_CONTENT));
				article.setHitcount(rs.getInt(Database.ARTICLE_HITCOUNT));
				article.setRegdate(rs.getString(Database.ARTICLE_REGDATE));
				}
				if(!rs.next()){
					article=new BoardBean();
					article.setArticleSeq(0);
					article.setContent("조회되지 않는 번호입니다");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return article;
	}

	@Override
	public int update(BoardBean article) {
		int result=0;
		
		try {
			if(article.getTitle().equals("")){
				article.setTitle(selectBySeq(String.valueOf(article.getArticleSeq())).getTitle());
			}
			if(article.getContent().equals("")){
				article.setContent(selectBySeq(String.valueOf(article.getArticleSeq())).getContent());
			}
			
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_UPDATE);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getArticleSeq());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int delete(String seq) {
		int result=0;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_DELETE);
			pstmt.setString(1, seq);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int count() {
		int result=0;
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERID, Database.PASSWORD).getConnection()
					.prepareStatement(SQL.ARTICLE_COUNT).executeQuery();
			while(rs.next()){
				result=rs.getInt(Database.COUNT);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
