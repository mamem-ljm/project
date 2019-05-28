<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진단서 작성</title>
<style>
<%
	String chk_useq = request.getParameter("chk_useq");
%>
.box {
	display: inline-block;
	margin-right: -6px;
}
</style>

<%@include file="/assets/header.jsp" %>
	
	<div style="width:50%; height:1000px; margin-top:10%">
		<form action="SendData.do?chk_useq=<%=chk_useq %>" method="post">
			<table class="table table-bordered" style="margin-left:50%; margin-top:5%;">

				<tr>
					<th style="vertical-align: middle;">이름</th>
					<td><input type="text" placeholder="이름" name="name" class="form-control" /></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">생년월일</th>
					<td><input type="text" placeholder="생년월일" name="pnumber" class="form-control" /></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">진단명</th>
					<td><input type="text" placeholder="진단명" name="Pres" class="form-control" /></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">병명 및 소견</th>
					<td>
						<textarea cols="8" rows="20" placeholder="진단명" name="content" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<th>진료기간</th>
					<td><input type="text" placeholder="진료기간"
						name="date" class="form-control" /></td>
				</tr>
				<tr>
					<th>면허번호</th>
					<td><input type="text" placeholder="면허번호"
						name="license"class="form-control" /></td>
				</tr>
				<tr>
					<th>의사</th>
					<td><input type="text" placeholder="의사 성명" class="form-control" name="dname"/></td>
				</tr>
				<tr>
					
					<td colspan="2">
						<input type="submit" value="등록" onclick="sendData()" class="pull-right btn btn-primary  btn-lg" />
						<input type="button" value="reset" class="pull-left btn btn-secondary  btn-lg" />
						<input type="button" value="취소" class="pull-right btn btn-danger  btn-lg" onclick="javascript:location.href='home.do'" />
					</td>
					
				</tr>
			</table>
		</form>
	</div>
</body>
</html>