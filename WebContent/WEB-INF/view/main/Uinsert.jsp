<%@page import="poly.dto.PerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 등록</title>
<%
ArrayList<PerDTO> allsheet = new ArrayList<PerDTO>();
%>
<script type=text/javascript>
	function checkdata(){
		alert("검사중")
		var form = document.forms.frm;
		var field = form.name.value;
				
		if(form.name.value==""){
			alert("이름을 입력해주세요")
		}else if(form.addr.value==""){
			alert("주소를 입력해주세요")
		}else if(form.pnumber.value==""){
			alert("생년월일을 입력해주세요")
		}else if(form.hp.value=""){
			alert("핸드폰번호를 입력해주세요")
		}
		else if(form.gender.value==""){
			alert("성별을 체크해주세요")
		}else{
			document.getElementById('frm').submit()
		}
	};
</script>


<%@include file="/assets/header.jsp" %>

	<div class="container" style="margin-top: 10%;width: 40%;">
		<form action="SendUser.do" name=frm method="post" id="frm">
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
						<td><input type="text" placeholder="생년월일" name="pnumber"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>성별1</th>
						<td><input type="radio" name="gender" id="optionsRadios1"
							value="1" />남 <input type="radio" name="gender"
							id="optionsRadios2" value="0" />여</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="등록" onclick="javascript:checkdata()" class="pull-right btn btn-primary" />
							<input type="button" value="리셋" class="pull-left pull-right btn btn-primary" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>