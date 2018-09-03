<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>registView.jsp</title>
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
	                <div class="col-lg-12">
	                	<div class="panel panel-default">	
	                	<div class="panel-body">
	                
	                	<table width="100%" class="table table-striped table-bordered table-hover center" style=" width:60%;">
	                	
	                	<tr class="odd gradeX">
							<td style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">시설 종류</td>
							<td style="width:60%;">
								${dto.surround_type }
							</td>
						</tr>
	                	
						<tr class="even gradeC">
							<td style="font-weight:bold; vertical-align:middle; font-size:1em; width:40%; text-align:center;">주변시설 이름</td>
							<td  style="width:100%;" >
								${dto.surround_name }
							</td>
						</tr>
						<tr class="odd gradeX">
							<td style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">전화번호</td>
							<td style="width:100px;">
								${dto.surround_tel }
							</td>
						</tr>
						
						<tr class="odd gradeC">
							<td class="text-center" style="color:black;">우편번호</td>
							<td style="width:100px;">
								${dto.surround_zipcode }
							</td>
						<tr class="odd gradeX">
							<td style="font-weight:bold; vertical-align:middle; font-size:1em; width:30%; text-align:center;">주변시설 주소</td>
							<td style="width:550px; margin-top:5px;">
								${dto.surround_addr }
							</td>
						</tr>
						<tr class="odd gradeC">
							<td class="text-center" style="font-weight:bold; vertical-align:middle; font-size:1em; width:30%; text-align:center;">주변시설 상세주소</td>
							<td style="width:550px; margin-top:5px;">
								${dto.surround_detail }
							</td>
						</tr>
						
						<tr class="odd gradeX">
							<td class="text-center" style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">위도</td>
							<td style="width:100%;">
								${dto.surround_lat }
							</td>
						</tr>
						<tr class="even gradeC">
							<td class="text-center" style="font-weight:bold; vertical-align:middle; font-size:1em; width:40%; text-align:center;">경도</td>
							<td style="width:100%">
								${dto.surround_long }
							</td>
						</tr>
						<tr  class="odd gradeX">
							<td  colspan="3" style="text-align:right;">
								<button type="button" class="btn btn-success" onclick="location.href='../lodge/registModify?surround_no=${param.surround_no}&mode=update&nowPage=${param.nowPage }';">
									수정하기
								</button>
							
								<button type="button" class="btn btn-info"onclick="location.href='../lodge/registDelete?surround_no=${param.surround_no}&mode=delete&nowPage=${param.nowPage }';">
									삭제하기 </button>
							
								<button type="button" class="btn btn-danger" onclick="location.href='./registList?nowPage=${param.nowPage}';">
									리스트보기</button>
							</td>
							
						</tr>
						<%-- <input type="hid den" value ="${param.surround_no }" /> --%>
						</table>
                     	
                     	</div>
                       </div>
	                        <!-- /.panel-body -->
	                
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            
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