<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hotDeal.jsp</title>
<link href="../vendor/bootstrap3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS (세로드롭메뉴바)-->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="../vendor/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../vendor/bootstrap3.3.7/css/jquery-ui-timepicker-addon.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script
	src="../vendor/bootstrap3.3.7/jquery/jquery-ui-timepicker-addon.js"></script>

<script>
$( document ).ready( function() {
	//날짜+시간
   $("#hotdeal_stime,#hotdeal_etime").datetimepicker({
		dateFormat : 'yy-mm-dd',
		minDate: 0,
		maxDate: 30,
		currentText: '오늘',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
		dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
		changeMonth : true,
		changeYear : true,
		showMonthAfterYear : true,
		yearRange : 'c:c+10',
		// timepicker 설정
        timeFormat:'HH:mm:ss',
        controlType:'select',
        oneLine:true
   });
   
   
   //날짜만
   $("#hotdeal_sday,#hotdeal_eday").datepicker({
		dateFormat : 'yy-mm-dd',
		minDate: 0,
		maxDate: 100,
		prevText : '이전 달',
		nextText : '다음 달',
		monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
		dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
		changeMonth : true,
		changeYear : true,
		showMonthAfterYear : true,
		yearRange : 'c:c+10',
		/*timepicker 설정
        timeFormat:'HH:mm:ss',
        controlType:'select',
        oneLine:true */
   });
 
	//날짜 선택시 전날선택 안되게 막기
	$('#hotdeal_stime').datetimepicker("option","maxDate", $("#hotdeal_etime").val());

	$('#hotdeal_stime').datetimepicker("option","onClose",
		function(selectedDate) {
			$("#hotdeal_etime").datepicker(
				"option", "minDate", selectedDate);
			});
	
	$('#hotdeal_sday').datepicker("option","maxDate", $("#hotdeal_eday").val());

	$('#hotdeal_sday').datetimepicker("option","onClose",
		function(selectedDate) {
			$("#hotdeal_eday").datepicker(
				"option", "minDate", selectedDate);
			});
	
	//오늘날짜 등록되기
	$('hotdeal_date').datepicker({
	});
	var d = new Date();
	var month = d.getMonth()+1;
	var prettyDate = d.getFullYear()+'-'+month +'-'+d.getDate();
	$('#hotdeal_date').val(prettyDate);
});
</script>
<style>
.ui-datepicker {
	font-size: 12px;
	width: 200px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 50%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 50%;
	font-size: 11px;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:first-child a {
	color: #f00;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:last-child a {
	color: #00f;
}
</style>
<script>
	function frmValidate(fn) {
		var f = document.writeFrm;
		if (f.lodge_name.value == "") {
			alert("숙소명을 입력하세요");
			f.lodge_name.focus();
			return false;
		}
		if (f.hotdeal_stime.value == "") {
			alert("핫딜날짜를 선택하세요");
			f.hotdeal_stime.focus();
			return false;
		}
		if (f.hotdeal_etime.value == "") {
			alert("핫딜날짜를 선택하세요");
			f.hotdeal_etime.focus();
			return false;
		}
		if (f.hotdeal_sday.value == "") {
			alert("핫딜을 사용할 수 있는 시작일을 입력하세요");
			f.hotdeal_sday.focus();
			return false;
		}
		if (f.hotdeal_eday.value == "") {
			alert("핫딜 사용 종료일을 입력하세요.");
			f.hotdeal_eday.focus();
			return false;
		}
		if (f.hotdeal_price.value == "") {
			alert("핫딜 적용가를 입력하세요");
			f.name.focus();
			return false;
		}		
		if (f.hotdeal_sell.value == "") {
			alert("핫딜 판매수량을 입력하세요");
			f.name.focus();
			return false;
		}
	}
}
</script>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<%@include file="../include/adminTop.jsp"%>
		<!-- /.navbar-top-links -->

		<%@include file="../include/adminLeftMenu.jsp"%>
		<!-- /.navbar-static-side -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">핫딜 물품 등록</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">

						<!-- /.panel-heading -->
						<form action="../HotDeal/HotDealWrite" name="writeFrm" method="post">
							<div class="panel-body">
								<div class="table-responsive">
									<table width="100%"
										class="table table-striped table-bordered table-hover center"
										style="text-align: center;">
										<tr style="font-weight: bold">
										<input type="hidden" id="lodge_no" name="lodge_no" value=""/>
											<td>숙박업소명</td>
											<td colspan="3">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="숙소명을 검색하세요" id="lodge_name" />
													<div class="input-group-btn">
														<button type="button" class="btn btn-default"
															id="lodge_searchBtn" data-toggle="modal"
															data-target="#lodge_searchModal">
															<i class="glyphicon glyphicon-search"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">숙소분류</td>
											<td colspan="3">
												<input type="text" class="form-control" id="lodge_type" />
											<!-- <select name="lodge_type"
												onChange="lodge_type(this.value);" class="form-control">
													<option value="모텔">모텔</option>
													<option value="호텔">호텔</option>
													<option value="민박집">민박집</option>
													<option value="펜션">펜션</option>
											</select> --></td>
										</tr>
										<tr>
											<td style="font-weight: bold">객실타입</td>
											<td colspan="3">
												<!-- 숙소명과 숙소분류에 따른 객실타입이 자동으로 나올 수 있어야함 --> 
												<select name="room_type" id="room_type" class="form-control"  onchange="typeChange(this.value);">
												</select>
												<input type="hidden" id="room_no" name="room_no" value=""/>
												
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 시작 시간</td>

											<td><input class="form-control" id="hotdeal_stime" name="hotdeal_stime"/></td>
											<td style="font-weight: bold">핫딜 마감 시간</td>
											<td><input class="form-control" id="hotdeal_etime" name="hotdeal_etime" /></td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 등록날짜</td>
											<td colspan="3">
												<input type="text" class="form-control" id="hotdeal_date" name="hotdeal_date" readonly/>
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 사용 시작가능일</td>
											<td>
												<input type="text" class=form-control id="hotdeal_sday" name="hotdeal_sday"/>
											</td>
											<td style="font-weight: bold">핫딜 사용 종료일</td>
											<td>
												<input type="text" class="form-control" id="hotdeal_eday" name="hotdeal_eday"/>
											</td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 적용금액</td>
											<td colspan="3"><input class="form-control"
												name="hotdeal_price"></td>
										</tr>
										<tr>
											<td style="font-weight: bold">핫딜 판매 수량</td>
											<td colspan="3" ><input class="form-control" name="hotdeal_sell">
											</td>
										</tr>

										</tbody>
									</table>
									<!-- /.table-responsive -->
								</div>
								<!-- /.panel-body -->
								<button type="submit" class="btn btn-info">
									<i class="glyphicon glyphicon-pencil"></i>&nbsp;등록하기
								</button>
								<button type="button" class="btn btn-warning" onclick="location.href='../HotDeal/HotDealList';">
									<i class="glyphicon glyphicon-list"></i>&nbsp;리스트보기
								</button>
							</div>
							<!-- /.panel -->
						</form>
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

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

	<script>
	$(function(){
	    // 검색버튼 눌렸을 때 함수 실행( LodgeSearch에서 쿼리를 이너조인해주면 숙소일련번호와 연결된 룸타입의 모든갯수가 나오므로 따로 ajax실행)
	    $("#searchBtn").click(function(e){

	        //ajax
	        $.ajax({
	        	url : "../HotDeal/LodgeSearch",
	        	data : { lodgename :$('#lodgename').val() },
	        	type : "get",
	        	async: false,
	        	dataType : "json",
	        	contentType:"application/json; charset=UTF-8", 
	        	error : function(e){
	        		alert("오류발생:"+e.status+":"+e.statusText );
	        	},
	        	
	        	success : function(data){
	        		
	        		//숙소이름 검색 모달창 초기화
	        		$('#lodge_searchList').empty();
	        		
	        		//객실타입 셀렉트박스 초기화
					$('#room_type').empty();
	        		
	        		//숙소를 검색해서 모달창내에 리스트를띄우고 선택시 부모창에 값이 들어갈수있게 설정
	        		$.each(data, function(index, jsonArr){
	        			
						$('#lodge_searchList').append("<tr><td>"+jsonArr.lodge_no+"</td><td>"
							+"<a href='javascript:lodgeInfo(\""+jsonArr.lodge_no+"\",\""+jsonArr.lodge_name+"\",\""+jsonArr.lodge_type+"\",\""+jsonArr.room_no+"\",\""+jsonArr.room_type+"\");'>"
							+jsonArr.lodge_name+"</a></td><td>"
							+jsonArr.lodge_type+"</td><td>"
							+jsonArr.room_type+"</td><td>"
							+jsonArr.lodge_tel+"</td></tr>");
						
						//모달창에 나타난 숙박업소명을 클릭하면 해당 숙박업소에 해당하는 객실타입이 셀렉트박스로 나옴
						$('#room_type').append("<option value='"+jsonArr.room_type+"||"+jsonArr.room_no+"'>"+jsonArr.room_type+"</option>");
	        		});
	        	}
	        });
		});
	});
/*

싱글쿼테이션 더블쿼테이션 주의할것
<a href="javascript:func('a','b');"></a>
<a href='javascript:func("a","b");'></a>
*/

function lodgeInfo(lodge_no,lodge_name,lodge_type,room_no,room_type)
{
	//리스트결과값을 메인창의 id로 넣어주고...
	document.getElementById("lodge_no").value = lodge_no;
	document.getElementById("lodge_name").value = lodge_name;
	document.getElementById("lodge_type").value = lodge_type;
	document.getElementById("room_no").value = room_no;
	document.getElementById("room_type").value = room_type;

	//alert(lodge_no);
	//alert(document.getElementById("lodge_no").value); 정상적으로 값이 들어감
}	

function typeChange(val)
{ 
	var array =  val.split("||");
	for( var i in array){
		//alert(array[1]);
		document.getElementById("room_no").value = array[1];
	}
}
</script>

	<!-- 모달창 -->
	<div class="modal fade" id="lodge_searchModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">숙박업소 검색</h3>
				</div>
				<div class="modal-body text-center">
					<form id="lodge_searchForm">
						<div class="input-group">
							<span class="input-group-addon">업소명 입력</span> 
							<input type="text" class="form-control" name="lodgename" id="lodgename"> 
							<span class="input-group-btn"> 
								<button type="button" class="btn btn-warning" value="검색" id="searchBtn">검색
								</button>
							</span>
						</div>
					</form>
					<div>
						<div style="width: 100%; height: 200px; overflow: auto">
							<table class="table text-center">
								<thead>
									<tr>
										<th style="width: 15%; text-align:center">등록번호</th>
										<th style="width: 25%; text-align:center">숙박업소명</th>
										<th style="width: 20%; text-align:center">업소종류</th>
										<th style="width: 20%; text-align:center">객실종류</th> 
										<th style="width: 20%; text-align:center">대표번호</th>

									</tr>
								</thead>
								<tbody id="lodge_searchList"></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>