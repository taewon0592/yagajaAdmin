<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                    <h1 class="page-header">상세보기</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12" style="text-align:center;">
	                    

	                        <table class="table table-striped table-bordered table-hover center" style="text-align:center; width:100%; vertical-align:middle;">
	                        
                                    <tr class="odd gradeX">
										<td colspan="2" rowspan="8"><img src="../images/motel.jpg" alt="강남모텔" style="width:100%; height:100%;"/></td>
										<td style="font-weight:bold; font-size:1.5em;">물품번호</td>
										<td style="vertical-align:middle; font-size:1.2em;">2</td>
                                    </tr>
                                    <tr class="even gradeC">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">남은시간</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">15:12:16</td>
                                    </tr>
                                    <tr class="even gradeX">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">시작가</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">5,000마일리지</td>
                                    </tr>	  
                                    <tr class="odd gradeC">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">현재가</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">24,500마일리지</td>
                                    </tr>
                                    <tr class="even gradeX">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">경매기간</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">2018년11월24일 ~ 25일(24H)</td>
                                    </tr>
                                    <tr class="odd gradeC">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">등록일자</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">2018년8월10일</td>
                                    </tr>		          
                                    <tr class="even gradeX">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">입찰단위</td> 
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">500마일리지</td>
                                    </tr>	                                    
                                    <tr class="odd gradeC">
										<td style="font-weight:bold; font-size:1.5em; width:22%;">최고입찰자</td>
										<td style="vertical-align:middle; width:25%; font-size:1.2em;">LTW</td>
                                    </tr>
                                    <tr>
                                    <td colspan="4" style="font-size:1.5em; font-weight:bold;">숙소기본정보</td>
                                    </tr> 
                                    
                                    <tr>
                                       	<td style="font-weight:bold; font-size:1.5em;">업체명</td>
                                       	<td colspan="3" style="font-size:1.2em;">은서니는팎시</td>
                                  		</tr>
                                   	<tr class="odd gradeX">
                                       	<td style="font-weight:bold; font-size:1.5em;">객실 타입</td>
                                       	<td colspan="3" style="font-size:1.2em;">스위트룸</td>
                                  	 	</tr>
                                   	<tr class="even gradeC">
                                      		<td style="font-weight:bold; font-size:1.5em;">객실인원</td>
                                       	<td colspan="3" style="font-size:1.2em;">3명</td>
                                   	</tr>
                                  		<tr class="even gradeC">
                                      		<td style="font-weight:bold; font-size:1.5em;">숙소정보</td>
                                       	<td colspan="3" style="font-size:1.2em;">
                                        	2018년 3월 리모델링일부 객실 예약 시 광명동굴 입장 티켓 제공! (~12/31 체크인 기준)
                                       	</td>
                                  		</tr> 
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">주중 숙박가격</td>
                                       	<td style="font-size:1.2em;">50000원</td>
                                       	<td style="font-weight:bold; font-size:1.5em;">주중 대실가격</td>
                                       	<td style="font-size:1.2em;">30000원</td>
                                   	</tr>
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">주말 숙박가격</td>
                                       	<td style="font-size:1.2em;">60000원</td>
                                       	<td style="font-weight:bold; font-size:1.5em;">주말 대실가격</td>
                                       	<td style="font-size:1.2em;">40000원</td>
                                   	</tr>
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">숙소 대표 사진</td>
                                       	<td></td>
                                       	<td style="font-weight:bold; font-size:1.5em;">객실 사진</td>
                                       	<td></td>
                                   	</tr>
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">태그(#)</td>
                                       	<td colspan="4" style="font-size:1.2em;">#초특가호텔 #파티룸 #무료영화 </td>
                                   	</tr>
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">숙소 테마</td>
                                       	<td colspan="4" style="font-size:1.2em;">선택된 숙소테마가 나올 수 있게 하기</td>
                                   	</tr>
                                   	<tr class="even gradeC">
                                       	<td style="font-weight:bold; font-size:1.5em;">숙소 특징</td>
                                       	<td></td>
                                       	<td style="font-weight:bold; font-size:1.5em;">객실 사진</td>
                                       	<td></td>
                                   	</tr>                          
	                            </table>
	                            <br /><br /><br /><br /><br />
	                            
	                            
	                        </div>
	                        <!-- /.panel-body -->
	                
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-6">
	                    <div class="panel panel-default">
	                      
	                          
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
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