<%@page import="java.util.List"%>
<%@page import="model.LodgeDTO"%>
<%@page import="model.LodgeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lodge_write</title>
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
<script>
function zipcodeFind()
{
    new daum.Postcode({
        	oncomplete: function(data) {
            	var fn = document.writeFrm;
            	fn.addr_num.value = data.zonecode; //우편번호
            	fn.addr_sido.value = data.address; //기본주소
            	fn.addr_detail.focus(); //상세주수로 포커스 이동
        	}
    	}).open();	
}
<%
/* 
String lodge_name = request.getAttribute("lodge_name").toString();



LodgeDAO dao = new LodgeDAO();
LodgeDTO dto =dao.selectLodge_No(lodge_name);


//System.out.println("lodge_no "+dto.getLodge_no());
pageContext.setAttribute("dto", dto);
//request.setAttribute("lodge_no", dto.getLodge_no());
dao.close();
 */


%>  
 
$(function(){
	$('#addBtn').click(function(){
		var r_type = $('#r_type').val();
		var r_person = $('#r_person').val();
		var dr_price = $('#dr_price').val();
		var ds_price = $('#ds_price').val();
		var wr_price = $('#wr_price').val();
		var ws_price = $('#ws_price').val();
		var r_photo = $('#r_photo').val();
		
	});
});
 
 
 
</script>

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
                    <h1 class="page-header">숙박 업소 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           숙박 시설 등록 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="table-responsive">    
                        	<form name="writeFrm2" method="post" action="<c:url value="../lodge/room_write" />"  enctype="multipart/form-data">
                        	<input type="hid den" name="lodge_no" value="${dto.lodge_no }" />
                        	<input type="hid den" name="lodge_name" value="${lodge_name }">
                        		<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">
                        			<tr class="odd gradeX">
		                        		<td colspan="2">
		                        			<button type="submit" class="btn btn-warning" id="addBtn">추가+</button>
		                        			<button type="button" class="btn btn-info" onclick="location.href='./lodge_list';">완료</button>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">객실 타입(인원)</td>
	                        			<td >
	                        				<input name="room_type" type="text" id="r_type"/>&nbsp;&nbsp;( 
	                        				<input name="room_person" type="text" id="r_person"/>) 명
											<%--<span style="vertical-align:middle; font-weight:bold;">최소:</span>
											 <select name="room_person" style="width:60px;">
					       						<%
												for(int i=2 ; i<=20 ; i++){
												%>
												<option value="<%=i%>"><%=i %>명</option>
												<%} %>
					       					</select>
					       					&nbsp;&nbsp;&nbsp;&nbsp;
					       					
					       					<span style="vertical-align:middle; font-weight:bold;">최대:</span>
					       					<select name="room_person"  style="width:60px;">
					       						<%
												for(int i=2 ; i<=20 ; i++){
												%>
												<option value="<%=i%>"><%=i %>명</option>
												<%} %>
					       					</select> --%>
										</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			<span style="color:black; font-size:1.2em; font-weight:bold;">주중</span>&nbsp;&nbsp;대실가격
		                        		</td>
		                        		<td>
		                        			<input type="text" name="d_rent_price" width:50px; id="dr_price"/>&nbsp;<span style="vertical-align:middle;">원</span>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			<span style="color:black; font-size:1.2em; font-weight:bold;">주중</span>&nbsp;&nbsp;숙박가격
		                        		</td>
		                        		<td>
		                        			<input type="text" name="d_sleep_price" width:50px; id="ds_price"/>&nbsp;<span style="vertical-align:middle;">원</span>
		                        		</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			<span style="color:red; font-size:1.2em; font-weight:bold;">주말</span>&nbsp;&nbsp;대실가격
		                        		</td>
		                        		<td>
		                        			<input type="text" name="w_rent_price" width:50px; id="wr_price"/>&nbsp;<span style="vertical-align:middle;">원</span>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			<span style="color:red; font-size:1.2em; font-weight:bold;">주말</span>&nbsp;&nbsp;숙박가격
		                        		</td>
		                        		<td>
		                        			<input type="text" name="w_sleep_price" width:50px; id="ws_price"/>&nbsp;<span style="vertical-align:middle;">원</span>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			객실사진
		                        		</td>
		                        		<td>
		                        			<input multiple="multiple" type="file" name="room_photo" id="r_photo"/>
		                        		</td>
		                        	</tr>
                        		</table>
                        	</form>
          
                        	
                        	<form action="">
                        		<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">
	                       			<tr class="odd gradeX">
		                        		<td style="text-align:center;">No</td>
		                        		<td style="text-align:center;">객실타입</td>
		                        		<td>최소인원</td>
		                        		<td>최대인원</td>
		                        		<td style="text-align:center;"><span style="color:black; font-weight:bold;">주중</span>&nbsp;&nbsp;&nbsp;대실가격</td>
		                        		<td style="text-align:center;"><span style="color:black; font-weight:bold;">주중</span>&nbsp;&nbsp;&nbsp;숙박가격</td>
		                        		<td style="text-align:center;"><span style="color:red; font-weight:bold;">주말</span>&nbsp;&nbsp;&nbsp;대실가격</td>
		                        		<td style="text-align:center;"><span style="color:red; font-weight:bold;">주말</span>&nbsp;&nbsp;&nbsp;숙박가격</td>
		                        		<td style="text-align:center;">객실사진</td>
		                        	</tr>
			                        <tr class="even gradeC">
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
		                        	</tr>
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