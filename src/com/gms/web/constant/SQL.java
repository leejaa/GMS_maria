package com.gms.web.constant;

public class SQL {
	public static final String MEMBER_INSERT=String.format("INSERT INTO %s VALUES(?,?,?,?,SYSDATE,?,?,?,?,?)",Database.TABLE_MEMBER);
	public static final String MEMBER_LIST=
	"select rownum no, t3.* from (select m.*,t2.title from member m join (select t.member_id,listagg(t.title,',') within group (order by t.title) title from (select m.*,s.title from member m join MEMBER_SUBJECT ms on ms.member_id=m.member_id join SUBJECT s on s.subj_id=ms.subj_id) t group by t.member_id) t2 on t2.member_id=m.member_id order by regdate desc) t3";
	public static final String MEMBER_FINDBYNAME=String.format("SELECT * FROM %s WHERE %s=?", Database.TABLE_STUDENT,Database.MEMBER_NAME);
	public static final String MEMBER_FINDBYID=String.format("SELECT * FROM %s WHERE %s=?", Database.TABLE_STUDENT,Database.MEMBER_ID);
	public static final String MEMBER_COUNT=String.format("SELECT COUNT(*) AS COUNT FROM %s",Database.TABLE_STUDENT);
	public static final String MEMBER_UPDATE=
			"UPDATE MEMBER SET NAME=?,PASSWORD=?,PHONE=?,EMAIL=?,GENDER=? WHERE MEMBER_ID=?";
	public static final String MEMBER_DELETE=String.format("DELETE %s WHERE %s=?",Database.TABLE_MEMBER,Database.MEMBER_ID);
	public static final String MEMBER_LOGIN="SELECT * FROM MEMBER WHERE MEMBER_ID LIKE ? AND PASSWORD LIKE ?";
	
	public static String COLUMN;
	
	public static final String STUDENT_LIST=
	"select t.* from (select rownum rnum,s.* from student s)t where t.rnum between ? and ?";
	public static final String STUDENT_COUNT=String.format("SELECT COUNT(*) AS COUNT FROM %s",Database.TABLE_STUDENT);
	public static final String STUDENT_COUNTBYNAME=
	String.format("SELECT COUNT(*) AS COUNT FROM %s WHERE name LIKE ?",Database.TABLE_STUDENT);
	public static final String STUDENT_FINDBYNAME=
	"select t.* from (select rownum rnum,s.* from student s where name like ?)t where t.rnum between ? and ?";
	
	public static final String ARTICLE_INSERT=String.format("INSERT INTO %s VALUES(articles_seq.nextval,?,?,?,?,SYSDATE)",Database.TABLE_ARTICLE);
	public static final String ARTICLE_LIST=String.format("SELECT * FROM %s", Database.TABLE_ARTICLE);
	public static final String ARTICLE_FINDBYID=String.format("SELECT * FROM %s WHERE %s=?", Database.TABLE_ARTICLE,Database.ARTICLE_ID);
	public static final String ARTICLE_FINDBYSEQ=String.format("SELECT * FROM %s WHERE %s=?", Database.TABLE_ARTICLE,Database.ARTICLE_SEQ);
	public static final String ARTICLE_COUNT=String.format("SELECT COUNT(*) AS COUNT FROM %s",Database.TABLE_ARTICLE);
	public static final String ARTICLE_UPDATE=String.format(
	"UPDATE %s SET %s=?,%s=? WHERE %s=?",Database.TABLE_ARTICLE,Database.ARTICLE_TITLE,Database.ARTICLE_CONTENT,Database.ARTICLE_SEQ);
	public static final String ARTICLE_DELETE=String.format("DELETE %s WHERE %s=?",Database.TABLE_ARTICLE,Database.ARTICLE_SEQ);

	public static final String MEMBER_SUBJECT_INSERT="INSERT INTO MEMBER_SUBJECT(member_id,subj_id) VALUES(?,?)";
	public static final String MEMBER_SUBJECT_UPDATE="UPDATE MEMBER_SUBJECT SET SUBJ_ID=? WHERE MEMBER_ID=?";
}
