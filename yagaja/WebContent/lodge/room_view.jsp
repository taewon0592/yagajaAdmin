<%@page import="model.LodgeDTO"%>
<%@page import="model.LodgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>객실 상세보기</title>
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
                    <h1 class="page-header">객실 상세보기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	
                            <table width="100%" class="table table-bordered table-hover center" style="text-align:center;">
                            	<colgroup>
                            		<col width="20%"/>
                            		<col width="30%"/>
                            		<col width="20%"/>
                            		<col width="30%"/>
                            	</colgroup>
                                <thead>
                                <!-- 굵기넣기 -->
                                <input type="hidden" name="lodge_no" value="${dto.lodge_no }"/>
                                <input type="hidden" value="${dto.room_no }" />   
                                <input type="hidden" value="${dto.lodge_no }" />   
                                
                                </thead>
                                <tbody>
                                	<tr>
                                        <td style="font-weight:bold">객실 타입</td>
                                        <td colspan="3">${dto.room_type }</td>
                                    </tr>
                                    <tr class="even gradeC">
                                       	<td style="font-weight:bold">객실 인원</td>
                                        <td colspan="3">${dto.room_person }</td>
                                    </tr>
                                    <tr class="even gradeC" >
                                        <td style="font-weight:bold">주중 숙박가격</td>
                                        <td><fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</td>
                                        <td style="font-weight:bold">주중 대실가격</td>
                                        <td><fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</td>
                                    </tr>
                                    <tr class="even gradeC" >
                                        <td style="font-weight:bold;" >주말 숙박가격</td>
                                        <td><fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</td>
                                        <td style="font-weight:bold ">주말 대실가격</td>
                                        <td><fmt:formatNumber value="${dto.w_sleep_price }" groupingUsed="true"/>원</td>
                                    </tr>
                                    <tr class="even gradeC" >
                                        <td style="font-weight:bold; vertical-align:middle;">객실 사진</td>
                                        <td colspan="3"><img style="width:100%;"src="../Upload/${dto.room_photo }" /></td>
                                    </tr>
                                </tbody>
                            </table>
	                            
		                           
                            <button  type="button" class="btn btn-success" onclick="location.href='../lodge/room_modify?lodge_no=${dto.lodge_no }&room_no=${dto.room_no }&nowPage=${nowPage }';">
                           		<i class="glyphicon glyphicon-edit"></i>&nbsp;수정하기
                           	</button>
                    		<button type="button" class="btn btn-danger"onclick="location.href='../lodge/room_delete?lodge_no=${param.lodge_no }&room_no=${dto.room_no }&nowPage=${nowPage }';">
                     			<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
                     		</button>
		                    <button type="button" class="btn btn-warning"onclick="location.href='../lodge/lodge_view?lodge_no=${dto.lodge_no }&room_no=${dto.room_no }&nowPage=${nowPage }';">
                     			<i class="glyphicon glyphicon-list"></i>&nbsp;숙박시설
                     		</button>		
                     		                     
                                    	                          
                           
                        	
    
                        <!-- /.panel-body -->
   
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