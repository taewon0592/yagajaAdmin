<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마감된 핫딜목록</title>
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

<!-- 전체선택체크되면 체크박스 모두 체크되기 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#checkall').click(function() {
			if ($('#checkall').is(':checked')) {
				//전체체크
				console.log('1');
				$('input:checkbox[name=all]').prop('checked', true);
			} else {
				//전체체크해제
				console.log('2');
				$('input:checkbox[name=all]').prop('checked', false);
			}
		});
	});
</script>
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
					<h1 class="page-header">마감된 핫딜 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">

								<table width="100%"
									class="table table-striped table-bordered table-hover center"
									style="text-align: center;">
									<thead>
										<!-- 굵기넣기 -->
										<tr style="font-weight: bold">
											<td colspan="2">
												<button type="button" class="btn btn-info" >핫딜 삭제</button>
												
												
											</td>
											<td>핫딜검색내용</td>
											<td colspan="2">
												<div class="input-group custom-search-form">
													<!-- 서치폼안에 어떤걸 검색할건지 셀렉트로 분류넣어줘야함 -->
													<input type="text" class="form-control" placeholder="Search..."> 
														<span class="input-group-btn">
														<button class="btn btn-default" type="button">
															<i class="fa fa-search"></i>
														</button>
													</span>
												</div>
											</td>
											<td>진행중인 핫딜</td>
											<td>
												<button type="submit" class="btn btn-waring">전체선택</button>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr style="font-weight: bold">
											<td>번호</td>
											<td>숙소명</td>
											<td>핫딜 남은 시간</td>
											<td>핫딜 금액</td>
											<td>판매수량</td>
											<td>구매가능 수량</td>
											<td>선택</td>
										</tr>
										
										<c:choose>
											<c:when test="${empty lists }">
												<!-- 등록된 게시물이 없을경우 -->
												<tr>
													<td colspan="8">등록된 글이 없습니다.</td>
												</tr>
											</c:when>	
											<c:otherwise>
												<c:forEach items="${lists }" var="row" varStatus="loop">
												<tr class="odd gradeX">
													<td style="vertical-align:middle;">${map.totalCount - (((map.nowPage -1) * map.pageSize) + loop.index) }</td>
													<td style="vertical-align:middle;">
														<!-- inner join으로 숙소이름나옴 -->
														<input type="hidden" name="lodge_no" value="${row.lodge_no}"/>
														<a href="../HotDeal/HotdealView?hotdeal_no=${row.hotdeal_no }&nowPage=${map.nowPage}">${row.lodge_name}</a> 
													</td >
													<td style="vertical-align:middle;">
														<!-- 핫딜남은시간 -->
														<input type="hidden" id="remain_time_sec_${row.hotdeal_no }" value="${row.remain_time_sec }"/>
														<span id="diffTime_${row.hotdeal_no }">
				                                    		<b style="color:red; font-weight:bold;">핫딜 종료</b><br />
				                                    	</span> 
													</td>
													<td style="vertical-align:middle;">${row.hotdeal_price}</td>
													<td style="vertical-align:middle;">${row.hotdeal_sell}</td>
													<td style="vertical-align:middle;">${row.hotdeal_buy}
													<td style="vertical-align:middle;"><input type="checkbox" name="check" /></td>
												</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	<!-- /#wrapper -->
	<!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

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