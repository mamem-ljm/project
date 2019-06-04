<%@page import="poly.dto.UDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.PagingDTO"%>
<%@page import="poly.dto.PerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자목록</title>
	
    
    <%
    	
    	List<UDTO> ulist = (List<UDTO>) request.getAttribute("alluser");
    	
    	PagingDTO paging = (PagingDTO) request.getAttribute("paging");
    	
    	if(ulist == null){
    		ulist = new ArrayList<UDTO>();
    	}
    	
    %>
    
    <script type="text/javascript">
    
    // 페이지 이동.
  	function goPage(page){
  		var pageCount=<%=paging.getPageCount()%>;
  		
		location.href="Userlist.do?pageCount="+pageCount+"&pageNum="+page;
	}
    </script>
</head>
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
	<%@include file="/assets/header.jsp" %>
	
	<!-- 페이지 -->
<%!
//페이지num, 전체Data count만 전달받아 출력.
private String fnPaging(int pageNum, int totalCount){
int pageCount = 5; // 페이지별 출력 row 수
int blockCount = 5; // 화면에 출력할 block 수
return fnPaging(pageCount, blockCount, pageNum, totalCount);
}

private String fnPaging(int pageCount, int blockCount, int pageNum, int totalCount){
	String pagingStr = "";
	
	// 전체 페이지수
	int totalPageCount = totalCount / pageCount; // 전체 페이지 수
	if(totalCount % pageCount > 0) totalPageCount ++ ; // 전체 페이지수+1 (나머지가 있을 경우.)
	
	// 전체 블럭수
	int totalBlockCount = totalPageCount / blockCount; // 전체 블럭수
	if(totalBlockCount % blockCount > 0) totalBlockCount ++ ; // 전체 블럭수+1 (나머지가 있을 경우.)
	
	// 현재 블럭의 시작 페이지
	int startPage = pageNum / blockCount * blockCount + 1;
	if(pageNum % blockCount == 0) startPage -= blockCount;
	
	// 현재 블럭의 마지막 페이지.
	int endPage = startPage + blockCount - 1;
	if(endPage > totalPageCount) endPage = totalPageCount;
	
	//만약 현재 블럭의 시작 페이지가 1보다 크다면. 이전 블럭 . 처음 블럭 버튼 생성.
		if(startPage > 1){
			//pagingStr = "[<<1][<"+(startPage-1)+"]";
			pagingStr = "<li><a onclick='goPage(1)'> << </a></li>";
			pagingStr = "<li><a onclick='gopage("+(startPage-1)+")'> < </a></li>";
		}
		
		for(int i = startPage ; i <= endPage ; i++){
			pagingStr += "<li><a onclick='goPage("+i+")'>"+i+"</a></li>";
		}
		
		//만약 현재 블럭의 마지막 페이지가 전체 마지막 페이지보다 작다면. 다음블럭, 마지막 블럭 버튼 생성. 
		if(endPage < totalPageCount){
			//pagingStr += "[>"+(endPage+1)+"][>>"+totalPageCount+"]";
			pagingStr += "<li><a onclick='goPage("+(endPage+1)+") '> </a></li>";
			pagingStr += "<li><a onclick='goPage("+(totalPageCount)+")'> >> </a></li>";
		}
		
		return pagingStr;
}
%>
	
	<script type="text/javascript">
		function updateuser(){
			
			var chk=document.getElementsByName("chk_useq");
			var chk_p = 0;
			for(var i =0; i<chk.length; i++){
				if(chk[i].checked==true){
					location.href="UpdateuserPage.do?chk_seq="+chk[i].value;
					chk_p++;
					break;
				}
				
			}
			if(chk_p==0){
				alert("체크를 해주세요")
			}
		}
		
	</script>
	<script type="text/javascript">
	function checkdata() {
		
		var form = document.forms.frm;
		var chk=document.getElementsByName("chk_useq");
		var chk_p = 0;
		
		for(var i = 0; i <chk.length; i++){
			if(chk[i].checked==true){
				chk_p++;
				location.href="WritePage.do?chk_seq="+chk[i].value;
			}
		}
		if(chk_p==0){
			alert("체크를 해주세요");
		}
	};
	</script>
	<script type="text/javascript">
	function DeleteUser(){
		var form = document.forms.frm;
		var chk=document.getElementsByName("chk_useq");
		var chk_p = 0;
		
		for(var i = 0; i <chk.length; i++){
			if(chk[i].checked==true){
				chk_p++;
				location.href="DeleteUser.do?chk_seq="+chk[i].value;
			}
		}
		if(chk_p==0){
			alert("체크를 해주세요");
		}
	};
	</script>
	
	<div class="container" style="margin-top: 10%;width: 50%;">
		
		<form method="get" action="WritePage.do">
			<div style="margin-top:10%;">
				<font size="3em" color="gray">환자목록</font>
				<ul class="table_ul">
					<li class="table_li" style="width:10%;"><font size="3em">체크</font></li>
					<li class="table_li" style="width:70%;"><font size="3em">환자명</font></li>
					<li class="table_li" style="width:20%;"><font size="3em">생년월일</font></li>
				</ul>
			</div>
			<div>
			<%for( UDTO udto : ulist ) {%>
				<ul>
					<li class="table_li" style="width:10%;height:4%;"><input type="radio" name="chk_useq" value="<%=CmmUtil.nvl(udto.getU_seq())%>"></li>
					<li class="table_li" style="width:70%;height:4%;"><font size="3em"><%=CmmUtil.nvl(udto.getName()) %></font></li>
					<li class="table_li" style="width:20%;height:4%;"><font size="3em"><%=CmmUtil.nvl(udto.getPnumber()) %></font></li>
				</ul>
			<%} %>
			</div>
			<a class="btn btn-default pull-left" href="javascript:void(0)" onclick="javascript:DeleteUser()">삭제</a>
			<input type="button" value="작성" class="btn btn-default pull-right" onclick="javascript:checkdata();"/>
			<a class="btn btn-default pull-right" type="button" href="javascript:void(0);" onclick="javascript:updateuser();">수정</a>
			
		</form>
		
		<div class="text-center">
			<ul class="pagination" style="margin-top:5%">
				
				<%=	fnPaging(
						paging.getPageCount(), 5, paging.getPageNum(), paging.getTotalCount()
						)	
				%>
			</ul>
		</div>
	</div>
</body>
</html>

