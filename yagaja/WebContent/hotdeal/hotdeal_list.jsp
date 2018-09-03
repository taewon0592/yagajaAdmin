<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록된 핫딜목록</title>
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

<script type="text/javascript">
<c:forEach items="${lists }" var="row" varStatus="loop">
//남은시간(초) - DB에서 가져옴
var remain_time_sec_${row.hotdeal_no} = ${row.remain_time_sec }

function auction_reverse_time_${row.hotdeal_no}()
{
	
	dateVal	=	parseInt(remain_time_sec_${row.hotdeal_no}/(24*60*60));	//총 초에서 날짜 뽑기
	temp_val = remain_time_sec_${row.hotdeal_no}%(24*60*60);				//남은 초 담기
	hourVal	= parseInt(temp_val/(60*60));				//남은 총 초에서 시간 뽑기
	temp_val = temp_val%(60*60);						//남은 초 담기
	minVal = parseInt(temp_val/(60));					//남은 총 초에서 분 뽑기
	secVal = temp_val%(60);								//남은 초 담기

	document.getElementById("diffTime_${row.hotdeal_no}").innerHTML = "<span style='color:blue; font-weight:bold;'>핫딜까지 남은시간</span><br/>"+dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초";

	//남은 시간이 0이 되어 경매종료시
	if(remain_time_sec_${row.hotdeal_no}<=0)
	{
		document.getElementById("diffTime_${row.hotdeal_no}").innerHTML = "<span style='color:red; fonr-weight:bold;'>핫딜이 종료되었습니다</span>";
		//호출중지
		//화면리플레쉬
		//location.reload();
	}
	else
	{	//잔여시간이 있다면 1초씩 차감
		remain_time_sec_${row.hotdeal_no}--;
	}
	
}
</c:forEach> 

window.onload = function()
{	
	<c:forEach items="${lists }" var="row" varStatus="loop">
	
	//남은시간 가져오기
	remain_time_sec_${row.hotdeal_no} = document.getElementById("remain_time_sec_${row.hotdeal_no}").value;
	
	if(remain_time_sec_${row.hotdeal_no} > 0)
	{
		//1초에 한번씩 함수 호출
		setInterval("auction_reverse_time_${row.hotdeal_no}()" ,1000);
	}
	else
	{
		document.getElementById("diffTime_${row.hotdeal_no }").innerHTML = "<span style='color:red; font-weight:bold;'>핫딜이 종료되었습니다</span>";
	}
	</c:forEach>
}

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
					<h1 class="page-header">현재 핫딜 목록</h1>
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
												<button type="button" class="btn btn-info" onclick="location.href='../HotDeal/HotDealWrite';">
													핫딜등록
												</button>
											</td>
											<td>핫딜검색내용</td>
											<td colspan="4">
												<div class="input-group custom-search-form">
													<!-- 서치폼안에 어떤걸 검색할건지 셀렉트로 분류넣어줘야함 -->
													<input type="text" class="form-control" placeholder="Search..." style="width:500px"> 
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
											<td>숙박업소명</td>
											<td>숙박종류</td>
											<td>객실종류</td>
											<td>핫딜 남은 시간</td>
											<td>핫딜 금액</td>
											<td>판매수량</td>
											<td>구매가능 수량</td>
											<td>선택</td>
										</tr>
										<c:choose>
											<c:when test="${empty lists }">
												<!-- 등록된 게시물이 없는 경우 -->
											<tr>
												<td colspan="8">등록된 글이 없습니다.</td>
											</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${lists }" var="row" varStatus="loop">
												<!-- 리스트반복 -->
												<tr>
													<td style="vertical-align:middle;">${map.totalCount - (((map.nowPage -1) * map.pageSize) + loop.index) }</td>
													<td style="vertical-align:middle;">
														<!-- inner join으로 숙소이름나옴 -->
														<input type="hidden" name="lodge_no" value="${row.lodge_no}"/>
														<a href="../HotDeal/HotdealView?hotdeal_no=${row.hotdeal_no }&nowPage=${map.nowPage}">${row.lodge_name}</a> 
													</td >
													<td style="vertical-align:middle;">
														${row.lodge_type }
													</td>
													<td style="vertical-align:middle;">
														${row.room_type }
														<input type="hidden" name="room_no" value="${row.room_no }" />
													</td style="vertical-align:middle;">
													<td style="vertical-align:middle;">
														<!-- 핫딜남은시간 -->
														<input type="hidden" id="remain_time_sec_${row.hotdeal_no }" value="${row.remain_time_sec }"/>
														<span id="diffTime_${row.hotdeal_no }">
				                                    		<b style="color:blue;">핫딜까지 남은시간</b><br />
				                                    		${row.timeView }
				                                    	</span> 
													</td>
													<td style="vertical-align:middle;">${row.hotdeal_price}</td>
													<td style="vertical-align:middle;">${row.hotdeal_sell}</td>
													<td style="vertical-align:middle;">${row.hotdeal_buy}
													</td>
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
						<!-- 페이지번호 -->
						<div class="row text-center">
							<ul class="pagination">
								${pagingImg }
							</ul>
						</div>
						<!-- Contents영역 끝-->
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