<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저정보 변경</title>
</head>
<style>
.div_border {
	border: 1px solid #D5D5D5;
}

.left-box {
	float: left;
	width: 35%;
}

.right-box {
	float: right;
	width: 65%;
}

input {
	margin: 100%;
}

.textarea_size {
	min-height: 100%;
	overflow: visible;
}
</style>
<body>
<%
	String chk_seq = CmmUtil.nvl(request.getParameter("chk_seq"));
%>
<%@include file="/assets/header.jsp" %>

<script type=text/javascript>
	function checkdata() {
		
		var form = document.forms.frm;
		/* alert(form.hp2.value); */
		
		if (form.name.value == "") {
			alert("이름을 입력해주세요")
		} else if (form.addr.value == "") {
			alert("주소를 입력해주세요")
		} else if (form.pnumber.value == "") {
			alert("생년월일을 입력해주세요")
		} else if (form.gender.value == "") {
			alert("성별을 체크해주세요")
		} else {
			form.submit()
		}
	};
</script>
<body>
	<div class="container" style="margin-top: 13%; width: 50%;">
		<form action="UpdateUser.do?chk_seq=<%=chk_seq%>" method="post" name="frm">
			<div>
				<div class="left-box">

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 이름 </font>
						</b>
					</div>

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 주소 </font>
						</b>
					</div>

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 핸드폰번호 </font>
						</b>
					</div>

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 생년월일 </font>
						</b>
					</div>

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 성별 </font>
						</b>
					</div>
					
					<input type="reset" value="리셋"
						class="pull-left pull-right btn btn-primary" />
				</div>


				<div class="right-box">
					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="이름" name="name"
							class="form-control" style="height: 100%;" />
					</div>

					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="주소" name="addr"
							class="form-control" style="height: 100%;" />

					</div>

					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="핸드폰번호" name="hp2"	class="form-control" style="height:100%;" />
					</div>

					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="생년월일" name="pnumber"
							class="form-control" style="height: 100%;" />
					</div>

					<div class="div_border" style="height: 4.8%;">
						<font size="4em"> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gender" id="optionsRadios1" value="1" />남
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"	name="gender" id="optionsRadios2" value="0" />여
						</font>
					</div>

					<input type="button" value="변경" class="pull-right btn btn-primary" onclick="javascript:checkdata()"/>

				</div>
			</div>
		</form>
	</div>
</body>
</html>
</body>
</html>