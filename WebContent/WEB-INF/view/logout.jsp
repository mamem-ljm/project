<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<body>
	<!-- 로그인 -->
	<script type='text/javascript'>
		var token =''
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('eacdc4d3774eca1305d9deef606184d7');
		
		function loginWithKakao() {
			Kakao.API.request({
			//로그아웃
			Kakao.Auth.logout(){
				function(){
					alert("카카오 로그아웃");
					location.href="home.do";
				}
			};
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			})
		};
	</script>