<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a id="home">HOME</a>
    </div>
    <ul id="ul">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MEMBER
        <span class="caret"></span></a>
        <ul id="ul1">
          <li><a id="member_list">회원목록</a></li>
          <li><a id="member_update">회원정보수정</a></li>
          <li><a id="member_delete">회원탈퇴</a></li>
        </ul>
      </li>
      
   	   <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">GRADE
        <span class="caret"></span></a>
        <ul id="ul2">
          <li><a id="grade_input">성적입력</a></li>
          <li><a id="grade_list">성적목록</a></li>
          <li><a id="grade_update">성적수정</a></li>
        </ul>
      </li>
      
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">BOARD
        <span class="caret"></span></a>
        <ul id="ul3">
          <li><a id="board_write">게시글쓰기</a></li>
          <li><a id="board_list">게시글목록</a></li>
          <li><a id="board_update">게시글수정</a></li>
        </ul>
      </li>
      
    </ul>
    
     <ul class="nav navbar-nav navbar-right">
      <c:choose>
		<c:when test="${empty sessionScope.user}">
      <li><a id="member_join"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a id="login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        </c:when>
        <c:otherwise>
        <li><a onclick="detail()"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;${sessionScope.user.name}님</a></li>
		 <li><a id="logout"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
		</c:otherwise>
	</c:choose>
    </ul>
  </div>
</nav>
<script>
app.init('${ctx}');
main.init();

</script>

