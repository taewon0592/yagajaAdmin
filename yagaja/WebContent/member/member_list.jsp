<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../vendor/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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

<%@include file="../include/datetimepicker.jsp"%>
<!-- 전체선택체크되면 체크박스 모두 체크되기 -->
<script type="text/javascript">

function allCheckFunc( obj ) {
		$("[name=checkDel]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc( obj )
{
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked").length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=checkDel]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});

//체크박스 회원 삭제 경고창
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
			
			document.delfrm.action="../Member/MemberDelete";
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

<!-- 데이트피커 -->
<script>
$( document ).ready( function() {
   
   //날짜만
   $("#search_sday,#search_eday").datepicker({
      dateFormat : 'yy-mm-dd',
      minDate: 0,
      maxDate: 60,
      prevText : '이전 달',
      nextText : '다음 달',
      monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
      dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
      changeMonth : true,
      changeYear : true,
      showMonthAfterYear : true,
      yearRange : 'c-5:c+5',
   });
 
   //날짜 선택시 전날선택 안되게 막기

   $('#search_sday').datepicker("option","minDate", $("#search_eday").val());

   $('#search_sday').datepicker("option","onClose",
      function(selectedDate) {
         $("#search_eday").datepicker(
            "option", "minDate", selectedDate);
         });
   
   //오늘날짜 등록되기
   $('search_date').datepicker({
   });
   var d = new Date();
   var month = d.getMonth()+1;
   var prettyDate = d.getFullYear()+'-'+month +'-'+d.getDate();
   $('#search_date').val(prettyDate);
});
</script>
<script type="text/javascript">
	function searchCheck(f){

	if(f.searchColumn.value == "0"){
		alert("검색조건을 선택하세요.");
		return false;
	}	
	
	if(f.searchWord.value==""){
		alert("검색어를 입력하세요.");
		return false;
	}
	document.searchFrm.submit();
} 

</script>
<!-- 파일다운로드 -->

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
                    <h1 class="page-header">회원 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           회원 목록보기                               
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                         <!-- 검색 -->
<div class="row text-left" style="margin-bottom:20px; padding-left:15px;" >
	<form class="form-inline" name="searchFrm" method="post" onsubmit="return searchCheck(this);" action="">
	<div class="form-group">
			<input type="text" style="text-align:center; width:100px;" class="form-control" id="search_sday" name="search_sday" placeholder="시작일자" />
 		- <input type="text" style="text-align:center; width:100px;" class="form-control" id="search_eday" name="search_eday" placeholder="종료일자" />
		</div>
	<div class="input-group" style="padding-left:1px;" >
		<select name="searchColumn" class="form-control">
			<option value="0"> 검색조건 </option> 
			<option value="id" > 아이디 </option> 
			<option value="nickname"> 닉네임 </option> 
			<option value="email"> 이메일 </option> 
		</select>
	</div>	
	<div class="input-group" style="padding-left:1px;">
			<input type="search" name="searchWord" class="form-control" placeholder="검색어를 입력하세요." autofocus />
			<div class="input-group-btn" style="padding-left:2px;">
				<button type="submit" id="btn_search" class="btn btn-default" >
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>		
	</form>
</div>	



						<form name="delfrm" method="post" action="../Member/MemberDelete">
                        	<div class="table-responsive">
                                 	                  	
                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">

                                <thead>
                                    	<!-- 검색창 만들어야함 -->
                                    <tr style="font-weight:bold" >
                                    	<td style="width:30px;">
                                    		<label><input type="checkbox" name="checkAll" /></label>
                                    	</td>
                                    	<td >번호</td>
                                    	<td>아이디</td>
                                    	<td>닉네임</td>
                                    	<td>휴대전화</td>
                                    	<td>이메일</td>
                                    	<td>가입일</td>
                                  	  </tr>
                                </thead>
                                <tbody>
            <!-- 반복시작 -->
			<c:choose>
				<c:when test="${empty lists }">
					<!-- 등록된 게시물이 없을때 -->
					<tr>
						<td colspan="8">
							등록된 게시물이 없습니다.
						</td>
					</tr>				
				</c:when>
				<c:otherwise>
					<!-- 등록된 게시물이 있을때 반복하면서 리스트 출력 -->
					<c:forEach items="${lists }" var="row" varStatus="loop">
						<tr>
							<td>
								<label><input type="checkbox" class="inputchk" name="checkDel" value="${row.member_no },${row.id }"/></label>
							</td>
							<input type="hidden" name="member_no" value="${row.member_no }" />
							<input type="hidden" name="id" value="${row.id }" />	
							<td class="text-center">
								${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }<%-- ${row.member_no} --%>
							</td>
							<td class="text-center" >
								<a href="../Member/MemberView?member_no=${row.member_no }&nowPage=${map.nowPage}" >
									${row.id }</a></td>							
							<td class="text-center">${row.nickname }</td>
							<td class="text-center">${row.phone }</td>
							<td class="text-center">${row.email }</td>
							<td class="text-center">${row.regidate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>			
			</c:choose>	
			<!-- 반복끝 -->
                                </tbody>                                
                                <!-- 페이징처리넣어줘야함  -->
                            </table>  
                           
                            <!-- /.table-responsive -->                            
                        </div>
                        </form>
                        
                        <!-- /.panel-body -->
                    </div>
                    
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row" style="text-align:center;">
                                <p >                                	
	                                <button type="button" id="delUser" class="btn btn-danger">회원삭제</button>
                                </p>
                                
                                <!-- 페이지번호 -->
                                </div>
                                
		<div class="row text-center">
			<ul class="pagination">
				${pagingImg }
			</ul>
		</div>      
                                
					<!-- 리스트 -->
               <!--  <div class="col-lg-6">
                
                    <div class="panel panel-default">
                            </div>
                            /.table-responsive
                        </div> -->
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