<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.YagajaMemberDTO"%>
<%@page import="model.YagajaMemberDAO"%>
<%@page import="model.LodgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자메인페이지(main.jsp)</title>
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
$(function() {
	Morris.Donut({
	    element: 'morris-donut-chart',
	    data: [{
	        label: "Motel",
	        value: ${main.motelCount}
	    }, {
	        label: "Hotel",
	        value: ${main.hotelCount}
	    }, {
	        label: "Pension",
	        value: ${main.pensionCount}
	    }, {
	        label: "GuestHouse",
	        value: ${main.guesthouseCount}
	    }],
	    resize: true
	});
});

$(function(){
	Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: 'Motel',
            a: ${main.reservationMotelCount},
            b: ${main.motelCount - main.reservationMotelCount}
        }, {
            y: 'Hotel',
            a: ${main.reservationHotelCount},
            b: ${main.hotelCount - main.reservationHotelCount}
        }, {
            y: 'Pension',
            a: ${main.reservationPensionCount},
            b: ${main.pensionCount - main.reservationPensionCount}
        }, {
            y: 'GuestHouse',
            a: ${main.reservationGuestHouseCount},
            b: ${main.guesthouseCount - main.reservationGuestHouseCount}
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['예약현황', '남은예약'],
        hideHover: 'auto',
        resize: true
    });
});

</script>

<script type="text/javascript">
<c:forEach items="${aList }" begin="1" end="4" var="row" varStatus="loop">
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
	<c:forEach items="${aList }" begin="1" end="4" var="row" varStatus="loop">
	
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

</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <%@include file="../include/adminTop.jsp" %> 
            <!-- /.navbar-top-links -->

		<%@include file="../include/adminLeftMenu.jsp" %>
            <!-- /.navbar-static-side -->

            <!-- 콘텐츠 영역 -->     
            

        <div id="page-wrapper">
            <div class="row">

				<!-- Main 상단 주석 처리 -->
                <!-- <div class="col-lg-12" style="color:graytext; ; ;">
                
                    <h1 class="page-header"> <i class="fa fa-home"></i> Main</h1>
                </div> -->
                <!-- 콘텐츠 상단 start-->
                <br />
                <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-calendar fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div> reserve<br /> <big>${main.reservationCount }</big></div>
                                </div>
                            </div>
                        </div>
                        <a href="../Reservation/ReservationList">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-krw fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div> sales<br /> <big><fmt:formatNumber value="${main.reservationSum }" groupingUsed="true"/> </big></div>
                                </div>
                            </div>
                        </div>
                        <a href="../Reservation/ReservationList">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div>member<br /> <big>${main.memberCount }</big></div>
                                </div>
                            </div>
                        </div>
                        <a href="../Member/MemberList">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-building-o fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div>client<br /> <big>${main.lodgeCount }</big></div>
                                </div>
                            </div>
                        </div>
                        <a href="../lodge/lodge_list">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- 콘텐츠 상단 end -->


            <!-- 차트 start -->
            <div class="row">
            	 <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            숙박시설
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 --> 
            	<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            예약현황
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 --> 
            </div>
            <!-- /.row -->   
            <!-- 차트 end -->      

            <div class="row">
            <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            경매관리
                             <a href="../Yagaja/AuctionList?mode=1"> 
                            	 <span class="pull-right"> <i class="fa fa-arrow-circle-right"> </i></span>    
                                 <span class="pull-right" > View Details </span>                                                            
                   		    </a>  
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<table class="table table-bordered table-hover" style="text-align:center;" >
                           <colgroup>
                           <col width="20%;">
                           <col width="40%;">
                           <col width="40%;">                           
                           </colgroup>
                          		<tr>
                           			<td rowspan="2"><br />숙소명</td>
                           			<td colspan="2">실시간현황</td>
                           		</tr>
                           		<tr>
                           			<td>남은시간</td>
                           			<td>입찰수</td>
                           		</tr>
                           		<c:forEach items="${aList }" begin="1" end="4" var="row" varStatus="loop">
                           		<tr>                           			                             			
	                                	<td style="vertical-align:middle;"><a href="../Yagaja/AuctionView?auction_no=${row.auction_no }&nowPage=${map.nowPage}" style="color:black">${row.lodge_name }</a></td>
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
                                	<td class="center" style="vertical-align:middle;">${row.auction_hits }</td>                             		
                           		</tr>  
                           		</c:forEach>                         		
                           </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            핫딜관리
                             <a href="../Yagaja/AuctionList?mode=1"> 
                            	 <span class="pull-right"> <i class="fa fa-arrow-circle-right"> </i></span>    
                                 <span class="pull-right" > View Details </span>                                                            
                   		    </a>  
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<table class="table table-bordered table-hover" style="text-align:center;" >
                           <colgroup>
                           <col width="20%;">
                           <col width="40%;">
                           <col width="40%;">                           
                           </colgroup>
                          		<tr>
                           			<td rowspan="2"><br />숙소명</td>
                           			<td colspan="2">실시간현황</td>
                           		</tr>
                           		<tr>
                           			<td>핫딜판매수</td>
                           			<td>구매가능수</td>
                           		</tr>
                           		<c:forEach items="${hList }" begin="1" end="4" var="how" varStatus="loop">
                           		<tr>     
                           			<td class="center" style="vertical-align:middle;"><a href="../HotDeal/HotdealView?hotdeal_no=${how.hotdeal_no }" style="color:black">${how.lodge_name}</a></td>
										<input type="hidden" name="lodge_no" value="${how.lodge_no}"/>
	                                <td class="center" style="vertical-align:middle;">${how.hotdeal_sell }</td>
                                	<td class="center" style="vertical-align:middle;">${how.hotdeal_buy }</td>                             		
                           		</tr>  
                           		</c:forEach>                         		
                           </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 --> 
               
            </div>
            <!-- /.row -->  
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

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
    
    <!-- Flot Charts JavaScript -->
    <script src="../vendor/flot/excanvas.min.js"></script>
    <script src="../vendor/flot/jquery.flot.js"></script>
    <script src="../vendor/flot/jquery.flot.pie.js"></script>
    <script src="../vendor/flot/jquery.flot.resize.js"></script>
    <script src="../vendor/flot/jquery.flot.time.js"></script>
    <script src="../vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <script src="../data/flot-data.js"></script>

</body>
</html>



for(int i=)
