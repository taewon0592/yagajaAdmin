<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.YagajaMemberDTO"%>
<%@page import="model.YagajaMemberDAO"%>
<%@page import="model.LodgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%
request.setCharacterEncoding("UTF-8");

YagajaMemberDAO dao = new YagajaMemberDAO();
LodgeDAO ldao = new LodgeDAO();

Map param = new HashMap();

String mc = "모텔";
String hc = "호텔";
String pc = "펜션";
String gc = "게스트하우스";

int memberCount = dao.getTotalRecordCount(param);
int lodgeCount = ldao.getTotalRecordCount(param);
int motelCount = ldao.getTotalRecordCount(mc);
int hotelCount = ldao.getTotalRecordCount(hc);
int pensionCount = ldao.getTotalRecordCount(pc);
int guesthouseCount = ldao.getTotalRecordCount(gc);
%> 


<script type="text/javascript">
$(function() {
	Morris.Donut({
	    element: 'morris-donut-chart',
	    data: [{
	        label: "Motel",
	        value: <%=motelCount %>
	    }, {
	        label: "Hotel",
	        value: <%=hotelCount %>
	    }, {
	        label: "Pension",
	        value: <%=pensionCount %>
	    }, {
	        label: "GuestHouse",
	        value: <%=guesthouseCount %>
	    }],
	    resize: true
	});
});

$(function(){
	Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: 'Motel',
            a: 100,
            b: 90
        }, {
            y: 'Hotel',
            a: 75,
            b: 65
        }, {
            y: 'Pension',
            a: 50,
            b: 40
        }, {
            y: 'GuestHouse',
            a: 75,
            b: 65
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['예약현황', '남은예약'],
        hideHover: 'auto',
        resize: true
    });
});

</script>
<!-- 
방 개수로 구분하자.
예약현황  +  빈방
-->

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
                                    <i class="fa fa-krw fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div> reserve<br /> <big>90</big></div>
                                </div>
                            </div>
                        </div>
                        <a href="./reser_list.jsp">
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
                                    <i class="fa fa-calendar fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                	<div> sales<br /> <i class="fa fa-krw"> </i><big> 3,190,000</big></div>
                                </div>
                            </div>
                        </div>
                        <a href="./reser_list.jsp">
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
                                	<div>member<br /> <big><%=memberCount %></big></div>
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
                                	<div>client<br /> <big><%=lodgeCount %></big></div>
                                </div>
                            </div>
                        </div>
                        <a href="./lodge_list.jsp">
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
                             <a href="./acution_list.jsp"> 
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
                           		<tr>                           			
                           			<td>코스모모텔</td>
                           			<td>07:17:27</td>
                           			<td>4</td>
                           		</tr>
                           		<tr>
                           			<td>강남좋은호텔</td>
                           			<td>12:18:24</td>
                           			<td>5</td>
                           		</tr>
                           		<tr>
                           			<td>부산풀빌라</td>
                           			<td>02:11:56</td>
                           			<td>7</td>
                           		</tr>
                           		<tr>
                           			<td>신촌호텔</td>
                           			<td>06:11:56</td>
                           			<td>2</td>
                           		</tr>
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
                             <a href="./hotdeal_list.jsp"> 
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
                           			<td>구매가능수</td>
                           		</tr>
                           		<tr>
                           			<td>가놀자</td>
                           			<td>07:05:05</td>
                           			<td style="color:red; font-weight:bold;">1</td>
                           		</tr>
                           		<tr>
                           			<td>나놀자</td>
                           			<td>08:05:05</td>
                           			<td>25</td>
                           		</tr>
                           		<tr>
                           			<td>다놀자</td>
                           			<td>12:05:05</td>
                           			<td>36</td>
                           		</tr>
                           		<tr>
                           			<td>라놀자</td>
                           			<td>12:05:05</td>
                           			<td>36</td>
                           		</tr>                           		
                           </table>                        
                            <!-- <div id="morris-bar-chart"></div> -->
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