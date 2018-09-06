<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>  
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
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

<%
String nowPage = request.getParameter("nowPage");
%>
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

////////////////////////////////////////////////////////체크박스 회원 삭제 경고창
$(function(){
	$("#NoticeDel").click(function(){
		var selectedCheck = new Array();
		$('.inputchk:checked').each(function(){
			selectedCheck.push(this.value);
		});
		
		if(selectedCheck.length<1){
			alert("삭제할 공지사항을 선택해 주세요.");
			return false;
		}
		
		var chk=confirm("삭제하시겠습니까?");
		if(chk){
			
			document.delfrm.submit();

		}
		else{
			alert("공지사항 삭제를 실패했습니다.");
			return false;
		}	
		
	});
});

<script type="text/javascript">

function searchCheck(f){
	if(f.searchColumn.value=="0"){
		alert("검색조건을 선택하세요");
		return false;
	}
	if(f.searchWord.value==""){
		alert("검색어를 입력하세요");
		return false;
	}
	document.searchFrm.submit();
}

</script>

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
                    <h1 class="page-header">공지사항 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
 	                        <form class="form-inline" name="searchFrm" method="post" onsubmit="return searchCheck(this);" >
			                     <div class="form-group" style="padding-bottom:15px">
			                        <select name="searchColumn" class="form-control">
			                           <option value="0">검색조건</option>
			                           <option value="notice_title">제목</option>
			                           <option value="notice_contents">내용</option>
			                        </select>
			                     </div>
			                     <div class="input-group" style="padding-bottom:15px">
			                        <input type="search" name="searchWord" class="form-control" placeholder="검색어를 입력하세요" autofocus />
			                        <div class="input-group-btn" style="padding-left:2px;">
			                           <button type="submit" class="btn btn-default" id="btn_search">
			                              <i class="glyphicon glyphicon-search">
			                              </i>                           
			                           </button>
			                        </div>
			                     </div>
	                  		</form>

                        	<form action="../Notice/NoticeDelete?nowPage=${map.nowPage }" name="delfrm" method="post">
                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
                                <tbody>
                                	<tr style="font-weight:bold">
                                		<td style="width:10%;"><input type="checkbox" name="checkAll"/></td>
                                        <td style="width:10%;">번호</td>
                                        <td style="width:40%;">제목</td>
                                        <td style="width:15%;">작성자</td>
                                        <td style="width:15%;">작성일</td>
                                      	
                                    </tr>
		<c:choose>
			<c:when test="${empty lists }">
				<!-- 등록된 게시물이 없을때... -->
				<tr>
					<td colspan="5">등록된 글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
				<c:forEach items="${lists }" var="row" varStatus="loop">
					<tr>
						<td><input type="checkbox" class="inputchk" name="checkDel" value="${row.notice_no }"/></td>
						<td class="text-center">${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }
						</td>
						<td class="text-left"><a
							href="../Notice/NoticeView?notice_no=${row.notice_no }&nowPage=${param.nowPage }">
								${row.notice_title } </a></td>
						<td class="text-center">${row.notice_name }</td>
						<td class="text-center">${row.notice_regidate }</td>	
					</tr>	
				</c:forEach>
			</c:otherwise>
		</c:choose>
                                </tbody>
                            </table> 
                            <!-- /.table-responsive -->

					<button type="button" class="btn btn-info" onclick="location.href='../notice/notice_write.jsp';">
              			<i class="glyphicon glyphicon-pencil"></i>&nbsp;등록하기
              		</button>&nbsp;&nbsp;
              		
			<c:choose>
				<c:when test="${empty lists }">
				</c:when>
				<c:otherwise>              		
              		<button type="button" id="NoticeDel" class="btn btn-danger" >
              			<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
              		</button>
				</c:otherwise>
			</c:choose>   
										</form>           		
                        <!-- /.panel-body -->
                    </div>
                    
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
               	<!-- 페이지번호 -->
				<div class="row text-center"> 
					<ul class="pagination">
						${pagingImg }
					</ul>
				</div>
            </div>
            <!-- /.row -->
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