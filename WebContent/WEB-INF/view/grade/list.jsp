<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="${stx}/WEB-INF/view/common/common_head.jsp" />
<body>
<div class="container">
<h1 align="center">성적리스트</h1>
  <table class="table">
    <thead>
      <tr>
        <th>이름</th>
        <th>국어성적</th>
        <th>영어성적</th>
        <th>수학성적</th>
      </tr>
    </thead>	
    <tbody>
      <tr>
        <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
      </tr>      
      <tr class="success">
       <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
      </tr>
      <tr class="danger">
        <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
      </tr>
      <tr class="info">
       <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
<script>
window.onload=mainLoad();
</script>
</html>

