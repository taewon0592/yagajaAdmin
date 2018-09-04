<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>핫딜 물품 상세보기</title>
<link href="../vendor/bootstrap3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS (세로드롭메뉴바)-->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<script src="../vendor/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<%@include file="../include/adminTop.jsp"%>
		<!-- /.navbar-top-links -->

		<%@include file="../include/adminLeftMenu.jsp"%>
		<!-- /.navbar-static-side -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">핫딜 물품 상세보기</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">
								<table width="100%"
									class="table table-striped table-bordered table-hover center"
									style="text-align: center;">
										<tr style="font-weight: bold">
											<td>숙박업소명</td>
											<td colspan="3">
												${dto.lodge_name }
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">숙소분류</td>
											<td colspan="3">
												${dto.lodge_type }											
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">객실타입</td>
											<td colspan="3">
											${dto.room_type }
											<!-- 숙소명과 숙소분류에 따른 객실타입이 자동으로 나올 수 있어야함 -->
												<!-- <select class="form-control">
	                                                <option value="">더블룸</option>
	                                                <option value="">싱글룸</option>
	                                                <option value="">패밀리룸</option>
	                                                <option value="">스위트룸</option>
                                            	</select> -->
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">등록일</td>
											<td colspan="3">${dto.hotdeal_date }</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 시작 시간</td>
											<td> ${dto.hotdeal_stime }</td>
											<td style="font-weight: bold">핫딜 마감 시작</td>
											<td> ${dto.hotdeal_etime }</td>
										</tr>
										<tr>
											<!-- 체크인이 가능한 날짜 -->
											<td style="font-weight:bold">핫딜 사용시작가능일</td>
											<td>
												${dto.hotdeal_sday }
											</td>
											<!--종료일까지 사용을 해야함 -->
											<td style="font-weight: bold">핫딜 사용 종료일</td>
											<td>
												${dto.hotdeal_eday }
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 적용금액</td>
											<td colspan="3">
												${dto.hotdeal_price }
											</td>
											
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 구매 가능 수량</td>
											<td>
												${dto.hotdeal_buy  }
												<!-- <select class="form-control">
	                                                <option value="">1</option>
	                                                <option value="">2</option>
	                                                <option value="">3</option>
	                                                <option value="">4</option>
	                                                <option value="">5</option>
	                                                <option value="">6</option>
	                                                <option value="">7</option>
	                                                <option value="">8</option>
	                                                <option value="">9</option>
	                                                <option value="">10</option>
                                            	</select> -->
											</td>
											<td style="font-weight: bold">핫딜 판매 수량</td>
											<td>
												${dto.hotdeal_sell  }
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 등록된 사진</td>
											<td colspan="3">
												<img src="../Upload/${dto.lodge_photo }"  />
											</td>
										</tr>
									</tbody>
									
									<!-- 페이징처리넣어줘야함  -->
								</table>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
							<button type="button" class="btn btn-success" onclick="location.href='../HotDeal/HotDealEdit?hotdeal_no=${dto.hotdeal_no}&nowPage=${param.nowPage }';">
								<i class="glyphicon glyphicon-edit"></i>&nbsp;수정하기
							</button>
							<button type="button" class="btn btn-danger" onclick="location.href='../HotDeal/HotDealDelete?hotdeal_no=${dto.hotdeal_no}&nowPage=${param.nowPage }';">
								<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
							</button>
							<button type="button" class="btn btn-warning" onclick="location.href='../HotDeal/HotDealList?nowPage=${param.nowPage}';">
								<i class="glyphicon glyphicon-list"></i>&nbsp;리스트보기
							</button>
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	
	<!-- jQuery -->

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    
	
</body>
</html>