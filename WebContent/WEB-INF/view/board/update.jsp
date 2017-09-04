<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="${stx}/WEB-INF/view/common/common_head.jsp" />
<body>
<h1 class="text-center">게시글 수정</h1> <hr />
<div align="center">
<div class="wrapper" style="width: 800px;border-style:groove;border-color: blue;">
  <form action="./board_list.jsp">
  <div class="form-group">
      <label for="comment">글제목</label>
      <textarea class="form-control" rows="1" cols="20" id="comment"></textarea>
    </div>
  
    <div class="form-group">
      <label for="comment">글내용</label>
      <textarea class="form-control" rows="10" cols="20" id="comment"></textarea>
    </div>
    
    <div class="form-group" align="right">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-danger">수정</button>
      </div>
    </div>
  </form>
</div>
</div>
</body>
<script>
window.onload=mainLoad();
</script>
</html>