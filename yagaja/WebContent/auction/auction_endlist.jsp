<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>
<%@ taglib prefix="fmt" 
	uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">

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
<%@include file="../include/datetimepicker.jsp"%>

<script type="text/javascript">
	function allCheckFunc(obj) {
		$("[name=checkDel]").prop("checked", $(obj).prop("checked"));
	}

	/* 체크박스 체크시 전체선택 체크 여부 */
	function oneCheckFunc(obj) {
		var allObj = $("[name=checkAll]");
		var objName = $(obj).attr("name");

		if ($(obj).prop("checked")) {
			checkBoxLength = $("[name=" + objName + "]").length;
			checkedLength = $("[name=" + objName + "]:checked").length;

			if (checkBoxLength == checkedLength) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		} else {
			allObj.prop("checked", false);
		}
	}

	$(function() {
		$("[name=checkAll]").click(function() {
			allCheckFunc(this);
		});
		$("[name=checkDel]").each(function() {
			$(this).click(function() {
				oneCheckFunc($(this));
			});
		});
	});

	//체크박스 회원 삭제 경고창
	$(function() {
		$("#delUser").click(function() {
			var selectedCheck = new Array();
			$('.inputchk:checked').each(function() {
				selectedCheck.push(this.value);
			});

			if (selectedCheck.length < 1) {
				alert("삭제할 회원을 선택해 주세요.");
				return false;
			}

			var chk = confirm("삭제하시겠습니까?");
			if (chk) {

				document.delfrm.action = "../Yagaja/AuctionDelete";
				document.delfrm.submit();
				alert("삭제 완료 되었습니다.");
			} else {
				alert("삭제 취소 되었습니다.");
				return false;
			}

		});
	});
</script>

<!-- 데이트피커 -->
<script>
$(function() {
	//날짜만
	$("#search_sday,#search_eday").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				minDate : 0,
				maxDate : 60,
				prevText : '이전 달',
				nextText : '다음 달',
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
						'7월', '8월', '9월', '10월', '11월', '12월' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
				yearRange : 'c-5:c+5',
			});

	//날짜 선택시 전날선택 안되게 막기   
	$('#search_sday').datepicker("option", "minDate",
			$("#search_eday").val());

	$('#search_sday').datepicker(
			"option",
			"onClose",
			function(selectedDate) {
				$("#search_eday").datepicker("option", "minDate",
						selectedDate);
			});

	//종료날짜만 선택시 이전 날짜 선택 가능하게
	$('#search_eday').datepicker("option", "minDate", null);

	//오늘날짜 등록되기
	$('search_date').datepicker({});
	var d = new Date();
	var month = d.getMonth() + 1;
	var prettyDate = d.getFullYear() + '-' + month + '-' + d.getDate();
	$('#search_date').val(prettyDate);
});
</script>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <%@include file="../include/adminTop.jsp" %>
            <!-- /.navbar-top-links -->

		<%@include file="../include/adminLeftMenu.jsp" %>
            <!-- /.navbar-static-side -->
    
		 <div id="page-wrapper">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header">마감된 경매목록</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">

	                        <div class="panel-body">
	                        	<!-- 검색 -->
							<div class="row text-left" style="margin-bottom: 5px; padding-left: 15px; padding-bottom:10px;">
								<form class="form-inline" name="searchFrm" method="post" action="" >
									<div class="form-group">
										<input type="text" style="text-align: center; width: 100px;"
											class="form-control" id="search_sday" name="search_sday"
											placeholder="시작일자" /> - <input type="text"
											style="text-align: center; width: 100px;"
											class="form-control" id="search_eday" name="search_eday"
											placeholder="종료일자" />
									</div>
									<div class="input-group" style="padding-left: 1px;">
										<select name="searchColumn" class="form-control">
											<option value="direct_input">검색조건</option>
											<option value="lodge_name">숙박업소명</option>
											<option value="lodge_type">숙박종류</option>
											<option value="room_type">객실종류</option>
										</select>
									</div>
									<div class="input-group" style="padding-left: 1px;">
										<input type="search" name="searchWord" class="form-control"
											placeholder="검색어를 입력하세요." autofocus />
										<div class="input-group-btn" style="padding-left: 2px;">
											<button type="submit" id="btn_search" class="btn btn-default">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
	                        	
	                        	<form action="../Yagaja/AuctionDelete" method="post" name="delfrm">
	                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
	                                <tbody>
	                                	<tr style="font-weight:bold">
	                                		<td style="width: 40px;">
	                                			<label>
	                                				<input type="checkbox" name="checkAll" />
	                                			</label>
	                                		</td>
	                                        <td>번호</td>
	                                        <td>숙박시설명</td>
	                                        <td>객실단가</td>
	                                        <td>시작가</td>
	                                        <td>입찰가</td>
	                                        <td>입찰수</td>
	                                        <td>최고입찰자</td>
	                                      	<td>남은시간</td>
	                                    </tr>
	                                   <c:choose>
	                                    	<c:when test="${empty lists }">
	                                    		<!-- 등록된 게시물이 없을때 -->
	                                    		<tr>
	                                    			<td colspan="9">
	                                    				<span style="text-align:center; font-weight:bold;">등록된 글이 없습니다.</span>
	                                    			</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<c:forEach items="${lists }" var="row" varStatus="loop">
	                                    			<tr>
	                                    				<td style="vertical-align:middle;"><label><input type="checkbox" class="inputchk" name="checkDel" value="${row.auction_no }" /></label></td>
	                                    				<td style="vertical-align:middle;">${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }</td>
	                                    				<input type="hidden" name="nowPage" value="${map.nowPage }" />
	                                    				<input type="hidden" name="mode" value="0" />
				                                    	<td style="vertical-align:middle;"><a href="../Yagaja/AuctionView?Auction_no=${row.auction_no }&nowPage=${map.nowPage}" style="color:black">${row.lodge_name }</a></td>
				                                    	<td style="vertical-align:middle;"><fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true"/>원</td>
				                                    	<td style="vertical-align:middle;"><fmt:formatNumber value="${row.start_price }" groupingUsed="true"/>마일리지</td>
				                                    	<td class="center" style="vertical-align:middle;"><fmt:formatNumber value="${row.end_price }" groupingUsed="true"/>마일리지</td>
				                                    	<td class="center" style="vertical-align:middle;">${row.tender_count }건</td>
				                                    	<td class="center" style="vertical-align:middle;">${row.final_bidder }</td>
				                                    	<input type="hidden" id="remain_time_sec_${row.auction_no }" value="${row.remain_time_sec }" />
				                                    	<td style="vertical-align:middle;">
				                                    		<span id="diffTime_${row.auction_no }">
				                                    			<b style="color:red;">경매 종료</b><br />
				                                    		</span>
				                                    	</td>
	                                    			</tr>
	                                    		</c:forEach>
	                                    	 </c:otherwise>
	                                    </c:choose> 
	                                </tbody>
	                            </table>
	                            </form>
	                            <!-- /.table-responsive -->
	                            <c:choose>
									<c:when test="${empty lists }">
									</c:when>
									<c:otherwise>
										<button type="button" id="delUser" class="btn btn-danger">
											<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
										</button>
									</c:otherwise>
								</c:choose>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->

	                        <div class="row text-center">
								<ul class="pagination">
									${pagingImg }
								</ul>
							</div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-6 -->
	            </div>
	            <!-- /.row -->
	        </div>
	        <!-- /#page-wrapper -->
	
	    </div>
	    <!-- /#wrapper -->
	
       

    <!-- jQuery -->
    <script src="../vendor/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
</html>