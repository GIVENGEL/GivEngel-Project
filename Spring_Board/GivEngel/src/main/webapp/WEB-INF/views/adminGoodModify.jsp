<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GivEngel [개발자 모드]</title>
<!-- Css Styles -->

<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
<link href="${path}/resources/css/admin/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/font-awesome.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/datepicker3.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
</head>
<body>
	<c:if test="${admin != null}">
	
	<jsp:include page="module/adminSidebar.jsp" />
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
			<c:if test="${admin.admin_level ==1 }">
				<img src="${path}/resources/img/admin/lv1.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==2 }">
				<img src="${path}/resources/img/admin/lv2.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==3 }">
				<img src="${path}/resources/img/admin/lv3.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==4 }">
				<img src="${path}/resources/img/admin/lv4.png" class="img-responsive" alt="">
			</c:if>
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name"> ${admin.admin_id}</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class=""><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
			<li><a href="adminWidgets.giv"><em class="fa fa-calendar">&nbsp;</em> 개발자보드</a></li>
			<c:if test="${admin.admin_level > 0 }">
			<li ><a href="adminCharts.giv"><em class="fa fa-bar-chart">&nbsp;</em> 분석/통계</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 1 }">
			<li class="parent active"><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> 상품 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="adminElements.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 추가
					</a></li>
					<li><a class="" href="adminGoodDelete.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 삭제
					</a></li>
					<li><a class="" href="adminGoodModify.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 수정
					</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li class="parent "><a data-toggle="collapse" href="#sub-item-2">
				<em class="fa fa-navicon">&nbsp;</em> 후원 단체 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-2">
					<li><a class="" href="adminElements2.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 등록
					</a></li>
					<li><a class="" href="adminSponDelete.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 삭제
					</a></li>
					<li><a class="" href="adminSponModify.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 수정
					</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li><a href="adminFlea.giv"><em class="fa fa-toggle-off">&nbsp;</em> 중고 상품 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li><a href="adminUserAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 유저 계정 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 3 }">
			<li><a href="adminAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 개발자 계정 관리</a></li>
			</c:if>
			
			<li><a href="adminlogoutAction.giv"><em class="fa fa-power-off">&nbsp;</em> 로그아웃</a></li>
		</ul>
	</div>
		<!--/.sidebar-->
		<!-- ---------------------------------------------------------------------------------------- -->

		<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
			<div class="row">
				<ol class="breadcrumb">
					<li><a href="adminMode.giv"> <em class="fa fa-home"></em>
					</a></li>
					<li>상품 관리</li>
					<li class="active">상품 수정</li>
				</ol>
			</div>
			<!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1>상품 정보 수정</h1>
				</div>
			</div>
			<!--/.row-->


			<div class="row">
				<div class="col-lg-12">

					<h2>상품 목록</h2>
					<div class="product__pagination" id="paging_div">
                      
             </div>
             <hr>
				</div>

				<!-- /.row -->
				<div class="col-lg-12 card-margin"  style="margin-bottom:50px">
        <div class="card search-form">
            <div class="card-body p-0">
                <form id="searchForm" action="searchGood.giv" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                <div class="col-lg-2 col-md-3 col-sm-3 p-0" style="padding:0px">
                                    <select class="form-control" id="part" name="part" style="margin-left:30px">
                                        <option value="good_name">상품 이름</option>
                                        <option value="good_tag">상품 태그</option>
                                        <option value="good_detail">상품 설명</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 p-0" style="padding:0px">
                                    <input type="text" placeholder="검색 내용" style="margin-left:30px" class="form-control" id="searchData" name="searchData">
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 p-0" style="padding:0px">
                                    <input id="submitbtn" type="button" class="btn btn-base" style="margin-left:30px" value="검색하기">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


				<div class="panel panel-default">
					<!-- 전체상품 리스트 출력(현재 카테고리별 출력까지 구현) -->
					<div class="row">
					<div id="searchResult">
					 <c:set var="i" value="0" />
					 <c:forEach items="${goodList }" var="goodVO">
					 	 <c:if test="${i != '12' }">
					 <c:set var="i" value="${i+1 }" />
					
					 	<div class="col-sm-3 col-md-2" >
							<div class="thumbnail">
								<img src="${path}/resources/img/good/${goodVO.good_img}" onerror="this.src='${path}/resources/img/null.jpg'" alt="${goodVO.good_name}">
								<div class="caption">
									<h4 style=" overflow: hidden;text-overflow: ellipsis;white-space: nowrap; width: 200px;height: 40px;">${goodVO.good_name}</h4>
									<p>${goodVO.good_price} 원</p>
									<p>
										<a href="adminGoodModifyForm.giv?good_no=${goodVO.good_no}" class="btn btn-primary" role="button">수정하기</a>
									</p>
								</div>
							</div>
						</div>
						</c:if>
					 </c:forEach>
					</div>
					</div>
					<!-- 전체상품 리스트 end -->
					<div class="panel-body"></div>
				</div>
			</div>
			<!-- /.panel-->
		</div>
		<!-- /.col-->
		<div class="col-sm-12">
			<p class="back-link">
				Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a>
			</p>
		</div>
		</div>
		<!-- /.row -->
		</div>
		<!--/.main-->

		<script src="${path}/resources/js/admin/jquery-1.11.1.min.js"></script>
		<script src="${path}/resources/js/admin/bootstrap.min.js"></script>
		<script src="${path}/resources/js/admin/chart.min.js"></script>
		<script src="${path}/resources/js/admin/chart-data.js"></script>
		<script src="${path}/resources/js/admin/easypiechart.js"></script>
		<script src="${path}/resources/js/admin/easypiechart-data.js"></script>
		<script src="${path}/resources/js/admin/bootstrap-datepicker.js"></script>
		<script src="${path}/resources/js/admin/custom.js"></script>
		<script>
			window.onload = function() {
				
				
				 $(document).on("click","#myMsgCheck",function(){

						$.ajax({
							url:"updateCheckMsg.giv",
							type:"post",
							
							success:function(data){
								$("#msgcount").text("0");
								
							}
						});
				
					
					
				})

				/* 				
				<a href="#"><i class="fa fa-long-arrow-left"></i></a>
                <a class="page">1</a>
                <a class="page">2</a>
                <a class="page">3</a>
                <a href="#"><i class="fa fa-long-arrow-right"></i></a> */
                var divider = 12;
                var header=1;
                var maxPage;
				
                $.ajax({
					url : "adminSelectGoods.giv",
					type : "post",
					success : function(data) {
						var goodCount = data.list.length;
						
						if(goodCount%divider == 0){
							maxPage = parseInt(goodCount/divider);
						}
						else{
							maxPage = parseInt(goodCount/divider)+1;
						}
						
						$("#paging_div").empty();
						$("#paging_div").append('<a id="left" href="#"><i class="fa fa-long-arrow-left"></i></a>');
						for(var i=1;i<=maxPage;i++){
                	$("#paging_div").append("<a class='page' href='#'>"+i+"</a>");
              			}
                $("#paging_div").append('<a id="right" href="#"><i class="fa fa-long-arrow-right"></i></a>');
                
                
                $(".page").eq(header-1).css({
					"background": "#7fad39",
					"border-color": "#7fad39",
					"color": "#ffffff"
				});
					}
				});
				
				
				
				
				
				$(document).on("click",".page",function(){
					header = parseInt($(this).text());
					
					$(".page").css({
						"background": "none",
						"border-color": "none",
						"color": "#b2b2b2"
					})
					
					
					$(this).css({
						"background": "#7fad39",
					"border-color": "#7fad39",
					"color": "#ffffff"
					});
					
					
					var start = divider*header-divider;
					var end = divider*(header+1)-divider;
					$.ajax({
						url : "adminSelectGoods.giv",
						type : "post",
						success : function(data) {
							var list = data.list;
							
							$("#searchResult").empty();
							for(var i=start;i<end;i++){
								$("#searchResult").append('<div class="col-sm-3 col-md-2"><div class="thumbnail"><img class="good_img" src="${path}/resources/img/good/'+data.list[i].good_img+'"  alt="'+data.list[i].good_name+'" ><div class="caption"><h4 style=" overflow: hidden;text-overflow: ellipsis;white-space: nowrap; width: 200px;height: 40px;" >'+data.list[i].good_name+'</h4><p>'+data.list[i].good_price +' 원</p><p><a href="adminGoodModifyForm.giv?good_no='+data.list[i].good_no+'" class="btn btn-primary" role="button">수정하기</a></p></div></div></div>')
							}
							
						}
					});
					
				})
				
				$(document).on("click","#right",function(){
					if(header>=maxPage){
					
					}
					else{
						header = header+1;
						$(".page").css({
							"background": "none",
							"border-color": "none",
							"color": "#b2b2b2"
						})
						$(".page").eq(header-1).css({
							"background": "#7fad39",
							"border-color": "#7fad39",
							"color": "#ffffff"
							});
						
						var start = divider*(header)-divider;
						var end = divider*(header+1)-divider;
						$.ajax({
							url : "adminSelectGoods.giv",
							type : "post",
							success : function(data) {
								var list = data.list;
								
								$("#searchResult").empty();
								for(var i=start;i<end;i++){
									$("#searchResult").append('<div class="col-sm-3 col-md-2"><div class="thumbnail"><img class="good_img" src="${path}/resources/img/good/'+data.list[i].good_img+'"  alt="'+data.list[i].good_name+'" ><div class="caption"><h4 style=" overflow: hidden;text-overflow: ellipsis;white-space: nowrap; width: 200px;height: 40px;">'+data.list[i].good_name+'</h4><p>'+data.list[i].good_price +' 원</p><p><a href="adminGoodModifyForm.giv?good_no='+data.list[i].good_no+'" class="btn btn-primary" role="button">수정하기</a></p></div></div></div>')
								}
								
							}
						});
						
					}
				})
				
				$(document).on("click","#left",function(){
					if(header<=1){
					
					}
					else{
						header = header-1;
						$(".page").css({
							"background": "none",
							"border-color": "none",
							"color": "#b2b2b2"
						});
						$(".page").eq(header-1).css({
							"background": "#7fad39",
							"border-color": "#7fad39",
							"color": "#ffffff"
						});
						
						var start = divider*(header)-divider;
						var end = divider*(header+1)-divider;
						$.ajax({
							url : "adminSelectGoods.giv",
							type : "post",
							success : function(data) {
								var list = data.list;
								
								$("#searchResult").empty();
								for(var i=start;i<end;i++){
									$("#searchResult").append('<div class="col-sm-3 col-md-2"><div class="thumbnail"><img class="good_img" src="${path}/resources/img/good/'+data.list[i].good_img+'"  alt="'+data.list[i].good_name+'" ><div class="caption"><h4 style=" overflow: hidden;text-overflow: ellipsis;white-space: nowrap; width: 200px;height: 40px;">'+data.list[i].good_name+'</h4><p>'+data.list[i].good_price +' 원</p><p><a href="adminGoodModifyForm.giv?good_no='+data.list[i].good_no+'" class="btn btn-primary" role="button">수정하기</a></p></div></div></div>')
								}
								
							}
						});
						
					}
				})
				
				/* <div class="col-sm-3 col-md-2">
				<div class="thumbnail">
					<img src="${path}/resources/img/good/${goodVO.good_img}" alt="${goodVO.good_name}">
					<div class="caption">
						<h3>${goodVO.good_name}</h3>
						<p>${goodVO.good_price} 원</p>
						<p>
							<a href="adminGoodModifyForm.giv?good_no=${goodVO.good_no}" class="btn btn-primary" role="button">수정하기</a>
						</p>
					</div>
				</div>
			</div>
				 */
				$("#searchData").on("keyup",function(){
					var part = $("#part").val();
					var searchData = $("#searchData").val();
					$.ajax({
						url : "searchGood.giv",
						type : "post",
						data : {
							"part":part,
							"searchData":searchData
						},
						success : function(data) {
							var list = data.list;
							
							header=1;
							$("#searchResult").empty();
							for(var i=0;i<list.length;i++){
								$("#searchResult").append('<div class="col-sm-3 col-md-2"><div class="thumbnail"><img class="good_img" src="${path}/resources/img/good/'+data.list[i].good_img+'"  alt="'+data.list[i].good_name+'" ><div class="caption"><h4 style=" overflow: hidden;text-overflow: ellipsis;white-space: nowrap; width: 200px;height: 40px;">'+data.list[i].good_name+'</h4><p>'+data.list[i].good_price +' 원</p><p><a href="adminGoodModifyForm.giv?good_no='+data.list[i].good_no+'" class="btn btn-primary" role="button">수정하기</a></p></div></div></div>')								
							}
							
						}
					});
				})
			
		
				
			}
		</script>
	</c:if>
		<c:if test="${admin == null}">
		<script>
		 location. href="adminLogin.giv";
		</script>
		
		</c:if>
</body>
</html>
