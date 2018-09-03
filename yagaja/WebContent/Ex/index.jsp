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
                <div class="col-lg-12">
                    <h1 class="page-header">관리자메인페이지</h1>
                </div>
                <!-- 콘텐츠 상단 아이콘 start-->
                
                <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-krw fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>전일 결제 : 21건</div>
                                    <div>전일 매출 : 3,250,000원</div>
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
                                    <i class="fa fa-calendar fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                   <div></div>
                                   <div>이달 결제 : 1500건</div>
                                   <div>이달 매출 : 117,000,000원</div>
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
                                    <i class="fa fa-user fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                   <div>전일가입회원 : 12명</div>
                                   <div>전체가입회원 : 98652명</div>
                                </div>
                            </div>
                        </div>
                        <a href="./member_list.jsp">
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
                                    <i class="fa fa-building-o fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                   <div>전일업체등록 : 10건</div>
                                   <div>전체가입업체 : 3333</div>
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
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원관리
                            <a href="../Member/MemberList"> 
                                <span class="pull-right"> <i class="fa fa-arrow-circle-right"> </i></span>    
                                 <span class="pull-right" > View Details </span>                                                            
                             </a>
                            <!-- 상세보기버튼을 같은라인에 만들어서 바로페이지이동할수있게할 예정 -->
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <table class="table table-bordered table-hover" style="width:50%; text-align:center;" >
                           <colgroup>
                           <col width="50%;">
                           <col width="*;">
                           </colgroup>
                           		<tr>
                           			<td>회원현황 </td>
                           			<td>인원</td>
                           		</tr>
                           		<tr>
                           			<td>신규회원 </td>
                           			<td>12</td>
                           		</tr>
                           		<tr>
                           			<td>탈퇴회원 </td>
                           			<td>3</td>
                           		</tr>
                           		<tr>
                           			<td>가입회원 </td>
                           			<td>98652</td>
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
                            <a href="#"> 
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
                           			<td>숙소명</td>
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
                           </table>
                        
                            <!-- <div id="morris-bar-chart"></div> -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            시설관리
                            <a href="#"> 
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
                           			<td rowspan="2" ><br /> 숙소명</td>
                           			<td colspan="2">보유수</td>
                           		</tr>
                           		<tr>                           			
                           			<td>신규등록수</td>
                           			<td>가입숙박업소</td>
                           		</tr>
                           		<tr>
                           			<td>모텔</td>
                           			<td>5</td>
                           			<td>1800건</td>
                           		</tr>
                           		<tr>
                           			<td>호텔/리조트</td>
                           			<td>4</td>
                           			<td>900건</td>
                           		</tr>
                           		<tr>
                           			<td>펜션/풀빌라</td>
                           			<td>2</td>
                           			<td>400건</td>
                           		</tr>
                           		<tr>
                           			<td>게스트하우스</td>
                           			<td>1</td>
                           			<td>233건</td>
                           		</tr>
                           </table>
                        
                           <!--  <div id="morris-line-chart"></div> -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            경매관리
                            <a href="#"> 
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
                        
                            <!-- <div id="morris-donut-chart"></div> -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                      
                        <!-- /.panel-heading -->
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->  
                
                
                <!-- 콘텐츠 상단 아이콘 end -->
                
                
                
                
                
                
                
                
                
                
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

</body>
</html>