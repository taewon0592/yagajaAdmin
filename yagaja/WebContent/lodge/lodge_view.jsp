<%@page import="model.LodgeDTO"%>
<%@page import="model.LodgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숙박 업소 목록</title>
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
                    <h1 class="page-header">숙박 시설 상세보기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-10">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">                        	
                        	<div style="padding-bottom:15px;">
                        		<button type="button" class="btn btn-info" onclick="location.href='../lodge/room_write2?lodge_no=${lodge_no}&nowPage=${param.nowPage }';">
                        			<i class="glyphicon glyphicon-pencil"></i>&nbsp;방 등록하기
                        		</button>
                        		<button type="button" class="btn btn-success" onclick="location.href='../lodge/lodge_modify?lodge_no=${lodge_no}&nowPage=${param.nowPage }';">
                        			<i class="glyphicon glyphicon-edit"></i>&nbsp;수정하기
                        		</button>
                        		<button type="button" class="btn btn-danger" onclick="location.href='../lodge/lodge_delete?lodge_no=${lodge_no }';">
                            		<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
	                            </button>
	                            <button type="button" class="btn btn-warning" onclick="location.href='../lodge/lodge_list?mode=1&nowPage=${param.nowPage}';">
								<i class="glyphicon glyphicon-list"></i>&nbsp;리스트
							</button>
	                        </div>
                        	<form action=""  >
	                            <table width="100%" class="table table-bordered table-hover center" style="text-align:center;">

	                                <tbody>
	                                <input type="hidden" value="${lodge_no }" />
	                                <input type="hidden" value="${dto.lodge_name }" />
	                                <input type="hidden" value="${dto.lodge_thema }" />
	                                <input type="hidden" value="${param.nowPage }" />
	                                	<tr>
	                                        <td style="font-weight:bold; width:20%">숙소명</td>
	                                        <td colspan="3">${dto.lodge_name }</td>
	                                    </tr>
	                                    <tr class="odd gradeX">
	                                        <td style="font-weight:bold">숙박업소 종류</td>
	                                        <td colspan="3">${dto.lodge_type }</td>
	                                    </tr>
	                                    <tr class="even gradeC">
	                                       	<td style="font-weight:bold">숙소 주소</td>
	                                        <td colspan="3">${dto.addr_common }&nbsp;&nbsp;${dto.addr_detail } </td>
	                                    </tr>
	                                    <tr class="even gradeC">
	                                       	<td style="font-weight:bold; vertical-align:middle;">전화번호</td>
	                                        <td colspan="3" style="vertical-align:middle;">
                                        		${dto.lodge_tel }
	                                        </td>
	                                    </tr>
	                                    <tr class="even gradeC" >
	                                        <td style="font-weight:bold">방 개수</td>
	                                        <td colspan="3">${dto.lodge_roomcount }</td>
	                                        
	                                    </tr>
	                                    <tr class="even gradeC" >
	                                        <td style="font-weight:bold;" >태그</td>
	                                        <td colspan="3">${dto.lodge_tag }</td>
	                                        
	                                    </tr>
	                                    <tr class="even gradeC" >
	                                        <td style="font-weight:bold">룸 테마</td>
	                                        <td colspan="3">${dto.lodge_thema }</td>
	                                        
	                                    </tr>
	                                    <tr class="even gradeC">
	                                        <td style="font-weight:bold">숙소 특징</td>
	                                        <td colspan="3">${dto.lodge_feature }</td>
	                                    </tr>
	                                    <tr class="even gradeC">
	                                        <td style="font-weight:bold">숙소 정보</td>
	                                        <td colspan="3">${dto.lodge_note }</td>
	                                    </tr>
	                                    <tr class="even gradeC">
	                                    	<td style="font-weight:bold; vertical-align:middle;">숙소 대표사진</td>
	                                    	<td colspan="3"><img style="width:100%;"src="../Upload/${dto.lodge_photo }"  /></td>
	                                    </tr>
	                                  
	                                  
	                                </tbody>
	                            </table>
                            	<!-- /.table-responsive -->
                            </form>
                            
                            <form action="">
                        		<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">
	                       			<tr class="odd gradeX">
		                        		<td style="text-align:center;">No</td>
		                        		<td style="text-align:center;">객실타입</td>
		                        		<td>인원</td>
		                        		<td style="text-align:center;"><span style="color:black; font-weight:bold;">주중</span>&nbsp;&nbsp;&nbsp;대실가격</td>
		                        		<td style="text-align:center;"><span style="color:black; font-weight:bold;">주중</span>&nbsp;&nbsp;&nbsp;숙박가격</td>
		                        		<td style="text-align:center;"><span style="color:red; font-weight:bold;">주말</span>&nbsp;&nbsp;&nbsp;대실가격</td>
		                        		<td style="text-align:center;"><span style="color:red; font-weight:bold;">주말</span>&nbsp;&nbsp;&nbsp;숙박가격</td>
		                        		<td style="text-align:center;">객실사진</td>
		                        	</tr>
		                        	<tr class="even gradeC" >
		                        	<c:choose>
		                                	<c:when test="${empty lists }">
		                                		<tr>
		                                			<td colspan="8" style="text-align:center; font-weight:bold;">
		                                				등록된 글이 없습니다.
		                                			</td>
		                                		</tr>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:forEach items="${lists }" var="row" varStatus="loop">
			                                        <td style="text-align:center; vertical-align:middle; ">${row.rNum }</td>
			                                        <td style="text-align:center; vertical-align:middle;  font-weight:bold;"><a href="../lodge/room_view?room_no=${row.room_no }&lodge_no=${lodge_no}&nowPage=${param.nowPage}" style="color:black;">${row.room_type }</a></td>
			                                        <td style="text-align:center; vertical-align:middle;">${row.room_person}</td>
			                                       <%--  <td><fmt:formatNumber value="${row.d_rent_price }" groupingUsed="true"/></td>
			                                        <td><fmt:formatNumber value="${row.d_sleep_price }" groupingUsed="true"/></td>
			                                        <td><fmt:formatNumber value="${row.w_rent_price }" groupingUsed="true"/></td>
			                                        <td><fmt:formatNumber value="${row.w_sleep_price }" groupingUsed="true"/></td> --%>
			                                        <td style="text-align:center; vertical-align:middle;">${row.d_rent_price }원</td>
			                                        <td style="text-align:center; vertical-align:middle;">${row.d_sleep_price }원</td>
			                                        <td style="text-align:center; vertical-align:middle;">${row.w_rent_price }원</td>
			                                        <td style="text-align:center; vertical-align:middle;">${row.w_sleep_price }원</td>
			                                        <td style="text-align:center; vertical-align:middle;">${row.room_photo }</td>
			                                    </tr>
		                                		</c:forEach>
		                                	</c:otherwise>
		                               	</c:choose>
			                       <!--  <tr class="even gradeC" onclick="location.href='./room_view.jsp'">
	                        			<td style="text-align:center;">1</td>
		                        		<td style="text-align:center;">일반실</td>
		                        		<td style="text-align:center;">2명</td>
		                        		<td style="text-align:center;">4명</td>
		                        		<td style="text-align:center;">20,000원</td>
		                        		<td style="text-align:center;">50,000원</td>
		                        		<td style="text-align:center;">25,000원</td>
		                        		<td style="text-align:center;">70,000원</td>
		                        		<td style="text-align:center;">좋은모텔.jpg</td>
		                        	</tr> 
		                        	<tr class="odd gradeX">
	                        			<td style="text-align:center;">2</td>
		                        		<td style="text-align:center;">스위트룸</td>
		                        		<td style="text-align:center;">2명</td>
		                        		<td style="text-align:center;">4명</td>
		                        		<td style="text-align:center;">50,000원</td>
		                        		<td style="text-align:center;">100,000원</td>
		                        		<td style="text-align:center;">125,000원</td>
		                        		<td style="text-align:center;">170,000원</td>
		                        		<td style="text-align:center;">개좋은모텔.jpg</td>
		                        	</tr>-->
	                        	</table>
                        	</form>
                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                    <!-- /.panel -->
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>