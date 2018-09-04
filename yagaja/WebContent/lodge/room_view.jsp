<%@page import="model.LodgeDTO"%>
<%@page import="model.LodgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="table-responsive">
                        	
                            <table width="70%" class="table table-bordered table-hover center" style="text-align:center;">
                                <thead>
                                <!-- 굵기넣기 -->
                                <input type="hid den" name="lodge_no" value="${dto.lodge_no }"/>
                                <input type="hid den" value="${dto.room_no }" />   
                                <input type="hid den" value="${dto.lodge_no }" />   
                                
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
                                        <td>${dto.d_sleep_price }</td>
                                        <td style="font-weight:bold">주중 대실가격</td>
                                        <td>${dto.d_rent_price }</td>
                                    </tr>
                                    <tr class="even gradeC" >
                                        <td style="font-weight:bold;" >주말 숙박가격</td>
                                        <td>${dto.w_sleep_price }</td>
                                        <td style="font-weight:bold ">주말 대실가격</td>
                                        <td>${dto.w_rent_price }</td>
                                    </tr>
                                    <tr class="even gradeC" >
                                        <td style="font-weight:bold">객실 사진</td>
                                        <td colspan="3"><img src="../Upload/${dto.room_photo }" /></td>
                                    </tr>
                                    
                                    		
                                  
                                
                                </tbody>
                            </table>
	                            <div class="row" style="text-align:center;">
		                            <p>
			                            <button  type="button" class="btn btn-success" onclick="location.href='../lodge/room_modify?lodge_no=${dto.lodge_no }&room_no=${dto.room_no }';">
			                           		수정
			                           	</button>
			                    		<button type="button" class="btn btn-danger"onclick="location.href='../lodge/room_delete?lodge_no=${dto.lodge_no }&room_no=${dto.room_no }';">
			                     			삭제
			                     		</button>
		                     		</p>
                     			</div>
                            
                                    	
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