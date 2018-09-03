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

<!-- 전체선택체크되면 체크박스 모두 체크되기 -->
<script type="text/javascript">
    $(document).ready(function(){
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
    });
</script>
</head>

<%
String nowPage = request.getParameter("nowPage");
%>
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
                        <div class="panel-heading">
                           공지사항 리스트 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="table-responsive">
                        	
                            <table width="100%" class="table table-striped table-bordered table-hover center" style="text-align:center;">
                                <thead>
                                <!-- 굵기넣기 -->
                                    <tr style="font-weight:bold" >
                                    	<td style="vertical-align: middle;">
                                    		<button type="submit" class="btn btn-info" onclick="location.href='../notice/notice_write.jsp';">
                                    			공지사항 등록하기
                                    		</button>
                                    	</td>
                                    	
                                    	<td colspan="3" >


												<div class="row text-right"
													style="padding-right:30px; padding-top:10px; ">
													<!-- 검색부분 -->
													<form class="form-inline" >
														<div class="form-group" >
															<select name="searchColumn" class="form-control">
																<option value="notice_title">제목</option>
																<option value="notice_contents">내용</option>
															</select>
														</div>
														<div class="input-group">
															<input type="text" name="searchWord" class="form-control" />
															<div class="input-group-btn">
																<button type="submit" class="btn btn-default">
																	<i class="glyphicon glyphicon-search"></i>
																</button>
															</div>
														</div>
													</form>
												</div>

										</td>

                                    	
                                    	<td>삭제<br />
                                    		<button type="submit" class="btn btn-waring">
                                        		전체선택
                                        	</button>
                                        </td>
                                  	  </tr>
                                </thead>
                                <tbody>
                                	<tr style="font-weight:bold">
                                        <td style="width:15%;">번호</td>
                                        <td>제목</td>
                                        <td style="width:15%;">작성자</td>
                                        <td style="width:15%;">작성일</td>
                                      	<td style="width:10%;">선택</td>
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
						<td class="text-center">${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }
						</td>
						<td class="text-left"><a
							href="../Notice/NoticeView?notice_no=${row.notice_no }&nowPage=${param.nowPage }">
								${row.notice_title } </a></td>
						<td class="text-center">${row.notice_name }</td>
						<td class="text-center">${row.notice_regidate }</td>
						<td><input type="checkbox" name="check"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

                              
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
							
							</div>
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
            <div class="row">
                <div class="col-lg-12">
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