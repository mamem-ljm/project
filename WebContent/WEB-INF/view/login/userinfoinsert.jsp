<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추가정보등록</title>
</head>
<body>
	<%@include file="/assets/header.jsp" %>
	<div class="container" style="margin-top: 10%;width: 40%;">
		<form action="userinfo.do?id=<%=id %>" method="post">
			<table class="table">

				<caption>환자 등록</caption>

				<tbody>

					<tr>
						<th>이름</th>
						<td><input type="text" placeholder="성명" name="name"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" placeholder="주소" name="addr"
							class="form-control"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" placeholder="핸드폰번호" name="hp"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" placeholder="예:000101" name="pnumber"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="gender" id="optionsRadios1"
							value="1" />남 <input type="radio" name="gender"
							id="optionsRadios2" value="0" />여</td>
					</tr>
					<tr>
						<th>의사번호</th>
						<td><input type="text" placeholder="예:0000511" name="pnumber"
							class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" class="pull-right btn btn-primary" />
							<input type="button" value="리셋" class="pull-left pull-right btn btn-primary" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>