<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('eacdc4d3774eca1305d9deef606184d7');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));

        console.log(res.id);
       	console.log(res.kaccount_email);
       	console.log(res.properties['nickname']);
       	
       	console.log(authObj.access_token);
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
  
</script>