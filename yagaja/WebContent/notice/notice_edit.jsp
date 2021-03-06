<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 네이버 스마트에디터 2.0 api -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../vendor/naver_editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

</head>

<%
String nowPage = request.getParameter("nowPage");
%>

<script>

$(function() {
	var editor_object = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : editor_object,
		elPlaceHolder : "smarteditor",
		sSkinURI : "../vendor/naver_editor/SmartEditor2Skin.html",
		HTpARAMS : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger : true,
		}
	});
	
	$("#savebutton").click(function() {
		editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		function isValidate(fn) {
			
			if(fn.notice_title.value=="") {
				alert("제목을 입력해주세요");
				fn.notice_title.focus();
				return false;
			}
			if(fn.notice_name.value=="") {
				alert("작성자를 입력해주세요");
				fn.notice_name.focus();
				return false;
			}
			if(fn.notice_contents.value=="") {
				alert("내용을 입력해주세요");
				fn.notice_contents.focus();
				return false;
			}
		}
	});
});




</script>

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
                    <h1 class="page-header">공지사항 수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           공지사항 수정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="table-responsive">    
                        	<form action="../Notice/NoticeEdit" name="writeFrm" method="post" onsubmit="return isValidate(this);" >
	                        	
	                        	<!-- 게시물 수정을 위한 일련번호 추가 -->
	                        	<input type="hidden" name="notice_no" value="${dto.notice_no }" />
	                        	<input type="hidden" name="nowPage" value="${nowPage }" />
	                        	
	                        	<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">

		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; width:15%; font-size:1.2em; text-align:center;">제목</td>
		                        		<td>
											<input type="text" style="width:300px; text-align:left;" name="notice_title" value="${dto.notice_title }" />
		                        		</td>
		                        	</tr>
		                        	
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; width:15%; font-size:1.2em; text-align:center;">작성자</td>
		                        		<td>
											<input type="text" style="width:300px; text-align:left;" name="notice_name" value="${dto.notice_name }" />
		                        		</td>
		                        	</tr>
		                        	
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:15%; text-align:center;">내용</td>
		                        		<td>
		                        			<textarea name="notice_contents" id="smarteditor" cols="70" rows="10" value="${dto.notice_contents }"></textarea>
		                        		</td>
		                        	</tr>
		                        	
                        		</table>

		<!-- 각종 버튼 부분 -->

		<button type="submit" class="btn btn-info" id="savebutton" onclick="">수정하기</button>
		<button type="button" class="btn btn-warning" onclick="location.href='./NoticeList';" >리스트</button>

								</form>	
                        	
                        	
                        
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