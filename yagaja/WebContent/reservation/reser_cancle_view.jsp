<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 취소 내역 상세보기</title>
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
					<h1 class="page-header">예약 취소 내역 상세보기</h1>
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
										<tr>
											<td style="font-weight: bold">예약번호</td>
											<td colspan="3">
												${dto.reser_no }
											</td>
										</tr>										
										<tr>
											<td style="font-weight: bold">결제금액</td>
											<td colspan="3"> ${dto.payment_price }</td>											
										</tr>
										<tr>
											<td style="font-weight: bold">취소일자</td>
											<td colspan="3"> ${dto.cancle_date }</td>											
										</tr>										
										<tr>
											<td style="font-weight: bold">취소수수료</td>
											<td colspan="3">
												<fmt:formatNumber value="${dto.cancle_fee }" groupingUsed="true"/>											
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">취소금액</td>
											<td colspan="3">
												<fmt:formatNumber value="${(dto.payment_price - dto.cancle_fee)}" groupingUsed="true"/>											
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">결제수단</td>
											<td colspan="3">
												${dto.payment_type }
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">숙소명</td>
											<td colspan="3">${dto.lodge_name }</td>
										</tr>
										<tr>
											<td style="font-weight: bold">숙소타입</td>
											<td colspan="3">
												${dto.lodge_type }
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">예약자명</td>
											<td colspan="3">${dto.reser_name }</td>
										</tr>
										<tr>
											<td style="font-weight: bold">연락처</td>
											<td colspan="3">
												${dto.reser_phone }
											</td>
										</tr>										
									</tbody>
									
									<!-- 페이징처리넣어줘야함  -->
								</table>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
							<button type="button" class="btn btn-danger" onclick="location.href='../Reservation/ReservationDelete?reser_no=${dto.reser_no}&nowPage=${param.nowPage }';">
								<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
							</button>							
							<button type="button" class="btn btn-warning" onclick="location.href='../Reservation/ReservationCancleList?nowPage=${param.nowPage}';">
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