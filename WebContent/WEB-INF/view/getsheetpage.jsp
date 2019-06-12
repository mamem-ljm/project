<%@page import="poly.dto.PagingDTO"%>
<%@page import="poly.dto.PerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.util.CmmUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 진단서</title>
</head>
<%
	ArrayList<PerDTO> plist = (ArrayList<PerDTO>) request.getAttribute("allsheet");

	PagingDTO paging = (PagingDTO) request.getAttribute("paging");

	if (plist == null) {
		plist = new ArrayList<PerDTO>();
	}
%>
<style>
.table_ul{
	list-style:none;
	margin:0;
	padding:0;
}
.table_li{
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	text-align:center;
	border-bottom:1px solid #D5D5D5;
	line-height: 350%;
}
</style>
<body>

	<%@include file="/assets/header.jsp"%>

	<!-- 페이지 -->
	<script type="text/javascript">
		// 페이지 이동.
		function goPage(page) {
			var pageCount =
	<%=paging.getPageCount()%>
		;

			location.href = "getsheetpage.do?pageCount=" + pageCount
					+ "&pageNum=" + page + "&id=" +
	<%=id%>
		;
		}
	</script>
	<%!//페이지num, 전체Data count만 전달받아 출력.
	private String fnPaging(int pageNum, int totalCount) {
		int pageCount = 5; // 페이지별 출력 row 수
		int blockCount = 5; // 화면에 출력할 block 수
		return fnPaging(pageCount, blockCount, pageNum, totalCount);
	}

	private String fnPaging(int pageCount, int blockCount, int pageNum, int totalCount) {
		String pagingStr = "";

		// 전체 페이지수
		int totalPageCount = totalCount / pageCount; // 전체 페이지 수
		if (totalCount % pageCount > 0)
			totalPageCount++; // 전체 페이지수+1 (나머지가 있을 경우.)

		// 전체 블럭수
		int totalBlockCount = totalPageCount / blockCount; // 전체 블럭수
		if (totalBlockCount % blockCount > 0)
			totalBlockCount++; // 전체 블럭수+1 (나머지가 있을 경우.)

		// 현재 블럭의 시작 페이지
		int startPage = pageNum / blockCount * blockCount + 1;
		if (pageNum % blockCount == 0)
			startPage -= blockCount;

		// 현재 블럭의 마지막 페이지.
		int endPage = startPage + blockCount - 1;
		if (endPage > totalPageCount)
			endPage = totalPageCount;

		//만약 현재 블럭의 시작 페이지가 1보다 크다면. 이전 블럭 . 처음 블럭 버튼 생성.
		if (startPage > 1) {
			//pagingStr = "[<<1][<"+(startPage-1)+"]";
			pagingStr = "<li><a onclick='goPage(1)'> << </a></li>";
			pagingStr = "<li><a onclick='gopage(" + (startPage - 1) + ")'> < </a></li>";
		}

		for (int i = startPage; i <= endPage; i++) {
			pagingStr += "<li><a onclick='goPage(" + i + ")'>" + i + "</a></li>";
		}

		//만약 현재 블럭의 마지막 페이지가 전체 마지막 페이지보다 작다면. 다음블럭, 마지막 블럭 버튼 생성. 
		if (endPage < totalPageCount) {
			//pagingStr += "[>"+(endPage+1)+"][>>"+totalPageCount+"]";
			pagingStr += "<li><a onclick='goPage(" + (endPage + 1) + ") '> </a></li>";
			pagingStr += "<li><a onclick='goPage(" + (totalPageCount) + ")'> >> </a></li>";
		}

		return pagingStr;
	}%>

	<div class="container" style="margin-top:7%;width:93%;height:35%;">
		<img src="/assets/img/02.jpg" style="width:100%;height:100%;"/>
	</div>
	<div class="container" style="margin-top:-3%; width: 50%;">
		<form method="get" action="WritePage.do">
			<div style="margin-top: 10%;">
				<font size="3em" color="gray">진단목록</font>
				<ul class="table_ul">
					<li class="table_li" style="width: 10%;"><font size="3em">환자명</font></li>
					<li class="table_li" style="width: 70%;"><font size="3em">진단명</font></li>
					<li class="table_li" style="width: 20%;"><font size="3em">날짜</font></li>
				</ul>
			</div>
			<div>
				<!-- 시트 목록 가져오기 -->
				<%
					for (PerDTO pdto : plist) {
				%>
				<ul>
					<li class="table_li" style="width: 10%; height: 4%;"><font size="3em"><%=CmmUtil.nvl(pdto.getName())%></font></li>
					<li class="table_li" style="width: 70%; height: 4%;">
						<font size="3em">
							<a	href="sheetinfo.do?s_seq=<%=pdto.getS_SEQ()%>">
								<%=CmmUtil.nvl(pdto.getPres())%>
							</a>
						</font>
					</li>
					
					<li class="table_li" style="width: 20%; height: 4%;">
						<font size="3em">
							<%=CmmUtil.nvl(pdto.getDate())%>
						</font>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</form>

		<div class="text-center">
			<ul class="pagination">
				<%=fnPaging(paging.getPageCount(), 5, paging.getPageNum(), paging.getTotalCount())%>
			</ul>
		</div>
		
	</div>
</body>
</html>