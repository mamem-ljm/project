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
    	List<PerDTO> plist = (List<PerDTO>) request.getAttribute("allsheet");
    
    	PagingDTO paging = (PagingDTO) request.getAttribute("paging");
    	
    	if (plist==null){
    		plist=new ArrayList<PerDTO>();
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
<body>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<link href="/assets/css/theme_fonts.css" rel="stylesheet" />
	<link href="/assets/css/theme_colors.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="/assets/css/viewer_min.css" />

	<link href="/assets/css/pc1.css" rel="stylesheet" type="text/css"
		data-styleid="pc1" />

	<link href="/assets/css/siteBackground.css" rel="stylesheet" type="text/css"
		data-styleid="siteBackground" />

	<link href="/assets/css/style-jnitutu5.css" rel="stylesheet" type="text/css"
		data-styleid="style-jnitutu5" />

	<link href="/assets/css/style-jnej9x48.css" rel="stylesheet" type="text/css"
		data-styleid="style-jnej9x48" />

	<link href="/assets/css/p1.css" rel="stylesheet" type="text/css"
		data-styleid="p1" />

	<link href="/assets/css/style-jqccasb4.css" rel="stylesheet" type="text/css"
		data-styleid="style-jqccasb4" />

	<link href="/assets/css/style-jkjozsak.css" rel="stylesheet" type="text/css"
		data-styleid="style-jkjozsak" />

	<link href="/assets/css/lb1.css" rel="stylesheet" type="text/css"
		data-styleid="lb1" />

	<link href="/assets/css/style-jncrii45.css" rel="stylesheet" type="text/css"
		data-styleid="style-jncrii45" />

	<link href="/assets/css/style-jezowobv.css" rel="stylesheet" type="text/css"
		data-styleid="style-jezowobv" />

	<link href="/assets/css/txtNew.css" rel="stylesheet" type="text/css"
		data-styleid="txtNew" />

	<link href="/assets/css/style-jibfh6j53.css" rel="stylesheet" type="text/css"
		data-styleid="style-jibfh6j53" />

	<link href="/assets/css/ca1.css" rel="stylesheet" type="text/css"
		data-styleid="ca1" />

	<link href="/assets/css/strc1.css" rel="stylesheet" type="text/css"
		data-styleid="strc1" />

	<link href="/assets/css/mc1.css" rel="stylesheet" type="text/css"
		data-styleid="mc1" />

	<link href="/assets/css/style-jjpggu4r1.css" rel="stylesheet" type="text/css"
		data-styleid="style-jjpggu4r1" />

	<header data-is-mobile="false" data-state="fixedPosition"
		data-site-width="980" data-header-top="0"
		style="top: 0; left: 0; margin-left: 0; width: 100%; min-width: 980px; bottom:; right:; z-index: 50"
		class="style-jnej9x48" id="SITE_HEADER">
		<div style="left: 0; width: 100%"
			id="SITE_HEADERscreenWidthBackground"
			class="style-jnej9x48screenWidthBackground">
			<div class="style-jnej9x48_bg"></div>
		</div>
		<div id="SITE_HEADERcenteredContent"
			class="style-jnej9x48centeredContent">
			<div style="margin-left: calc(( 100% - 980px)/2); width: 980px"
				id="SITE_HEADERbg" class="style-jnej9x48bg">
				<div class="style-jnej9x48_bg-center"></div>
			</div>
			<div id="SITE_HEADERinlineContent"
				class="style-jnej9x48inlineContent">
				<style id="SITE_HEADER-mesh-styles">
#SITE_HEADERinlineContent {
	height: auto;
	width: 100%;
	position: relative;
}

#SITE_HEADERinlineContent-gridWrapper {
	pointer-events: none;
}

#SITE_HEADERinlineContent-gridContainer {
	position: static;
	display: grid;
	height: auto;
	width: 100%;
	min-height: auto;
	grid-template-rows: 1fr;
	grid-template-columns: 100%;
}

#comp-jjs6oa1g {
	position: relative;
	margin: 53px 0px 0px calc(( 100% - 980px)* 0.5);
	left: 0px;
	grid-area: 1/1/2/2;
	justify-self: start;
	align-self: start;
}

#SITE_HEADERcenteredContent {
	position: relative;
}

#SITE_HEADERinlineContent-gridContainer>* {
	pointer-events: initial;
}

#SITE_HEADERinlineContent-gridContainer>[id$="-rotated-wrapper"] {
	pointer-events: none;
}

#SITE_HEADERinlineContent-gridContainer>[id$="-rotated-wrapper"]>* {
	pointer-events: initial;
}
</style>
				<div id="SITE_HEADERinlineContent-gridWrapper"
					data-mesh-internal="true">
					<div id="SITE_HEADERinlineContent-gridContainer"
						data-mesh-internal="true">
						<section
							style="left: 0; width: 100%; min-width: 820px; height: auto; top:; bottom:; right:; position:; margin-left: 0"
							data-responsive="true" data-is-screen-width="true"
							data-col-margin="0" data-row-margin="0" class="strc1"
							id="comp-jjs6oa1g">
							<div
								style="position: absolute; top: 0px; width: calc(100% - 160px); height: 100%; overflow: hidden; pointer-events: auto; min-width: 980px; left: 0px; right: 0px; bottom: 0px;"
								data-page-id="masterPage" data-enable-video="true"
								data-bg-effect-name="" data-media-type=""
								data-render-fixed-position="true" data-use-clip-path=""
								data-needs-clipping="" class="strc1balata"
								id="comp-jjs6oa1gbalata">
								<div
									style="position: absolute; width: 100%; height: 100%; top: 0; background-color: transparent"
									data-background-image="" data-position="absolute"
									class="bgColor" id="comp-jjs6oa1gbalatabgcolor">
									<div
										style="width: 100%; height: 100%; position: absolute; top: 0; background-image:; opacity: 1"
										id="comp-jjs6oa1gbalatabgcoloroverlay" class="bgColoroverlay"></div>
								</div>
							</div>
							<div
								style="position: relative; width: calc(100% - 160px); min-width: 980px"
								id="comp-jjs6oa1ginlineContent" class="strc1inlineContent">
								<div
									style="position: relative; width: 100%; left: 0; flex: 363; margin-left: 0; min-width: 363px; top: 0; margin-top: 0; margin-bottom: 0; height:; display: flex; bottom:; right:"
									data-content-width="363" data-is-mesh="true" class="mc1"
									id="comp-jjs6oa2j">
									<div style="position: relative; height: 100%; width: 100%"
										id="comp-jjs6oa2jcontainer" class="mc1container">
										<div
											style="position: absolute; top: 0px; width: 100%; height: 100%; overflow: hidden; pointer-events: auto; min-width: 363px; left: 0px; right: 0px; bottom: 0px;"
											data-page-id="masterPage" data-enable-video="true"
											data-bg-effect-name="" data-media-type=""
											data-render-fixed-position="true" data-use-clip-path=""
											data-needs-clipping="" class="mc1balata"
											id="comp-jjs6oa2jbalata">
											<div
												style="position: absolute; width: 100%; height: 100%; top: 0; background-color: rgba(0, 99, 160, 1)"
												data-background-image="" data-position="absolute"
												class="bgColor" id="comp-jjs6oa2jbalatabgcolor">
												<div
													style="width: 100%; height: 100%; position: absolute; top: 0; background-image:; opacity: 1"
													id="comp-jjs6oa2jbalatabgcoloroverlay"
													class="bgColoroverlay"></div>
											</div>
										</div>
										<div
											style="min-width: 363px; width: 100%; height: 100%; position: relative; left: 0; right: 0; top: 0; bottom: 0"
											id="comp-jjs6oa2jinlineContentParent"
											class="mc1inlineContentParent">
											<div
												style="width: 100%; position: relative; top: 0; bottom: 0"
												id="comp-jjs6oa2jinlineContent" class="mc1inlineContent">
												<style id="comp-jjs6oa2j-mesh-styles">
#comp-jjs6oa2jinlineContent {
	height: auto;
	width: 100%;
	position: relative;
}

#comp-jjs6oa2jinlineContent-gridWrapper {
	pointer-events: none;
}

#comp-jjs6oa2jinlineContent-gridContainer {
	position: static;
	display: grid;
	height: auto;
	width: 100%;
	min-height: auto;
	grid-template-rows: 1fr;
	grid-template-columns: 100%;
}

#comp-jezowoa0 {
	position: relative;
	margin: 18px 0px 25px calc(( 100% - 363px)* 0);
	left: 56px;
	grid-area: 1/1/2/2;
	justify-self: start;
	align-self: start;
}

#comp-ja27hj5n {
	position: relative;
	margin: 25px 0px 32px calc(( 100% - 363px)* 0);
	left: 131px;
	grid-area: 1/1/2/2;
	justify-self: start;
	align-self: start;
}

#comp-jjs6oa2jcenteredContent {
	position: relative;
}

#comp-jjs6oa2jinlineContent-gridContainer>* {
	pointer-events: initial;
}

#comp-jjs6oa2jinlineContent-gridContainer>[id$="-rotated-wrapper"] {
	pointer-events: none;
}

#comp-jjs6oa2jinlineContent-gridContainer>[id$="-rotated-wrapper"]>* {
	pointer-events: initial;
}
</style>
												<div id="comp-jjs6oa2jinlineContent-gridWrapper"
													data-mesh-internal="true">
													<div id="comp-jjs6oa2jinlineContent-gridContainer"
														data-mesh-internal="true">
														<div data-svg-id="131268db0f1840cdba3167be9cff32a1.svg"
															data-svg-type="color" data-display-mode="fit"
															data-viewbox="0 0 200 200" data-preserve-viewbox="ignore"
															style="top:; bottom:; left:; right:; width: 49px; height: 48px; position:"
															class="style-jezowobv" id="comp-jezowoa0">
															<style>
.style-jezowobv_comp-jezowoa0 svg [data-color="1"] {
	fill: rgba(255, 255, 255, 1);
}

.style-jezowobv_comp-jezowoa0 svg [data-color="2"] {
	fill: rgba(1, 197, 162, 1);
}
</style>
															<a href="https://leejmin60.wixsite.com/projectsite"
																target="_self" style="cursor: pointer"
																id="comp-jezowoa0link" class="style-jezowobvlink"><div
																	style="opacity: 1"
																	class="style-jezowobv_comp-jezowoa0 style-jezowobv_non-scaling-stroke style-jezowobvsvg"
																	id="comp-jezowoa0svg">
																	<svg preserveAspectRatio="xMidYMid meet"
																		data-bbox="58 59 84 82" viewBox="58 59 84 82"
																		height="200" width="200"
																		xmlns="http://www.w3.org/2000/svg" data-type="color"
																		role="img" style="">
    <g>
        <path fill="#FFFFFF"
																			d="M142 88.227v-4.388h-26.333V59H83.053v24.839H58v32.271h25.053V141h32.614v-24.89h14.36v-4.389h-18.796v24.827H87.488l.102-24.827H62.435V88.227h25.053V63.389h23.743v24.89L142 88.227z"
																			data-color="1"></path>
        <path fill="#E96C54"
																			d="M106.456 97.806h-4.238v-4.194h-4.436v4.194h-4.238v4.388h4.238v4.194h4.436v-4.194h4.238v-4.388z"
																			data-color="2"></path>
    </g>
</svg>
																</div></a>
														</div>
														<div data-packed="true"
															style="width: 232px; pointer-events: none;"
															class="txtNew" id="comp-ja27hj5n">
															<p class="font_3">
																<span class="color_11"><a
																	href="https://leejmin60.wixsite.com/projectsite"
																	target="_self"><font
																		style="vertical-align: inherit;"><font
																			style="vertical-align: inherit;">의료 클리닉</font></font></a></span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div
									style="position: relative; width: 100%; left: 0; flex: 617; margin-left: 0px; min-width: 617px; top: 0; margin-top: 0; margin-bottom: 0; height:; display: flex; bottom:; right:"
									data-content-width="617" data-is-mesh="true" class="mc1"
									id="comp-jjslrl2r">
									<div style="position: relative; height: 100%; width: 100%"
										id="comp-jjslrl2rcontainer" class="mc1container">
										<div
											style="position: absolute; top: 0px; width: 100%; height: 100%; overflow: hidden; pointer-events: auto; min-width: 617px; left: 0px; right: 0px; bottom: 0px;"
											data-page-id="masterPage" data-enable-video="true"
											data-bg-effect-name="" data-media-type=""
											data-render-fixed-position="true" data-use-clip-path=""
											data-needs-clipping="" class="mc1balata"
											id="comp-jjslrl2rbalata">
											<div
												style="position: absolute; width: 100%; height: 100%; top: 0; background-color: rgba(0, 99, 160, 1)"
												data-background-image="" data-position="absolute"
												class="bgColor" id="comp-jjslrl2rbalatabgcolor">
												<div
													style="width: 100%; height: 100%; position: absolute; top: 0; background-image:; opacity: 1"
													id="comp-jjslrl2rbalatabgcoloroverlay"
													class="bgColoroverlay"></div>
											</div>
										</div>
										<div
											style="min-width: 617px; width: 100%; height: 100%; position: relative; left: 0; right: 0; top: 0; bottom: 0"
											id="comp-jjslrl2rinlineContentParent"
											class="mc1inlineContentParent">
											<div
												style="width: 100%; position: relative; top: 0; bottom: 0"
												id="comp-jjslrl2rinlineContent" class="mc1inlineContent">
												<style id="comp-jjslrl2r-mesh-styles">
#comp-jjslrl2rinlineContent {
	height: auto;
	width: 100%;
	position: relative;
}

#comp-jjslrl2rinlineContent-gridWrapper {
	pointer-events: none;
}

#comp-jjslrl2rinlineContent-gridContainer {
	position: static;
	display: grid;
	height: auto;
	width: 100%;
	min-height: auto;
	grid-template-rows: 1fr;
	grid-template-columns: 100%;
}

#comp-ja27wet6 {
	position: relative;
	margin: 28px 0px 35px calc(( 100% - 617px)* 1);
	left: 5px;
	grid-area: 1/1/2/2;
	justify-self: start;
	align-self: start;
}

#comp-jjslrl2rcenteredContent {
	position: relative;
}

#comp-jjslrl2rinlineContent-gridContainer>* {
	pointer-events: initial;
}

#comp-jjslrl2rinlineContent-gridContainer>[id$="-rotated-wrapper"] {
	pointer-events: none;
}

#comp-jjslrl2rinlineContent-gridContainer>[id$="-rotated-wrapper"]>* {
	pointer-events: initial;
}
</style>
												<div id="comp-jjslrl2rinlineContent-gridWrapper"
													data-mesh-internal="true">
													<div id="comp-jjslrl2rinlineContent-gridContainer"
														data-mesh-internal="true">
														<nav id="comp-ja27wet6"
															class="hidden-during-prewarmup style-jqccasb4"
															style="width: 570px; height: 28px; overflow-x: visible;"
															data-menuborder-y="0" data-menubtn-border="0"
															data-ribbon-els="0" data-label-pad="0"
															data-ribbon-extra="0" data-drophposition=""
															data-dropalign="right" dir="ltr"
															data-state="right notMobile" data-dropmode="dropDown">
															<ul style="text-align: right"
																aria-label="Site navigation" role="navigation"
																id="comp-ja27wet6itemsContainer"
																class="style-jqccasb4itemsContainer">
																<li data-direction="ltr" data-listposition="center"
																	data-data-id="bmi23nr"
																	class="style-jqccasb4repeaterButton"
																	data-state="menu selected idle link notMobile"
																	id="comp-ja27wet60"
																	data-original-gap-between-text-and-btn="10"
																	aria-hidden="false"
																	style="width: 15%; height: 28px; position: relative; box-sizing: border-box; overflow: visible;"><a
																	role="button" tabindex="0" aria-haspopup="false"
																	data-listposition="center" href="" target="_self"
																	id="comp-ja27wet60linkElement"
																	class="style-jqccasb4repeaterButtonlinkElement"><div
																			class="style-jqccasb4repeaterButton_gapper">
																			<div style="text-align: right" id="comp-ja27wet60bg"
																				class="style-jqccasb4repeaterButtonbg">
																				<p style="text-align: right; line-height: 28px;"
																					id="comp-ja27wet60label"
																					class="style-jqccasb4repeaterButtonlabel">
																					<font style="vertical-align: inherit;"><font
																						style="vertical-align: inherit;">집</font></font>
																				</p>
																			</div>
																		</div></a></li>
																<li data-direction="ltr" data-listposition="center"
																	data-data-id="dataItem-jk9spxah"
																	class="style-jqccasb4repeaterButton"
																	data-state="menu  idle link notMobile"
																	id="comp-ja27wet61"
																	data-original-gap-between-text-and-btn="11"
																	aria-hidden="false"
																	style="width: 15%; height: 28px; position: relative; box-sizing: border-box; overflow: visible;"><a
																	role="button" tabindex="0" aria-haspopup="false"
																	data-listposition="center" href="" target="_self"
																	data-keep-roots="true" data-anchor="dataItem-jk9smvoe"
																	id="comp-ja27wet61linkElement"
																	class="style-jqccasb4repeaterButtonlinkElement"><div
																			class="style-jqccasb4repeaterButton_gapper">
																			<div style="text-align: right" id="comp-ja27wet61bg"
																				class="style-jqccasb4repeaterButtonbg">
																				<p style="text-align: right; line-height: 28px;"
																					id="comp-ja27wet61label"
																					class="style-jqccasb4repeaterButtonlabel">
																					<font style="vertical-align: inherit;"><font
																						style="vertical-align: inherit;">찾기</font></font>
																				</p>
																			</div>
																		</div></a></li>

																<li data-direction="ltr" data-listposition="right"
																	data-data-id="dataItem-jjpggu3z"
																	class="style-jqccasb4repeaterButton"
																	data-state="menu  idle link notMobile"
																	id="comp-ja27wet64"
																	data-original-gap-between-text-and-btn="11"
																	aria-hidden="false"
																	style="width: 15%; height: 28px; position: relative; box-sizing: border-box; overflow: visible;"><a
																	role="button" tabindex="0" aria-haspopup="false"
																	data-listposition="right" href="WritePage.do"
																	target="_self" id="comp-ja27wet64linkElement"
																	class="style-jqccasb4repeaterButtonlinkElement"><div
																			class="style-jqccasb4repeaterButton_gapper">
																			<div style="text-align: right" id="comp-ja27wet64bg"
																				class="style-jqccasb4repeaterButtonbg">
																				<p style="text-align: right; line-height: 28px;"
																					id="comp-ja27wet64label"
																					class="style-jqccasb4repeaterButtonlabel">
																					<font style="vertical-align: inherit;"><font
																						style="vertical-align: inherit;">작성</font></font>

																				</p>
																			</div>
																		</div></a></li>

																<li data-direction="ltr" data-listposition="right"
																	data-data-id="dataItem-jjpggu3z"
																	class="style-jqccasb4repeaterButton"
																	data-state="menu  idle link notMobile"
																	id="comp-ja27wet64"
																	data-original-gap-between-text-and-btn="11"
																	aria-hidden="false"
																	style="width: 15%; height: 28px; position: relative; box-sizing: border-box; overflow: visible;"><a
																	role="button" tabindex="0" aria-haspopup="false"
																	data-listposition="right" href="Uinsert.do"
																	target="_self" id="comp-ja27wet64linkElement"
																	class="style-jqccasb4repeaterButtonlinkElement"><div
																			class="style-jqccasb4repeaterButton_gapper">
																			<div style="text-align: right" id="comp-ja27wet64bg"
																				class="style-jqccasb4repeaterButtonbg">
																				<p style="text-align: right; line-height: 28px;"
																					id="comp-ja27wet64label"
																					class="style-jqccasb4repeaterButtonlabel">
																					<font style="vertical-align: inherit;"><font
																						style="vertical-align: inherit;">등록</font></font>
																				</p>
																			</div>
																		</div></a></li>

															</ul>
															<div id="comp-ja27wet6moreButton"
																class="style-jqccasb4moreButton"></div>
															<nav
																style="visibility: hidden; left: auto; right: 0px; bottom: auto;"
																data-drophposition="" data-dropalign="right"
																id="comp-ja27wet6dropWrapper"
																class="style-jqccasb4dropWrapper">
																<ul style="visibility: hidden; left: auto; right: 0px;"
																	id="comp-ja27wet6moreContainer"
																	class="style-jqccasb4moreContainer"></ul>
															</nav>
														</nav>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</header>
	
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
	
	
	<div class="container" style="margin-top: 10%;width: 50%;">

			<table class="table">

				<caption>환자 목록</caption>
				
				<tr>
					<td style="width:10%;">번호</td>
					<td style="width:15%;">환자명</td>
					<td style="width:40%;">진단명</td>
					<td style="width:15%;">담당의사</td>
					<td style="width:20%;">날짜</td>
				</tr>
				<!-- 게시물용 환자 목록 가져오기 -->
				<%for( PerDTO pdto : plist ) {%>
				<tr>
					<td><%=CmmUtil.nvl(pdto.getS_SEQ()) %></td>
					<td><%=CmmUtil.nvl(pdto.getName()) %></td>
					<td><%=CmmUtil.nvl(pdto.getPres()) %></td>
					<td><%=CmmUtil.nvl(pdto.getDname()) %></td>
					<td><%=CmmUtil.nvl(pdto.getDate()) %></td>
				</tr>
				<%} %>
			</table>
			
			
			
			<a class="btn btn-default pull-right" href="WritePage.do">작성</a>
			
		<div class="text-center">
		
			<ul class="pagination">
				<%=	fnPaging(
						paging.getPageCount(), 5, paging.getPageNum(), paging.getTotalCount()
						)	
				%>
			</ul>
		</div>
	</div>
</body>
</html>

