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


<script type="text/javascript">
<c:forEach items="${lists }" var="row" varStatus="loop">
//남은시간(초) - DB에서 가져옴
var remain_time_sec_${row.auction_no} = ${row.remain_time_sec }
var srts_${row.auction_no} = ${row.start_remain_time_sec}

function auction_reverse_time_${row.auction_no}()
{
	
	dateVal	=	parseInt(remain_time_sec_${row.auction_no}/(24*60*60));	//경매시작까지 남은 총 초에서 날짜 뽑기
	temp_val = remain_time_sec_${row.auction_no}%(24*60*60);				//경매시작까지 남은 초 담기
	hourVal	= parseInt(temp_val/(60*60));				//경매시작까지 남은 총 초에서 시간 뽑기
	temp_val = temp_val%(60*60);						//경매시작까지 남은 초 담기
	minVal = parseInt(temp_val/(60));					//경매시작까지 남은 총 초에서 분 뽑기
	secVal = temp_val%(60);								//경매시작까지 남은 초 담기
	
	srts_dateVal = parseInt(srts_${row.auction_no}/(24*60*60));	//경매시간 남은 총 초에서 날짜 뽑기
	srts_temp_val = srts_${row.auction_no}%(24*60*60);			//경매시간 남은 초 담기
	srts_hourVal = parseInt(srts_temp_val/(60*60));				//경매시간 남은 총 초에서 시간 뽑기
	srts_temp_val = srts_temp_val%(60*60);						//경매시간 남은 초 담기
	srts_minVal = parseInt(srts_temp_val/(60));					//경매시간 남은 총 초에서 분 뽑기
	srts_secVal = srts_temp_val%(60);							//경매시간 남은 초 담기
	
	document.getElementById("diffTime_${row.auction_no}").innerHTML = "<span style='color:blue; font-weight:bold;'>경매까지 남은시간</span><br/>"+dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초";

	//남은 시간이 0이 되어 경매종료시
	if(remain_time_sec_${row.auction_no}<=0)
	{
		document.getElementById("diffTime_${row.auction_no}").innerHTML = "<span style='color:red; font-weight:bold;'>경매 진행중</span><br/>"+srts_dateVal+"일 "+srts_hourVal+"시간 "+srts_minVal+"분 "+srts_secVal+"초";
		//호출중지
		//화면리플레쉬

		if(srts_${row.auction_no}<=0)
		{
			document.getElementById("diffTime_${row.auction_no }").innerHTML = "<span style='color:red; font-weight:bold;'>입찰이 종료되었습니다</span>";
		}
		else
		{
			srts_${row.auction_no}--;
		}
	}
	else
	{	//잔여시간이 있다면 1초씩 차감
		remain_time_sec_${row.auction_no}--;
	}
	
}
</c:forEach> 

window.onload = function()
{	
	<c:forEach items="${lists }" var="row" varStatus="loop">
	
	//경매시작까지 남은시간 가져오기
	remain_time_sec_${row.auction_no} = document.getElementById("remain_time_sec_${row.auction_no}").value;
	srts_${row.auction_no} = document.getElementById("srts_${row.auction_no}").value;
	
	
	if(remain_time_sec_${row.auction_no} > 0)
	{
		//1초에 한번씩 함수 호출
		setInterval("auction_reverse_time_${row.auction_no}()" ,1000);
		//auction_reverse_time_${row.auction_no}(call_ref_auction);
	}
	else
	{
		
		if(srts_${row.auction_no} > 0)
		{
			setInterval("auction_reverse_time_${row.auction_no}()" ,1000);	
		}
		else
		{
			document.getElementById("diffTime_${row.auction_no }").innerHTML = "<span style='color:red; font-weight:bold;'>입찰이 종료되었습니다</span>";
		}
		
	}
	</c:forEach>
}

</script>

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
				alert("삭제할 핫딜 목록을 선택해 주세요.");
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
	                    <h1 class="page-header">등록된 경매목록</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">

                        <!-- /.panel-heading -->

	                        <div class="panel-body">
	                        
	                        	<form class="form-inline" name="searchFrm" method="post" action="" style="padding-bottom:15px;">
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
	                        	
	                        	<form action="../Yagaja/AuctionDelete" method="post" name="delfrm">
	                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
	                                <thead>
	                                <!-- 굵기넣기 -->
	                                    <tr style="font-weight:bold" >
	                                    	<td colspan="9" style="text-align:right; font-size:0.9em;" >
	                                    		<span><a href="../Yagaja/AuctionList?mode=2" style="color:black">인기경매순</a></span>
	                                    		<span>｜</span>
	                                    		<span><a href="../Yagaja/AuctionList?mode=3" style="color:black">마감임박순</a></span>
	                                    		<span>｜</span>
	                                    		<span><a href="../Yagaja/AuctionList?mode=1" style="color:black">신규경매순</a></span>
	  										</td>
	                                  	  </tr>
	                                </thead>
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
				                                    	<td style="vertical-align:middle;"><a href="../Yagaja/AuctionView?auction_no=${row.auction_no }&nowPage=${map.nowPage}" style="color:black">${row.lodge_name }</a></td>
				                                    	<input type="hidden" name="nowPage" value="${map.nowPage }" />
				                                    	<td style="vertical-align:middle;"><fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true"/>원</td>
				                                    	<td style="vertical-align:middle;"><fmt:formatNumber value="${row.start_price }" groupingUsed="true"/>마일리지</td>
				                                    	<td class="center" style="vertical-align:middle;"><fmt:formatNumber value="${row.end_price }" groupingUsed="true"/>마일리지</td>
				                                    	<td class="center" style="vertical-align:middle;">${row.tender_count }건</td>
				                                    	<td class="center" style="vertical-align:middle;">${row.final_bidder }</td>
				                                    	<!-- 경매시작 까지 남은시간 저장한 폼 -->
				                                    	<input type="hidden" id="remain_time_sec_${row.auction_no }" value="${row.remain_time_sec }" />
				                                    	<input type="hidden" id="srts_${row.auction_no }" value="${row.start_remain_time_sec }" />
				                                    	<c:choose>
					                                    	<c:when test="${row.remain_time_sec >= 0 }">
						                                    	<td style="vertical-align:middle;">
						                                    		<span id="diffTime_${row.auction_no }">
						                                    			<b style="color:blue;">경매까지 남은시간</b><br />
						                                    			${row.timeView }
						                                    		</span>
						                                    	</td>
					                                    	</c:when>
					                                    	<c:otherwise>
					                                    		<td style="vertical-align:middle;">
						                                    		<span id="diffTime_${row.auction_no }">
						                                    			<b style="color:red;">경매 진행중</b><br />
						                                    			${row.start_timeView }
						                                    		</span>
						                                    	</td>
					                                    	</c:otherwise>
				                                    	</c:choose>
	                                    			</tr>
	                                    		</c:forEach>
	                                    	 </c:otherwise>
	                                    </c:choose>   
	                                </tbody>
	                            </table>
	                            </form>
	                            <!-- /.table-responsive -->
	                            <button type="button" class="btn btn-info" onclick="location.href='../Yagaja/AuctionWrite';">
									<i class="glyphicon glyphicon-pencil"></i>&nbsp;등록하기
								</button>
								
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
	                <!-- 페이지번호 -->
					     
	            </div>
	            <!-- /.row -->
	                        <!-- /.panel-body -->
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