<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진단서 작성</title>
<%
	String chk_useq = request.getParameter("chk_useq");
%>
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
.textarea_size{
	min-height:100%;
	overflow:visible;
}
</style>
<script>
	function resize(obj){
		obj.style.height="1px";
		obj.style.height=(12+obj.scollHeight)+"px";
	}
</script>
</head>

<body>
	<%@include file="/assets/header.jsp"%>
	<div class="container" style="margin-top: 10%;">

		<form action="SendData.do?chk_useq=<%=chk_useq%>" method="post">

			<div class="left-box div_bolder">
				<div class="div_border" style="height: 3.8%;">
					<b> <font size="4em"> 이름 </font>
					</b>
				</div>

				<div class="div_border" style="height: 3.8%;">
					<b> <font size="4em"> 생년월일 </font>
					</b>
				</div>

				<div class="div_border" style="height: 3.8%;">
					<b> <font size="4em"> 진단명 </font>
					</b>
				</div>

				<div class="div_border" style="height: 42.8%;">
					<b> <font size="4em"> 병명 및 소견 </font>
					</b>
				</div>

				<div class="div_border" style="height: 3.7%;">
					<b> <font size="4em"> 진료기간 </font>
					</b>
				</div>

				<div class="div_border" style="height: 3.7%;">
					<b> <font size="4em"> 면허번호 </font>
					</b>
				</div>

				<div class="div_border" style="height: 3.8%;">
					<b> <font size="4em"> 의사 </font>
					</b>
				</div>
				
				<input type="reset" value="reset" class="pull-left btn btn-secondary  btn-lg" />
				
			</div>


			<div class="right-box div_border">
				<div class="div_border" style="height: 3.8%;">
					<input type="text" placeholder="이름" name="name"
						class="form-control" style="height: 100%;" />
				</div>

				<div class="div_border" style="height: 3.8%;">
					<input type="text" placeholder="생년월일" name="pnumber"
						class="form-control" style="height:100%;"/>
						
				</div>

				<div class="div_border" style="height: 3.8%;">
					<input type="text" placeholder="진단명" name="Pres"
						class="form-control" style="height:100%%;" />
				</div>

				<div class="div_border" style="height: 42.8%;">
					<textarea cols="auto" rows="auto" placeholder="소견" name="content"
						class="form-control textarea_size" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
				</div>

				<div class="div_border" style="height: 3.7%;">
					<input type="text" placeholder="진료기간" name="date"
						class="form-control" style="height:100%;" />
				</div>

				<div class="div_border" style="height: 3.7%;">
					<input type="text" placeholder="면허번호" name="license"
						class="form-control" style="height:100%;" />
				</div>

				<div class="div_border" style="height: 3.7%;">
					<input type="text" placeholder="의사 성명" class="form-control"
						name="dname" style="height:100%;" />
				</div>
				
			</div>
			
			<input type="submit" value="등록" onclick="sendData()"
				class="pull-right btn btn-primary  btn-lg" />
				<input type="button" value="취소" class="pull-right btn btn-danger btn-lg"
				onclick="javascript:location.href='home.do'" />
			
		</form>
	</div>
</body>
</html>