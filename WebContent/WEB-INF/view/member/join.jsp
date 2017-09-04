<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/common_head.jsp" />
<div class="container">
  <h2>회원가입</h2>
   <form method="post" id="join_form">
      <div class="form-group">
      <label for="id">ID</label>
      <input type="text" class="form-control" id="member_id" placeholder="아이디를 입력하세요" name="member_id">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요" name="password">
    </div>
     <div class="form-group">
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요" name="name">
    </div>
    <div class="form-group">
      <label for="email">이메일</label>
      <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email">
    </div>
    <div class="form-group">
      <label for="phone">전화번호</label>
      <input type="text" class="form-control" id="phone" placeholder="전화번호를 입력하세요" name="phone">
    </div>
    <div class="form-group">
      <label for="ssn">주민번호</label>
      <input type="text" id="ssn" name="ssn" class="form-control" placeholder="주민등록번호입력">
    </div>
     <div class="form-group">
      <label for="gender">성별</label>
      <label><input type="radio" id="gender" name="gender" value="male">남성</label>
      <label><input type="radio" id="gender" name="gender" value="female">여성</label>
    </div>
    <div class="form-group">
      <select name="major" id="major">
		  <option value="1">컴퓨터공학</option>
		  <option value="2">과학</option>
		  <option value="3">물리학</option>
		  <option value="4">영어</option>
	  </select>
	  
    </div>
	  <div>
	  </div>
    <div class="form-group">
      <label for="subject">수강과목</label>
	      <div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2005" checked="checked">java</label>
			</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2006" checked="checked">javascript</label>
		</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2007">html</label>
		</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2008">css</label>
		</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2009">phython</label>
		</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2010">c</label>
		</div>
		<div class="checkbox">
	  		<label><input type="checkbox" id="subject" name="subject" value="2011">c++</label>
		</div>
    </div>
	<input type="hidden" id=profile name="profile" value="profile"/>
    <input type="hidden" name="action" value="join"/>
    <input type="hidden" name="page" value="main"/>
    <button type="submit" class="btn btn-danger" onclick="joinAlert()">전송</button>
  </form>
   
</div>
</body>
<script>
window.onload=mainLoad();
function joinAlert(){
	var member_id=document.getElementById("member_id").value;
	var password=document.getElementById("password").value;
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var phone=document.getElementById("phone").value;
	var ssn=document.getElementById("ssn").value;
	var gender=document.getElementById("gender").value;
	var major=document.getElementById("major").value;
	var subject=document.getElementById("subject").value;
	
	if(member_id===""){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(password===""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if(name===""){
		alert("이름을 입력해주세요");
		return false;
	}
	if(email===""){
		alert("이메일을 입력해주세요");
		return false;
	}
	if(phone===""){
		alert("휴대폰번호를 입력해주세요");
		return false;
	}
	if(ssn===""){
		alert("주민등록번호를 입력해주세요");
		return false;
	}
	if(gender===""){
		alert("성별을 입력해주세요");
		return false;
	}
	if(major===""){
		alert("전공을 입력해주세요");
		return false;
	}
	if(subject===""){
		alert("수강과목을 입력해주세요");
		return false;
	}
	
	var form=document.getElementById("join_form");
	form.method="post";
	form.action="${ctx}/member.do";
	
	return true;
}
</script>

</html>