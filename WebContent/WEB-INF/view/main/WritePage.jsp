<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진단서 작성</title>
<style>
.box {
	display: inline-block;
	margin-right: -6px;
}
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>

<body>
	<div style="width:50%; height:1000px;">
		<form action="SendData.do" method="post">
			<table class="table table-bordered" style="margin-left:50%; margin-top:5%;">


				<tr>
					<th style="width: 300px;">이름<!-- db에서 이름 가져오기 --></td>
						
					<td><input type="text" placeholder="이름"
						name="pnumber" class="form-control" />
					</td>	
				</tr>
				<tr>
					<th style="vertical-align: middle;">병명 및 소견</th>
					<td><textarea cols="10" rows="20" placeholder="내용을 입력하세요. "
							name="content" class="form-control"></textarea></td>
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
					<td><input type="text" placeholder="" class="form-control" placeholder="의사 성명" name="dname"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="sendData()" class="pull-right" />
						<input type="button" value="reset" class="pull-left" />
						<input type="button" value="취소" class="pull-right" onclick="javascript:location.href='home.do'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>