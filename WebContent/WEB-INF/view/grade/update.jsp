<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="${stx}/WEB-INF/view/common/common_head.jsp" />
<body>
<div class="container">
  <h2>성적수정</h2>
  <form action="../index.jsp">
  <div class="form-group">
      <label for="name">학생이름</label>
      <input type="text" class="form-control" id="name" name="name" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="id">국어성적</label>
      <input type="text" class="form-control" id="korean" placeholder="국어성적을 입력하세요" name="korean">
    </div>
    
    <div class="form-group">
      <label for="english">영어성적</label>
      <input type="text" class="form-control" id="english" placeholder="영어성적을 입력하세요" name="english">
    </div>
    <div class="form-group">
      <label for="id">수학성적</label>
      <input type="text" class="form-control" id="math" placeholder="수학성적을 입력하세요" name="math">
    </div>
    
    
    <button type="submit" class="btn btn-danger">전송</button>
  </form>
</div>
</body>
<script>
window.onload=mainLoad();
</script>
</html>