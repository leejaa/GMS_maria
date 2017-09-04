/**
 * Member javaScript
 */
var app=(function(){
     var init=function(ctx){
           session.init(ctx);
           onCreate();
     };
     var ctx=function(){
           return session.getPath('ctx');
     };
     var js=function(){
           return session.getPath('js');
     };
     var img=function(){
           return session.getPath('img');
     };
     var css=function(){
           return session.getPath('css');
     };
     
     var setContentView=function(){
     };
     var onCreate=function(){
           setContentView();
     };
     
     
     return {
           init : init,
           ctx : ctx,
           img : img,
            js : js,
           css : css   //리턴값 (클로저)에 포함시키지 않으면 외부에서 접근이 불가능하다. 그래서 은닉화 해야할정보는 다른 객체에서 호출해서 사용하면 된다.
     };
})();
var session=(function(){
     var init=function(ctx){
           sessionStorage.setItem('ctx',ctx);
           sessionStorage.setItem('js',ctx+'/resources/js');
           sessionStorage.setItem('img',ctx+'/resources/img');
           sessionStorage.setItem('css',ctx+'/resources/css');
     };
     var getPath=function(x){
           return sessionStorage.getItem(x);
     };
     return {
           init : init,
           getPath : getPath
           
     };
})();
var member=(function(){
     var init=function(){
           $('#loginBtn').on('click',function(){
                alert('로그인 버튼 click');
          if($('#member_id').val()===""){
                alert('ID 를 입력해 주세요');
                return false;
          }
          if($('#password').val()===""){
                alert('PASS 를 입력해 주세요');
                return false;
          }
          $('#login_box').attr('action',app.ctx()+"/member.do");
          $('#login_box').attr('method',"post");
          return true;
           }); /*function(){} 이 이벤트 핸들러가 된다.*/
     };   
 
     return {
           init : init //생성자는 항상 오픈해야 한다
     };
})();

var controller=(function(){
	
	var detail=function(){
		location.href="${ctx}/member.do?action=detail&page=detail&member_id=${sessionScope.user.id}";
	};
	
	var moveTo=function(dir,action,page){
		
		location.href=app.ctx()+"/"+dir+".do?action="+action+"&page="+page;
	};
	
	var Delete=function(dir,action){
		var id=prompt("탈퇴할 회원 아이디 입력..","ID");
		location.href=dir+".do?action="+action+"&id="+id;
	};
	
	var logout=function(){
		location.href="common.do?action=logout&page=main";
	};
	
	var list=function(dir){
		location.href=dir+".do?action=search&page=search&pageNumber=1";
	};
	
	return {
		detail : detail,
		moveTo : moveTo,
		Delete : Delete,
		logout : logout,
		list : list
	};
})();

var main=(function(){
	var init=function(){
		onCreate();
	};
	
	var onCreate=function(){
		setContentView();
	};
	
	var setContentView=function(){
		
		$("#ul").attr("class","nav navbar-nav");
		$("#ul1").attr("class","dropdown-menu");
		$("#ul2").attr("class","dropdown-menu");
		$("#ul3").attr("class","dropdown-menu");
		$("#home").attr("class","navbar-brand");
		
		$("#member_join").on('click',function(){
			controller.moveTo('member','move','join');
		});
		
		$("#home").on('click',function(){
			controller.moveTo('common','move','main');
		});
		$("#login").on('click',function(){
			controller.moveTo('member','move','login');
		});
		$("#logout").on("click",function(){
			alert("logout !");
			controller.moveTo('common','logout','main');
		});

		$("#ul1").children().eq(0).on('click',function(){
			controller.list('member');
		});
		
		$("#ul1").children().eq(1).on('click',function(){
				controller.moveTo('member','move','update');
		});
			
			$("#ul1").children().eq(2).on('click',function(){
				controller.moveTo('member','move','delete');
		});
			
			$("#ul2").children().eq(0).on('click',function(){
				controller.moveTo('grade','move','write');
		});
			$("#ul2").children().eq(1).on('click',function(){
				
		});
			
			$("#ul2").children().eq(2).on('click',function(){
				controller.moveTo('grade','move','update');
			});
			
			$("#ul3").children().eq(0).on('click',function(){
				controller.moveTo('board','move','write');
			});
			$("#ul3").children().eq(1).on('click',function(){
				
			});
			$("#ul3").children().eq(2).on('click',function(){
				controller.moveTo('board','move','update');
			});
	};
	return {
		init : init
	};
})();
	var memberDetail=(function(){
		var init=function(){
			onCreate();
		};
		var onCreate=function(){
			setContentView();
		};
		var setContentView=function(){
			$("#detail").on('click',function(){
				
			});
		};
		return {
			init : init
		};
	})();
	
	var memberUpdate=(function(){
		var init=function(){
			onCreate();
		};
		var onCreate=function(){
			setContentView();
			show();
			update();
		};
		var setContentView=function(){
			$("#update").on('click',function(){
				
			var member_id=$("#member_id").text();
			var phone=$("#phone").text();
			var email=$("#email").text();
			var name=$("#name").text();
			var gender=$("#gender").text();
			var ssn=$("ssn").text();
			
				sessionStorage.setItem('member_id',member_id);
				sessionStorage.setItem('phone',phone);
				sessionStorage.setItem('email',email);
				sessionStorage.setItem('name',name);
				sessionStorage.setItem('gender',gender);
				sessionStorage.setItem('ssn',ssn);
				
				$(location).attr("href",app.ctx()+"/member.do?action=move&page=update");
				
			});
		};
		var show=function(){
			$("#phone").val(sessionStorage.getItem('phone'));
			$("#email").val(sessionStorage.getItem('email'));
			$("#name").val(sessionStorage.getItem('name'));
			
		};
		var update=function(){
			$('#updateBtn').on('click',function(){
				alert('수정할 아이디 : '+sessionStorage.getItem('member_id'));
				var phone=$('#phone').val();
				var email=$('#email').val();
				var name=$('#name').val();
				
			});
		};
		return {
			init : init,
			show : show
		};
	})();
	
	
