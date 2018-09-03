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
    /* $(document).ready(function(){
        $('#checkall').click(function(){
            if($('#checkall').is(':checked')){
                //전체체크
                console.log('1');
                $('input:checkbox[name=all]').prop('checked', true);
            }
            else {
                //전체체크해제
                console.log('2');
                $('input:checkbox[name=all]').prop('checked', false);            
            }
        });
    }); */
    var chkArr = document.getElementsByName("check");
    function allChecked(){
    	for(var i=0 ; i<chkArr.length ; i++){
    		
    		if(chkArr[i].checked==true){
				//체크된 항목이라면 체크해제
				chkArr[i].checked = false;
			}
			else{
				//체크가 안된 항목이라면 체크
				chkArr[i].checked = true;
			}
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
                    <h1 class="page-header">숙박 업소 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           숙박 시설 리스트 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	
                        	<form action="">
	                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
	                                <thead>
	                                <!-- 굵기넣기 -->
	                                    <tr style="font-weight:bold" >
	                                    	<td colspan="2">
	                                    		<button type="button" class="btn btn-info" onclick="location.href='../lodge/lodge_write';">
	                                    			숙박 업소 등록하기
	                                    		</button>
	                                    	</td>
	                                    	<td >숙박 시설 검색</td>
	                                    	<td >
	                                    		<select name="lodge_list" id="">
	                                    			<option value="lodge">모텔</option>
	                                    			<option value="lodge">호텔/리조트</option>
	                                    			<option value="lodge">펜션/풀빌라</option>
	                                    			<option value="lodge">게스트하우스</option>
	                                    		</select>
	                                    	</td>
	                                    	<!-- 검색창 넣어줘야함 뭐로검색할건지 -->
	                                    	<td colspan="3"><input type="text" name="search_lodge" /><button type="button" class="btn btn-success">검색</button></td>
	                                    	<td>
	                                    		<button type="button" class="btn btn-danger" onclick="location.href='../lodge/lodge_delete?lodge_no=${row.lodge_no }&mode=delete&nowPage=${map.nowPage }';">삭제</button>
	                                    		<button type="button" class="btn btn-waring" onclick="allChecked()">
	                                        		전체선택
	                                        	</button></td>
	                                  	  </tr>
	                                </thead>
							</form>
                                <tbody>
                                
                                	<tr style="font-weight:bold">
                                        <td>번호</td>
                                        <td>숙박타입</td>
                                        <td colspan="2" >숙소명</td>
                                        <td>숙소주소</td>
                                        <td>숙소번호</td>
                                        <td>방개수</td>
                                      	<td>선택</td>
                                    </tr>
                                    <tr class="odd gradeX">
										<c:choose>
		                                	<c:when test="${empty lists }">
		                                		<tr>
		                                			<td colspan="8">
		                                				등록된 글이 없습니다.
		                                			</td>
		                                		</tr>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:forEach items="${lists }" var="row" varStatus="loop">
			                                        <td>${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }</td>
			                                        <td>${row.lodge_type }</td>
			                                        <td colspan="2"><a href="./lodge_view?lodge_no=${row.lodge_no }&nowPage=${map.nowPage}" style="color:black;">${row.lodge_name }</a></td>
			                                       
			                                        <td class="center">${row.ADDR_common }</td>
			                                        <td class="center">${row.lodge_tel }</td>
			                                        <td class="center">${row.lodge_roomcount }</td>
			                                        <td><input type="checkbox" name="check"/></td>
		                                		
			                                    </tr>
		                                		</c:forEach>
		                                	</c:otherwise>
		                               	</c:choose>
                                   <!-- <tr class="even gradeC">
                                         <td>2</td>
                                        <td>호텔</td>
                                        <td colspan="2">요요요요요요요요</td>
                                        <td class="center">주소</td>
                                        <td class="center">02-111-1111</td>
                                        <td class="center">20</td>
                                        <td><input type="checkbox" name="check"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>3</td>
                                        <td>호텔</td>
                                        <td colspan="2">요요요요요요요요</td>
                                        <td class="center">주소</td>
                                        <td class="center">02-111-1111</td>
                                        <td class="center">20</td>
                                         <td><input type="checkbox" name="check"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>4</td>
                                        <td>호텔</td>
                                        <td colspan="2">요요요요요요요요</td>
                                        <td class="center">주소</td>
                                        <td class="center">02-111-1111</td>
                                        <td class="center">20</td>
                                         <td><input type="checkbox" name="check"/></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>5</td>
                                        <td>호텔</td>
                                        <td colspan="2">요요요요요요요요</td>
                                        <td class="center">주소</td>
                                        <td class="center">02-111-1111</td>
                                        <td class="center">20</td>
                                        <td><input type="checkbox" name="check"/></td>
                                    </tr> -->
                                  
                                </tbody>
                            </table>
                            
                            <div class="row text-center">
								<ul class="pagination">
									${pagingImg }
									<!-- <li><span class="glyphicon glyphicon-fast-backward"></span></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><span class="glyphicon glyphicon-fast-forward"></span></li> -->
								</ul>
							
                            <!-- /.table-responsive -->
                            
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