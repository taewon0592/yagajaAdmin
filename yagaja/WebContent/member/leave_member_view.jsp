<%@page import="model.YagajaLeaveMemberDTO"%>
<%@page import="model.YagajaLeaveMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴 회원 관리</title>
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
                    <h1 class="page-header">탈퇴 회원 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
                                    <!-- 검색창 만들어야함 -->
                                    <tr >
                                    	<td style="font-weight:bold">아이디</td>
                                    	<td>${dto.id }</td>
                                    </tr>
                                    <tr>
                                    	<td style="font-weight:bold">탈퇴일</td>
                                    	<td>${dto.leave_date }</td>
                                  	</tr>
                                    <tr >
                                    	<td style="font-weight:bold">탈퇴사유</td>
                                    	<td>${dto.leave_reason }</td>
                                    </tr>
                                    <tr>
                                    	<td style="font-weight:bold">세부사유</td>
                                    	<td>${dto.leave_reason2 }</td>
                                  	</tr>                      
                                  
                               
                                <!-- 페이징처리넣어줘야함  -->
                            </table>
                            <!-- /.table-responsive -->
                                <button type="button" class="btn btn-warning" onclick="location.href='../Member/LeaveMemberList?nowPage=${map.nowPage}';">
									<i class="glyphicon glyphicon-list"></i>&nbsp;리스트보기
								</button>   
								<button type="button" id="submit" class="btn btn-danger" onclick="location.href='../Member/LeaveMemberDelete?member_no=${dto.member_no}';">
									<i class="glyphicon glyphicon-trash"></i>&nbsp;회원삭제
								</button>  

                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <c:url value="../Member/LeaveMemberDelete?member_no=${dto.member_no }" var="url"></c:url>

<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
				
		var chk=confirm("삭제하시겠습니까?");
		if(chk){			
			alert("삭제 완료 되었습니다.");
			document.location.hre="${url}"
		}
		else{
			alert("삭제 취소 되었습니다.");
			history.back();
		}	
		
	});
});
</script>

                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

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