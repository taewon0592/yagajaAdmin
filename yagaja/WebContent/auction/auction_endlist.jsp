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
	                    <div class="panel-heading">
                        	<span style="font-weight:bold;">마감된 경매목록보기</span>
                        </div>

	                        <div class="panel-body">
	                        	<div class="table-responsive">
	                        	
	                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
	                                <thead>
	                                <!-- 굵기넣기 -->
	                                <div class="container">
	                                    <tr style="font-weight:bold" >
	                                    	<td colspan="8" style="text-align:right; font-size:0.9em;" >
	                                    		<input type="text" size="10" />
												<span class="glyphicon glyphicon-search"></span>
	  										</td>
	                                  	  </tr>
	                                 </div>
	                                </thead>
	                                <tbody>
	                                	<tr style="font-weight:bold">
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
	                                    			<td colspan="8">
	                                    				<span style="text-align:center; font-weight:bold;">등록된 글이 없습니다.</span>
	                                    			</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<c:forEach items="${lists }" var="row" varStatus="loop">
	                                    			<tr>
	                                    				<td style="vertical-align:middle;">${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }</td>
				                                    	<td style="vertical-align:middle;"><a href="../Yagaja/AuctionView?Auction_no=${row.auction_no }&nowPage=${param.nowPage}" style="color:black">${row.lodge_name }</a></td>
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
	                            <!-- /.table-responsive -->
	                            
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                      
	                          
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
	                        <div class="row text-center">
								<ul class="pagination">
									${pagingImg }
								</ul>
							</div>
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