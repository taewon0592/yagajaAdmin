 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>regist.jsp</title>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function zipcodeFind()
{
    new daum.Postcode({
        	oncomplete: function(data) {
            	var fn = document.registFrm;
            	fn.zipcode.value = data.zonecode; //우편번호
            	fn.addr1.value = data.address; //기본주소
            	fn.addr2.focus(); //상세주수로 포커스 이동
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
	                    <h1 class="page-header">주변시설 등록</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">

	                        <div class="panel-body">
	                        	<div class="table-responsive">
	                        	
	                        	<form action="../lodge/registWrite" name="registFrm">
		                            <table width="100%" class="table table-striped table-bordered table-hover center" style=" width:60%;" >
		                            	<tr class="odd gradeX">
			                        		<td style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">유형</td>
			                        		<td style="width:60%;">
												<select name="" id="" style="width:100%; vertical-align:middle;">
													<option value="sel">선택하세요</option>
													<option value="cafe">카페</option>
													<option value="rest">음식점</option>
													<option value="oil">주유소</option>
													<option value="etc">기  타</option>
												</select>
			                        		</td>
			                        	</tr>
			                        	<tr class="even gradeC">
			                        		<td style="font-weight:bold; vertical-align:middle; font-size:1em; width:40%; text-align:center;">편의시설명</td>
			                        		<td >
	                        					<input type="text" style="width:100%" />
			                        		</td>
			                        	</tr>
			                        	<tr class="odd gradeX">
			                        		<td style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">편의시설 전화번호</td>
			                        		<td>
												<input type="text" style="width:100px;" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<input type="text" style="width:100px;" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<input type="text" style="width:100px;" />
			                        		</td>
			                        	</tr>
			                        	<tr class="even gradeC">
			                        		<td style="font-weight:bold; vertical-align:middle; font-size:1em; width:30%; text-align:center;">편의시설주소</td>
			                        		
		                        			<td>
											<!-- 우편번호 -->
											<input type="text" name="zipcode" value=""  class="join_input" style="width:100px;" />
											<a href="javascript:;" title="새 창으로 열림" style="color:black;" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a>
											<br/>
											<!-- 주소 -->
											<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
											<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
											</td>
			                        	</tr>
			                        	<tr class="odd gradeX">
			                        		<td style="font-weight:bold; vertical-align:middle; width:40%; font-size:1em; text-align:center;">편의시설 위도</td>
			                        		<td>
												<input type="text" style="width:100%;" />
			                        		</td>
			                        	</tr>
			                        	<tr class="even gradeC">
			                        		<td style="font-weight:bold; vertical-align:middle; font-size:1em; width:40%; text-align:center;">편의시설 경도</td>
			                        		<td >
	                        					<input type="text" style="width:100%" />
			                        		</td>
			                        	</tr>
			                        	<tr class="odd gradeX">
			                        		<td colspan="2" style="text-align:right;"><button class="btn btn-info">등록하기</button></td>
			                        	</tr>
			                        	
		
		
		                            </table>
		                            <!-- /.table-responsive -->
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