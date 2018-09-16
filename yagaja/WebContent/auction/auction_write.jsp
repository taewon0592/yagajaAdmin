<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
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
<%@include file="../include/datetimepicker.jsp" %>
<script> 
$( document ).ready( function() {
   
   //날짜+시간
   $("#auction_check_in, #auction_check_out, #auction_stime, #auction_etime").datetimepicker({
      dateFormat : 'yy-mm-dd',
      minDate: 0,
      maxDate: 365,
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
        oneLine:true,
        /* ,
        onSelect : function(value){
           var dt = new Date(value);
           var dtw = dt.getDay();   
        },
        onClose: function(value){
           var dt = new Date(value);
           var dtw = dt.getDay();
        } */
   });
 
   //날짜 선택시 전날선택 안되게 막기
   $('#auction_check_in').datetimepicker("option","maxDate", $("#auction_check_out").val());

   $('#auction_check_in').datetimepicker("option","onClose",
      function(selectedDate) {
         $("#auction_check_out").datetimepicker("option", "minDate", selectedDate);
         });
   
   $('#auction_stime').datepicker("option","maxDate", $("#auction_etime").val());

   $('#auction_stime').datepicker("option","onClose",
      function(selectedDate) {
         $("#auction_etime").datepicker(
            "option", "minDate", selectedDate);
         });
   
   //오늘날짜 등록되기
   $('#nowDate').datepicker({
   }); 
   var d = new Date();
   var month = d.getMonth()+1;
   var prettyDate = d.getFullYear()+'-'+month +'-'+d.getDate();
   $('#nowDate').val(prettyDate);
});

function frmValidate(fn) {
	var f = document.writeFrm;
	if (f.lodge_name.value == "") {
		alert("숙소명을 입력하세요");
		f.lodge_name.focus();
		return false;
	}
	if (f.auction_check_in.value == "") {
		alert("입실날짜를 선택하세요");
		f.auction_check_in.focus();
		return false;
	}
	if (f.auction_check_out.value == "") {
		alert("퇴실날짜를 선택하세요");
		f.auction_check_out.focus();
		return false;
	}
	if (f.start_Price.value == "") {
		alert("경매 시작가를 입력하세요.");
		f.start_Price.focus();
		return false;
	}
	if (f.auction_unit.value == "") {
		alert("입찰단위를 선택하세요.");
		f.auction_unit.focus();
		return false;
	}
	if (f.auction_stime.value == "") {
		alert("경매 시작일을 선택하세요.");
		f.auction_stime.focus();
		return false;
	}
	if (f.auction_etime.value == "") {
		alert("경매 종료일을 선택하세요.");
		f.auction_etime.focus();
		return false;
	}
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
							<h1 class="page-header">경매 등록</h1>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
					<div class="row">
						<div class="col-lg-8">
							<div class="panel panel-default">

		
								<!-- /.panel-heading -->
								<form action="../Yagaja/AuctionWrite?mode=1" name="writeFrm" method="post" onsubmit="return frmValidate(this);">
									<div class="panel-body">
										<div class="table-responsive">
											<table width="100%"
												class="table table-striped table-bordered table-hover center"
												style="text-align: center;">
												<tr style="font-weight: bold">
												<input type="hidden" id="lodge_no" name="lodge_no" value="" />
													<td style="vertical-align:middle;">숙박업소명</td>
													<td colspan="3">
														<div class="input-group">
															<input type="text" class="form-control" placeholder="숙소명을 검색하세요" id="lodge_name" />
															<div class="input-group-btn">
																<button type="button" class="btn btn-default" id="lodge_searchBtn" data-toggle="modal" data-target="#lodge_searchModal">
																	<i class="glyphicon glyphicon-search"></i>
																</button>
															</div>
														</div>
													</td> 
												</tr>
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">숙 소 분 류</td>
													<td colspan="3">
														<input type="text" class="form-control" id="lodge_type" />
														<!-- 
														<select name="lodge_type"
															onChange="lodge_type(this.value);" class="form-control">
																<option value="모텔">모텔</option>
																<option value="호텔">호텔</option>
																<option value="민박집">민박집</option>
																<option value="펜션">펜션</option>
														</select>
														 -->
													</td>
												</tr>
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">객 실 타 입</td>
													<td colspan="3">
														<!-- 숙소명과 숙소분류에 따른 객실타입이 자동으로 나올 수 있어야함 --> 
														<select name="room_type" id="room_type" class="form-control" onChange="typeChange(this.value);">
														</select>
														<input type="hidden" id="room_no" name="room_no" value="" />
													</td>
												</tr>
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">입 실 날 짜</td>
													
													<td>
														<input type="text" class="form-control" id="auction_check_in" name="auction_check_in"/>
													</td>
													<td style="font-weight: bold; vertical-align:middle;">퇴 실 날 짜</td>
													<td>
														<input type="text" class="form-control" id="auction_check_out" name="auction_check_out"/>
													</td>
												</tr>
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">시 작 가</td>
													<td colspan="3">
														<input type="text" class="form-control" id="" name="start_Price"/>
													</td>
												</tr>
												
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">입 찰 단 위</td>
													<td colspan="3">
					                        		<select name="auction_unit" id="" class="form-control">
					                        			<option value="500">500</option>
					                        			<option value="1000">1000</option>
					                        			<option value="1500">1500</option>
					                        			<option value="2000">2000</option>
					                        		</select>
					                        		</td>
												</tr>
												<tr>
													<td style="font-weight: bold; vertical-align:middle;">경 매 시 작</td>
													<td>
														<input type="text" class=form-control id="auction_stime" name="auction_stime"/>
													</td>
													<td style="font-weight: bold; vertical-align:middle;">경 매 종 료</td>
													<td>
														<input type="text" class="form-control" id="auction_etime" name="auction_etime" />												
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
										<button type="button" class="btn btn-success" onclick="location.href='../Yagaja/AuctionList?mode=1';">
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

    <!-- jQuery -->

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

	<script>
$(function(){
    // 검색버튼 눌렸을 때 함수 실행( LodgeSearch에서 쿼리를 이너조인해주면 숙소일련번호와 연결된 룸타입의 모든갯수가 나오므로 따로 ajax실행)
    $("#searchBtn").click(function(e){

        //ajax
        $.ajax({
        	url : "../Yagaja/LodgeSearch",
        	data : { lodgename :$('#lodgename').val() },
        	type : "get",
        	async: false,
        	dataType : "json",
        	contentType:"application/json; charset=UTF-8", 
        	error : function(e){
        		alert("오류발생:"+e.status+":"+e.statusText );
        	},
        	
        	success : function(data){
        		
        		//객실타입 셀렉트박스 초기화 
					$('#room_type').empty();
        		
        		//숙소를 검색해서 모달창내에 리스트를띄우고 선택시 부모창에 값이 들어갈수있게 설정
        		$.each(data, function(index, jsonArr){
        			//alert("룸넘버:"+jsonArr.room_no+"룸타입:"+jsonArr.room_type+"숙소번호:"+jsonArr.lodge_no);
        			
					$('#lodge_searchList').html("<tr><td>"+jsonArr.lodge_no+"</td><td><a href='javascript:lodgeInfo(\""+jsonArr.lodge_no+"\",\""+jsonArr.lodge_name+"\",\""+jsonArr.lodge_type+"\",\""+jsonArr.room_no+"\",\""+jsonArr.room_type+"\");'>" +jsonArr.lodge_name+"</a></td><td>"+jsonArr.lodge_type+"</td><td>"+jsonArr.lodge_tel+"</td></tr>");
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

	alert(lodge_no);
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
										<th style="width: 20%; text-align:center">등록번호</th>
										<th style="width: 30%; text-align:center">숙박업소명</th>
										<th style="width: 20%; text-align:center">업소종류</th>
										<th style="width: 30%; text-align:center">대표번호</th>
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