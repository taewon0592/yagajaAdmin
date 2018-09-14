<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="../vendor/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 결제 관리</title>
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

<!-- 전체선택체크되면 체크박스 모두 체크되기 -->
<script type="text/javascript">
function allCheckFunc(obj) {
	$("[name=checkDel]").prop("checked", $(obj).prop("checked"));
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc(obj) {
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if ($(obj).prop("checked")) {
		checkBoxLength = $("[name=" + objName + "]").length;
		checkedLength = $("[name=" + objName + "]:checked").length;

		if (checkBoxLength == checkedLength) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	} else {
		allObj.prop("checked", false);
	}
}

$(function() {
	$("[name=checkAll]").click(function() {
		allCheckFunc(this);
	});
	$("[name=checkDel]").each(function() {
		$(this).click(function() {
			oneCheckFunc($(this));
		});
	});
});

$(function(){
	$("#delUser").click(function(){
		var selectedCheck = new Array();
		$('.inputchk:checked').each(function(){
			selectedCheck.push(this.value);
		});
		
		if(selectedCheck.length<1){
			alert("삭제할 회원을 선택해 주세요.");
			return false;
		}
		
		var chk=confirm("삭제하시겠습니까?");
		if(chk){
			
			document.delfrm.action="../Reservation/ReservationDelete";
			document.delfrm.submit();
			alert("삭제 완료 되었습니다.");
		}
		else{
			alert("삭제 취소 되었습니다.");
			return false;
		}	
		
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
                    <h1 class="page-header">예약 취소 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
<!-- 검색 -->
<div class="row text-left"
	style="margin-bottom: 5px; padding-left: 15px;">
	<form class="form-inline" name="searchFrm" method="post">
		<div class="input-group" style="padding-left: 1px;">
			<select name="searchColumn" class="form-control">
				<option value="direct_input">검색조건</option>
				<option value="reser_name">취소자명</option>
				<option value="payment_type">결제수단</option>
				<option value="lodge_type">숙소타입</option>
			</select>
		</div>
		<div class="input-group" style="padding-left: 1px;">
			<input type="search" name="searchWord" class="form-control"
				placeholder="검색어를 입력하세요." autofocus />
			<div class="input-group-btn" style="padding-left: 2px;">
				<button type="submit" id="btn_search" class="btn btn-default">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
</div>
                        
<form name="delfrm" method="post" action="../Reservation/ReservationDelete">
	<div class="table-responsive">                        
                        
                            <table width="100%" class="table table-bordered table-hover"  style="text-align:center;" id="checkboxTestTbl">
                                <thead>
                                    <tr style="font-weight: bold">
										<td style="width: 30px;"><input type="checkbox"
											name="checkAll" /></td>
                                        <td>예약번호</td>
                                        <td>예약자명</td>
                                        <td>결제금액</td>
                                        <td>취소일자</td>
                                        <td>취소수수료</td>
                                        <td>환불금액</td>
                                        <td>숙소타입</td>
                                        <td>결제수단</td>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <!-- 반복시작 -->
								<c:choose>
									<c:when test="${empty lists }">
										<!-- 등록된 게시물이 없을때 -->
										<tr>
											<td colspan="8">등록된 게시물이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<!-- 등록된 게시물이 있을때 반복하면서 리스트 출력 -->
										<c:forEach items="${lists }" var="row" varStatus="loop">
											<tr>
											<input type="hidden" value="${row.reser_no }" />
												<td><input type="checkbox" class="inputchk"
													name="checkDel" value="${row.reser_no }" /></td>
												<td>${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }</td>
		                                        <td class="text-center">
			                                        <a href="../Reservation/ReservationCancleView?reser_no=${row.reser_no }&nowPage=${map.nowPage}">
														${row.reser_name }
													</a>
												</td>
												<td class="text-center"><fmt:formatNumber value="${row.payment_price }" groupingUsed="true"/></td>
		                                        <td class="text-center">${row.cancle_date }</td>		                                        
		                                        <td class="text-center"><fmt:formatNumber value="${row.cancle_fee }" groupingUsed="true"/></td>
		                                        <td class="text-center"><fmt:formatNumber value="${(row.payment_price - row.cancle_fee)}" groupingUsed="true"/></td>
		                                        <td class="text-center">${row.lodge_type }</td>
		                                        <td class="text-center">${row.payment_type }</td>												
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</form>
								<!-- 반복끝 -->	
                                </tbody>
                            </table>
                            <button type="button" id="delUser" class="btn btn-danger">
								<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
							</button>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <!-- 페이지번호 -->
			<div class="row text-center">
				<ul class="pagination">${pagingImg }
				</ul>
			</div>
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