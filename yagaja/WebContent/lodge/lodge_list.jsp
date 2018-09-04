<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숙박 업소 목록</title>
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
         alert("삭제할 시설을 선택해 주세요.");
         return false;
      }
      
      var chk=confirm("삭제하시겠습니까?");
      if(chk){
         
         document.delfrm.action="../lodge/lodge_delete";
         document.delfrm.submit();
         alert("삭제 완료 되었습니다.");
      }
      else{
         alert("삭제 취소 되었습니다.");
         return false;
      }         
   });
});


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
                    <h1 class="page-header">숙박 업소 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">	
                        
                        <!-- 검색기능 -->
                        	<div class="row text-left"
								style="margin-bottom: 20px; padding-left: 15px;">
								<form class="form-inline" name="searchFrm" method="post" action="" onsubmit="return searchCheck(this);">
									<div class="form-group" style="padding-left: 1px;">
										<select name="searchColumn" class="form-control">
											<option value="direct_input">검색조건</option>
											<option value="lodge_type">숙소종류</option>
											<option value="lodge_name">숙소명</option>
											<option value="addr_common">숙소주소</option>
										</select>
									</div>
									<div class="input-group" style="padding-left: 1px;">
										<input type="search" name="searchWord" class="form-control" placeholder="검색어를 입력하세요." autofocus />
										<div class="input-group-btn" style="padding-left: 2px;">
											<button type="submit" id="btn_search" class="btn btn-default">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
                           
                           
                               <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
                                   <thead>
                                   </thead>
                     
                     <form name="delfrm" method="post">
                                <tbody>
                                
                                   <tr style="font-weight:bold;">
                                      <td style="width:50px; vertical-align:middle;">
                                          <label><input type="checkbox" name="checkAll" /></label>
                                       </td>
                                        <td style="vertical-align:middle;">번호</td>
                                        <td style="vertical-align:middle;">숙소종류</td>
                                        <td colspan="2" style="vertical-align:middle;">숙소명</td>
                                        <td style="vertical-align:middle;">숙소주소</td>
                                        <td style="vertical-align:middle;">숙소번호</td>
                                        <td style="vertical-align:middle;">방개수</td>                                         
                                    </tr>
                                    <tr class="odd gradeX">
                              <c:choose>
                                         <c:when test="${empty lists }">
                                            <tr>
                                               <td colspan="8" style="vertical-align:middle;">
                                                  등록된 글이 없습니다.
                                               </td>
                                            </tr>
                                         </c:when>
                                         <c:otherwise>
                                            <c:forEach items="${lists }" var="row" varStatus="loop">
                                               <td style="vertical-align:middle;">
                        							<label><input type="checkbox" class="inputchk" name="checkDel" value="${row.lodge_no}"/></label>
							                     </td>
							                     <input type="hidden" name="lodge_no" value="${row.lodge_no }" />
                                                 <td style="vertical-align:middle;">${map.totalCount - (((map.nowPage -1) * map.pageSize) + loop.index) }</td>
                                                 <td style="vertical-align:middle;">${row.lodge_type }</td>
                                                 <td colspan="2" style="vertical-align:middle;"><a href="./lodge_view?lodge_no=${row.lodge_no }&nowPage=${map.nowPage}" style="color:black;">${row.lodge_name }</a></td>
                                                
                                                 <td class="center" style="vertical-align:middle;">${row.addr_common }</td>
                                                 <td class="center" style="vertical-align:middle;">${row.lodge_tel }</td>
                                                 <td class="center" style="vertical-align:middle;">${row.lodge_roomcount }</td>
                                                 
                                            
                                             </tr>
                                            </c:forEach>
                                         </c:otherwise>
                                        </c:choose>     
                                </tbody>
                                </form>
                            </table>
                             <button type="button" id="delUser" class="btn btn-danger">
                             	<i class="glyphicon glyphicon-trash"></i>&nbsp;삭제하기
                             </button>
                             <button type="button" class="btn btn-info" onclick="location.href='../lodge/lodge_write';">
                             	<i class="glyphicon glyphicon-pencil"></i>&nbsp;등록하기
                             </button>
	                       <!-- /.panel-body -->
	                   </div>
	                   <!-- /.panel -->	
	               </div>
	               <!-- /.col-lg-12 -->
	           </div>           
	           <!-- /.row -->
	        </div>
	          <div class="row text-center">
                 <ul class="pagination">
                    ${pagingImg }

                 </ul>
     		 </div>
	    <!-- /pageWrapper -->
	    </div>
	  <!-- /#wrapper --> 
    </div>

    

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