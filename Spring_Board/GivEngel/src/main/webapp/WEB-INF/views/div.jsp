<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="row">
							<input type="hidden" value="'+ data.listIsOkay[i].flea_no +'" name="flea_no"
								id="flea_no">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="blog__item">
									<div class="blog__item__pic" style="border: 2px solid #f9f9f9">
												<a href="fleaView.giv?flea_no=$'+ data.listIsOkay[i].flea_no +'"><img
													src="${path}/resources/img/flea/soon.jpg" alt=""></a>
									</div>
									<div class="blog__item__text">
										<ul>
											<li><i class="fa fa-calendar-o"></i>'+ data.listIsOkay[i].flea_date +'</li>
											<li><i class="fa fa-comment-o"></i><span
												id="countSponCom2"></span></li>
										</ul>
										<h5>
											<a href="#">'+ data.listIsOkay[i].flea_title +'</a>
										</h5>
										<p>'+ data.listIsOkay[i].flea_price +'원</p>
										<a href="fleaView.giv?flea_no='+ data.listIsOkay[i].flea_no +'"
											class="blog__btn">자세히 보기 <span class="arrow_right"></span></a>
									</div>
								</div>
							</div>
						
						
													
						
						<div class="col-lg-12">
							<div class="product__pagination blog__pagination paination">

								<c:if test="${page.prev }">
									<a href="fleaBoard.giv?page=${page.startPage-1}"><i class="fa fa-long-arrow-left"></i></a>
								</c:if>
								<c:forEach begin="${page.startPage }" end="${page.endPage }" var="num" >
									<a href="fleaBoard.giv?page=${num}" id="num" >${num}</a>
								</c:forEach>

							<c:if test="${page.next && page.endPage > 0}">
									<a href="fleaBoard.giv?page=${page.endPage+1}"/><i class="fa fa-long-arrow-right"></i></a>
								</c:if>
								<c:if test="${sessionScope.user != null}">
									<a href="fleaWrite.giv" style="width:100px; text-decoration:none; float:right;"><button type="button" class="btn btn-success">
										신청하기</button></a>
								</c:if>

							</div>
						</div>

						
						
						
					</div> <!-- div id=row -->
					
					
				
					
					<div class="col-lg-12">
							<div class="product__pagination blog__pagination paination">

								<c:if test="'+data.page[i].prev+'">
									<a href="fleaBoard.giv?page='+data.page[i].startPage-1+'"><i class="fa fa-long-arrow-left"></i></a>
								</c:if>
								<c:forEach begin="'+data.page[i].startPage +'" end="'+data.page[i].endPage +'" var="num" >
									<a href="fleaBoard.giv?page='+${num}+'" id="num" >'+${num}+'</a>
								</c:forEach>

							<c:if test="'+data.page[i].next && data.page[i].endPage > 0+'">
									<a href="fleaBoard.giv?page='+data.page[i].endPage+1 +'"/><i class="fa fa-long-arrow-right"></i></a>
								</c:if>
								<c:if test="${sessionScope.user != null}">
									<button type="button" class="btn btn-success" style="float:right;"><span onClick="location.href='fleaWrite.giv'">
										신청하기</span></button>
								</c:if>

							</div>
						</div>







</body>
</html>