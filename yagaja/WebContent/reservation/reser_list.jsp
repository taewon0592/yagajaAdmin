<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀은여기에</title>
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
                    <h1 class="page-header">예약 결제 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           현재 예약 목록  
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-bordered table-hover"  style="text-align:center;">
                            <!--  id="dataTables-example" 하면 좋긴함ㅋㅋ -->
                                <thead>
                                    <tr class="center" style="font-weight:bold;">
                                        <td>예약번호</td>
                                        <td>예약자명</td>
                                        <td>예약일자</td>
                                        <td>예약종류</td>
                                        <td>숙박/대실</td>
                                        <td>결제금액</td>
                                        <td>입실시간(24시 기준)</td>
                                        <td>퇴실시간(24시 기준)</td>
                                        <td>휴대전화</td>
                                        <td>결제수단</td>
                                        <td>방문형태</td>
                                        <td>삭제
                                        	<button type="submit" class="btn btn-waring">
                                        		전체선택버튼
                                        	</button>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>1</td>
                                        <td>주유란</td>
                                        <td>2018-08-10</td>
                                        <td class="center">경매</td>
                                        <td>숙박</td>
                                        <td class="center">30000</td>
                                        <td>15:00</td>
                                        <td>15:00</td>
                                        <td>010-6742-3456</td>
                                        <td>카드</td>
                                        <td>도보</td>
                                        <td><input type="checkbox" name="delete"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>2</td>
                                        <td>주유란2</td>
                                        <td>2018-08-10</td>
                                        <td class="center">경매</td>
                                        <td>숙박</td>
                                        <td class="center">20000</td>
                                        <td>15:00</td>
                                        <td>15:00</td>
                                        <td>010-6742-3456</td>
                                        <td>카드</td>
                                        <td>도보</td>
                                        <td><input type="checkbox" name="delete"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>3</td>
                                        <td>주유란</td>
                                        <td>2018-08-10</td>
                                        <td class="center">핫딜</td>
                                        <td>숙박</td>
                                        <td class="center">200000</td>
                                        <td>17:00</td>
                                        <td>17:00</td>
                                        <td>010-6742-3456</td>
                                        <td>카드</td>
                                        <td>도보</td>
                                        <td><input type="checkbox" name="delete"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>4</td>
                                        <td>주유란</td>
                                        <td>2018-08-10</td>
                                        <td class="center">일반</td>
                                        <td>대실</td>
                                        <td class="center">200000</td>
                                        <td>16:00</td>
                                        <td>16:00</td>
                                        <td>010-6742-3456</td>
                                        <td>카드</td>
                                        <td>도보</td>
                                        <td><input type="checkbox" name="delete"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>5</td>
                                        <td>주유란</td>
                                        <td>2018-08-10</td>
                                        <td class="center">일반</td>
                                        <td>대실</td>
                                        <td class="center">20000</td>
                                        <td>16:00</td>
                                        <td>16:00</td>
                                        <td>010-6742-3456</td>
                                        <td>카드</td>
                                        <td>도보</td>
                                        <td><input type="checkbox" name="delete"/></td>
                                    </tr>
                                  
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
    <script src="../vendor/jquery/jquery.min.js"></script>

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