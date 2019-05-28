<%@page import="poly.dto.PerDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진단확인</title>
</head>
<body>
<%@include file="/assets/header.jsp" %>
<%
	PerDTO pdto = (PerDTO) request.getAttribute("pdto");
%>
<table class="table table-bordered" style="margin-left:25%; margin-top:15%; width:50%">
				
				<tr>
					<th style="vertical-align: middle;height: 50px">성함</th>
					<td style="vertical-align: middle;"><%=CmmUtil.nvl(pdto.getName()) %></td>
				</tr>
				
				<tr>
					<th style="vertical-align: middle;height: 50px">생년월일</th>
					<td style="vertical-align: middle;"><%=CmmUtil.nvl(pdto.getPnumber()) %></td>
				</tr>
				
				<tr>
					<th style="vertical-align: middle;height: 50px">진단명</th>
					<td style="vertical-align: middle;"><%=CmmUtil.nvl(pdto.getPres()) %></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;height: 50px">병명 및 소견</th>
					<td style="vertical-align: middle;"><%=CmmUtil.nvl(pdto.getContent()) %></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;height: 50px">진료기간</th>
					<td><%=CmmUtil.nvl(pdto.getDate()) %></td>
				</tr>
				
				<tr>
					<th style="vertical-align: middle;height: 50px">의사</th>
					<td style="vertical-align: middle;"><%=CmmUtil.nvl(pdto.getDname()) %></td>
				</tr>
				<tr>
					<td colspan="2"><a class="pull-right btn btn-primary btn-lg" style="width:100px"href="home.do">홈으로</a></td>
				</tr>
			</table>

</body>
</html>