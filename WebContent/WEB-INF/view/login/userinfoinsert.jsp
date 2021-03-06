<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추가정보등록</title>
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
<script type=text/javascript>
	function checkdata() {
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}.,]/; 
		var form = document.forms.frm;
		

		if (form.name.value == "" || pattern_spc.test(form.name.value)) {
			alert("이름을 확인해주세요");
		} else if (form.addr.value == "" || pattern_spc.test(form.addr.value)) {
			alert("주소를 확인해주세요");
		} else if (form.hp.value == "" || pattern_spc.test(form.hp.value)) {
			alert("핸드폰번호를 확인해주세요");
		} else if (form.pnumber.value == "" || pattern_spc.test(form.pnumber.value)) {
			alert("생년월일을 확인해주세요");
		}  else if (form.gender.value == "" || pattern_spc.test(form.gender.value)) {
			alert("성별을 확인해주세요");
		} else if (pattern_spc.test(form.dnumber.value)) {
			alert("성별을 확인해주세요");
		} else {
			form.submit()
		}
	};
</script>
<body>
	<%@include file="/assets/header.jsp"%>
	<div class="container" style="margin-top: 13%; width: 50%;">
		<form action="userinfo.do?id=<%=id%>" method="post" name="frm">
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

					<div class="div_border" style="height: 4.8%;">
						<b> <font size="4em"> 의사번호 </font>
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
						<input type="text" placeholder="핸드폰번호" name="hp"
							class="form-control" style="height: 100%;" />
					</div>

					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="생년월일" name="pnumber"
							class="form-control" style="height: 100%;" />
					</div>

					<div class="div_border" style="height: 4.8%;">
						<font size="4em"> 
							<input type="radio" name="gender" id="optionsRadios1" value="1" />남
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"	name="gender" id="optionsRadios2" value="0" />여
						</font>
					</div>

					<div class="div_border" style="height: 4.8%;">
						<input type="text" placeholder="예:0000511" name="dnumber"
							class="form-control" style="height: 100%;" />
					</div>

					<input type="button" value="등록" class="pull-right btn btn-primary" onclick="javascript:checkdata()"/>

				</div>
			</div>
		</form>
	</div>
</body>
</html>