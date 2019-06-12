<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>




	<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
		width="16%" />
	</a>

	<!-- 로그인 -->
	<script type='text/javascript'>
		var UserID = '', UserEmail = '', UserNickName = '', birth = '';
		var token =''
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('eacdc4d3774eca1305d9deef606184d7');
		// 카카오 로그인 버튼을 생성합니다.
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.loginForm({
				success : function(authObj) {

					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {

							
							UserID = JSON.stringify(res.id);

							UserNickName = JSON.stringify(res.properties.nickname);
							
							token = authObj.access_token;
							
							console.log(res.id);
							console.log(res.properties.nickname);
							console.log(authObj.access_token);
							

							location.href = 'kakao/login.do?UserID='+UserID;
							 
									
							Kakao.Auth.setAccessToken(authObj.access_token);
							
							
							
						},
						fail : function(err) {
							alert(JSON.stringify(err));
						}
					})

				},
				fail : function(err) {
					alert(JSON.stringify(err));
				},persistAccessToken:false
			})
			
			
			
		};
	</script>