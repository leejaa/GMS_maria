<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>title</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="${js}/member.js"></script>
</head>
<header>
<jsp:include page="/WEB-INF/view/common/navbar.jsp"></jsp:include>
</header>

	<body>
<div class="container">
<h1 align="center">현재: ${requestScope.pageNumber} </h1>

<div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" onclick="search()">Go!</button>
      </span>
      <input type="text" class="form-control" placeholder="Search for..." id="search">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
 


  <table class="table">
    <thead>
      <tr>
      	<th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>가입일</th>
        <th>휴대폰번호</th>
        <th>이메일</th>
        <th>성별</th>
        <th>수강과목</th>
        <th>수정/삭제</th>
      </tr>
    </thead>	
    <tbody>
       <c:forEach var="i" items="${requestScope.list}">
		      <tr class="success">
		      	<td>${i.num}</td>
		      	<td> <a id="detail">${i.member_id}</a></td>
		      	 <td>${i.name}</td>
		      	 <td>${i.regdate}</td>
		      	 <td>${i.phone}</td>
		      	 <td>${i.email}</td>
		      	 <td>${i.gender}</td>
		      	 <td>${i.subject}</td>
		      	 <td>
		      	 <a onclick="updateStudent('${i.member_id}')">수정</a>/
		      	<a onclick="deleteStudent('${i.member_id}')">삭제</a></td>
		      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

 

<div class="container" style="width: 500px;margin: 0 auto;">
  
  <ul class="pagination">
  
  <c:if test="${requestScope.pageNumber ne 1}">
	  <li class="page-item">
	  <span class="glyphicon glyphicon-backward" aria-hidden="true" onclick="prevprev()"></span>
	      <a class="page-link" onclick="prev()" tabindex="-1">Previous</a>
	    </li>
  </c:if>
    
    
     <c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
	     <c:choose>
	     	<c:when test="${i.index eq requestScope.pageNumber}">
	     		<li class="page-item active"><a>${i.index}</a></li>
	     	</c:when>
	     	<c:otherwise>
	     		<li class="page-item"><a onclick="pageClick('${i.index}')">${i.index}</a></li>
	     	</c:otherwise>
	     </c:choose>
    
    
    </c:forEach>
    <c:if test="${requestScope.pageNumber ne requestScope.theNumberOfPages}">
     <li class="page-item">
      <a class="page-link" onclick="next()">Next</a>
      <span class="glyphicon glyphicon-forward" aria-hidden="true" onclick="nextnext()"></span>
    </li>
    </c:if>
  </ul>

  </div>
</div>
</body>
<script>
function pageClick(pageNumber){
	var search=document.getElementById("search").value;
	location.href="${ctx}/member.do?action=search&page=search&pageNumber="+pageNumber+"&search="+search;
}

function next(){
	var nextPage=${requestScope.startPage}+${requestScope.blockSize};
	location.href="${ctx}/member.do?action=search&page=search&pageNumber="+nextPage;
}
function prev(){
	var prevPage=${requestScope.endPage}-${requestScope.blockSize};
	if(prevPage<1){
		prevPage=1;
	}
	location.href="${ctx}/member.do?action=search&page=search&pageNumber="+prevPage;
}
function nextnext(){
	var nextnextPage=${requestScope.theNumberOfPages};
	location.href="${ctx}/member.do?action=search&page=search&pageNumber="+nextnextPage;
}
function prevprev(){
	var prevPage=${requestScope.endPage}-${requestScope.blockSize};
	location.href="${ctx}/member.do?action=search&page=search&pageNumber=1";
}

function updateStudent(id){
	alert('수정할 아이디 : '+id);
	location.href="${ctx}/member.do?action=detail&page=update&member_id="+id;
}

function deleteStudent(id){
	alert('삭제할 아이디 : '+id);
	location.href="${ctx}/member.do?action=delete&page=list&member_id="+id;
}
function detailStudent(id){
	alert('디테일 아이디 : '+id);
	location.href="${ctx}/member.do?action=detail&page=detail&member_id="+id;
}
function search(){
	var search=document.getElementById("search").value;
	if(search==''){
		alert('검색어를 입력해주세요');
		return false;
	}
	location.href="${ctx}/member.do?action=search&page=search&pageNumber=1&search="+search;
}
 

 
</script>
</html>

