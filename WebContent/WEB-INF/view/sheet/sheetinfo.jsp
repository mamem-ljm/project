<%@page import="poly.dto.PerDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진단확인</title>
</head>
<style>
.div_border {
	border-bottom: 1px solid #D5D5D5;
}

.left-box {
	float: left;
	width: 35%;
}
.right-box {
	float: right;
	width: 65%;
}
.textarea_size{
	min-height:100%;
	overflow:visible;
}

</style>
<body>
	<%@include file="/assets/header.jsp"%>
	<%
		PerDTO pdto = (PerDTO) request.getAttribute("pdto");
	%>
	
	<div class="container" style="width:50%;margin-top:10%">
		
		
			<div class="left-box">
				<div class="div_border" style="height: 4.8%;">
					<b> <font size="4em"> 이름 </font>
					</b>
				</div>

				<div class="div_border" style="height: 4.8%;">
					<b> <font size="4em">생년월일</font>
					</b>
				</div>

				<div class="div_border" style="height: 4.8%;">
					<b> <font size="4em">진단명</font>
					</b>
				</div>

				<div class="div_border" style="height: 42.8%;">
					<b> <font size="4em">병명 및 소견</font>
					</b>
				</div>

				<div class="div_border" style="height: 4.8%;">
					<b> <font size="4em">진료기간</font>
					</b>
				</div>
				
				<div class="div_border" style="height: 4.8%;">
					<b> <font size="4em">의사</font>
					</b>
				</div>
								
			</div>


			<div class="right-box">
				<div class="div_border" style="height: 4.8%;">
					<font size="4em"><%=CmmUtil.nvl(pdto.getName())%></font>
					
				</div>

				<div class="div_border" style="height: 4.8%;">
				<font size="4em"><%=CmmUtil.nvl(pdto.getPnumber())%></font>
					
				</div>
				
				<div class="div_border" style="height: 4.8%;">
				<font size="4em"><%=CmmUtil.nvl(pdto.getPres())%></font>
					
				</div>

				<div class="div_border" style="height: 42.8%;">
				<font size="4em">
					<textarea cols="58" rows="16" style="border:0"><%=CmmUtil.nvl(pdto.getContent())%></textarea>
				</font>
					
				</div>

				<div class="div_border" style="height: 4.8%;">
				<font size="4em"><%=CmmUtil.nvl(pdto.getDate())%></font>
					
				</div>
				
				<div class="div_border" style="height: 4.8%;">
				<font size="4em"><%=CmmUtil.nvl(pdto.getDname())%></font>
					
				</div>
				
			</div>
			<a class="pull-right btn btn-primary btn-lg"
				style="width: 100px" href="home.do">홈으로</a>
		
	</div>

</body>
</html>