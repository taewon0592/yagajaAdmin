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
                        	<form action="<c:url value="../lodge/lodge_write" />" name="writeFrm" method="post" enctype="multipart/form-data" >
	                        	<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">
	                        		<tr class="even gradeC">
		                        		<td colspan="2">
		                        			<h4><b>숙소 등록</b></h4>
		                        		</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; width:20%; font-size:1.2em; text-align:center;">숙소명</td>
		                        		<td style="width:60%;">
											<input type="text" style="width:300px; text-align:left;" name="lodge_name"  />
		                        		</td>
		                        	</tr>
		                        	
		                        	<tr class="even gradeC">
		                        		<td  style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙박업소 종류</td>
		                        		<td >
                        					<input type="radio" name="lodge_type"  value="모텔" />모텔&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="호텔/리조트" />호텔/리조트&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="펜션/풀빌라" />펜션/풀빌라&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="게스트하우스" />게스트하우스
		                        		</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소주소</td>
		                        		
	                        			<td>
										<!-- 우편번호 -->
										<input type="text" name="addr_num" value=""  class="join_input" style="width:100px;" />
										<a href="javascript:;" title="새 창으로 열림" style="color:black;" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a>
										<br/>
										<!-- 주소 -->
										<input type="text" name="addr_sido" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
										<input type="text" name="addr_detail" value=""  class="join_input" style="width:550px; margin-top:5px;" />
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">전화번호</td>
  										<td style="text-align:left;"><input type="text" name="tel1"  value="" class="join_input" style="width:80px;" />&nbsp;&nbsp; - &nbsp;&nbsp;<input type="text" name="tel2"  value="" class="join_input" style="width:80px;" />&nbsp;&nbsp; - &nbsp;&nbsp;<input type="text" name="tel3"  value="" class="join_input" style="width:80px;" /></td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">룸 개수</td>
	                        			<td>
											<input name="lodge_roomcount" type="text" style="width:60px;"/>&nbsp;개
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">태그</td>
  										<td style="text-align:left;">
  											<input name="lodge_tag" type="text" value="태그선택하면 여기나오게" style="width:300px;" />
  											<!-- <select name="lodge_tag" id="" style="vertical-align:middle;">
  												<option value="tag">태그를선택하세요</option>
  												<option value="#여기에추가1">#여기에추가1</option>
  												<option value="#여기에추가2">#여기에추가2</option>
  												<option value="#여기에추가3">#여기에추가3</option>
  												<option value="#여기에추가4">#여기에추가4</option>
  											</select> -->
  										</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">룸 테마</td>
	                        			<td>
											<input type="checkbox" name="lodge_thema" value="park"/>주차기능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="pc"/>커플PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_thema" value="smoke"/>객실금연&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_thema" value="event"/>이벤트가능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="snack"/>스낵바&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_thema" value="food"/>조식가능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="free"/>무료세탁&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="car"/>픽업가능	
					                  	 	<br />
					                  	 	<input type="checkbox" name="lodge_thema" value="twin"/>트윈베드&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="terace"/>야외테라스&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="tel"/>무인텔&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="chair"/>안마의자&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="movie"/>무료영화&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="game"/>게임기&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="party"/>파티가능 &nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" name="lodge_thema" value="drug"/>상비약&nbsp;&nbsp;&nbsp;	
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소 특징</td>
  										<td style="text-align:left;">
  											<input type="checkbox" name="lodge_feature" value="sale"/>최저가보상	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="nocamera"/>몰카예방	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="point"/>현장적립	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="best100"/>좋은숙박 BEST100
  										</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소 정보</td>
		                        		<td>
		                        			<textarea name="lodge_note" id="" cols="70" rows="10"></textarea>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			숙소 대표사진
		                        		</td>
		                        		<td>
		                        			<input type="file" name="lodge_photo"/>
		                        		</td>
		                        	</tr>
                        		</table>
                        		<button type="submit" class="btn btn-info">등록하기</button>
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