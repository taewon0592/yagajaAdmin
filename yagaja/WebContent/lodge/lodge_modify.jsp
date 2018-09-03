<%@page import="model.LodgeDAO"%>
<%@page import="model.LodgeDTO"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
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
            	fn.addr_zipcode.value = data.zonecode; //우편번호
            	fn.addr_common.value = data.address; //기본주소
            	fn.addr_detail.focus(); //상세주수로 포커스 이동
        	}
    	}).open();	
}
</script>

<%
String lodge_no = request.getParameter("lodge_no");

LodgeDAO dao = new LodgeDAO();
LodgeDTO dto = new LodgeDTO();
dto = dao.selectView(lodge_no);

//String lodge_thema =  request.getParameter("lodge_thema");
String lodge_thema = dto.getLodge_thema();
String lodge_feature = dto.getLodge_feature();
String lodge_type = dto.getLodge_type();


String chk1 = "";
String chk2 = "";
String chk3 = "";
String chk4 = "";
String chk5 = "";
String chk6 = "";
String chk7 = "";
String chk8 = "";
String chk9 = "";
String chk10 = "";
String chk11 = "";
String chk12 = "";
String chk13 = "";
String chk14 = "";
String chk15 = "";
String chk16 = "";
String chk17 = "";
String chk18 = "";
String chk19 = "";
String chk20 = "";

String[] iArr = lodge_thema.split(",");

for(String s : iArr){
	
   if(s.equals("주차기능")){
       chk1 = "checked";
   }
   else if(s.equals("커플PC")){
       chk2 = "checked";
   }
   else if(s.equals("객실금연")){
       chk3 = "checked";
   }
   else if(s.equals("이벤트가능")){
       chk4 = "checked";
   }
   else if(s.equals("스낵바")){
       chk5 = "checked";
   }   
   else if(s.equals("조식가능")){
       chk6 = "checked";
   }   
   else if(s.equals("무료세탁")){
       chk7 = "checked";
   }   
   else if(s.equals("픽업가능")){
       chk8 = "checked";
   }   
   else if(s.equals("트윈베드")){
       chk9 = "checked";
   }   
   else if(s.equals("야외테라스")){
       chk10 = "checked";
   }   
   else if(s.equals("무인텔")){
       chk11 = "checked";
   }   
   else if(s.equals("안마의자")){
       chk12 = "checked";
   }   
   else if(s.equals("무료영화")){
       chk13 = "checked";
   }   
   else if(s.equals("게임기")){
       chk14 = "checked";
   }   
   else if(s.equals("파티가능")){
       chk15 = "checked";
   }   
   else if(s.equals("상비약")){
       chk16 = "checked";
   }   
} 


String[] iArr2 = lodge_feature.split(",");

for(String s : iArr2){
	
   if(s.equals("최저가보상")){
       chk17 = "checked";
   }
   else if(s.equals("몰카예방")){
       chk18 = "checked";
   }
   else if(s.equals("현장적립")){
       chk19 = "checked";
   }
   else if(s.equals("좋은숙박 BEST100")){
       chk20 = "checked";
   }
}
%>
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
                        	<form action="<c:url value="../lodge/lodge_modify" />" name="writeFrm" method="post" enctype="multipart/form-data" >
                        		<input type="hid den" name="lodge_no" value="<%=lodge_no %>" />
                        		<input type="hid den" name="nowPage"  value="<%=lodge_type%>"/>
                        		<input type="hid den" name="h_lodge_thema"  value="<%=lodge_thema%>"/>
                        		<input type="hid den" name="originalfile" value="${dto.lodge_photo }" />
	                        	<table class="table table-striped table-bordered table-hover center" style=" width:100%; ">
	                        		<tr class="even gradeC">
		                        		<td colspan="2">
		                        			<h4><b>숙소 등록</b></h4>
		                        		</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; width:20%; font-size:1.2em; text-align:center;">숙소명</td>
		                        		<td style="width:60%;">
											<input type="text" style="width:300px; text-align:left;" name="lodge_name"  value="${dto.lodge_name }"/>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td  style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙박업소 종류</td>
		                        		<td >
                        					<input type="radio" name="lodge_type"  value="모텔" <%if("모텔".equals(lodge_type)){%>checked<%} %>  />모텔&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="호텔/리조트" <%if("호텔/리조트".equals(lodge_type)){%>checked<%} %> />호텔/리조트&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="펜션/풀빌라"  <%if("펜션/풀빌라".equals(lodge_type)){%>checked<%} %> />펜션/풀빌라&nbsp;&nbsp;&nbsp;
					                     	<input type="radio" name="lodge_type"  value="게스트하우스" <%if("게스트하우스".equals(lodge_type)){%>checked<%} %> />게스트하우스 
		                        		</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소주소</td>
		                        		
	                        			<td>
										<!-- 우편번호 -->
										<input type="text" name="addr_zipcode" value=""  class="join_input" style="width:100px;" />
										<a href="javascript:;" title="새 창으로 열림" style="color:black;" onclick="zipcodeFind();" onkeypress="">[우편번호검색]</a>
										<br/>
										<!-- 주소 -->
										<input type="text" name="addr_common" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
										<input type="text" name="addr_detail" value=""  class="join_input" style="width:550px; margin-top:5px;" />
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">전화번호</td>
  										<td style="text-align:left;"><input type="text" name="tel1" maxlength="3"  value="${tel1 }" class="join_input" style="width:80px;" />&nbsp;&nbsp; - &nbsp;&nbsp;<input type="text" name="tel2" maxlength="4" value="${tel2 }" class="join_input" style="width:80px;" />&nbsp;&nbsp; - &nbsp;&nbsp;<input type="text" name="tel3"  maxlength="4" value="${tel3 }" class="join_input" style="width:80px;" /></td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">룸 개수</td>
	                        			<td>
											<input name="lodge_roomcount" value="${dto.lodge_roomcount }" type="text" style="width:60px;"/>&nbsp;개
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">태그</td>
  										<td style="text-align:left;">
  											<input name="lodge_tag" type="text" value="${dto.lodge_tag }" style="width:300px;" />
  											
  										</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">룸 테마</td>
	                        			<td>
											<input type="checkbox" class="list-etc"    name="lodge_thema" value="주차기능" <%=chk1 %> />주차기능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="커플PC" <%=chk2 %>/>커플PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="객실금연" <%=chk3 %>/>객실금연&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="이벤트가능" <%=chk4 %>/>이벤트가능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="스낵바" <%=chk5 %>/>스낵바&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="조식가능" <%=chk6 %>/>조식가능&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="무료세탁" <%=chk7 %>/>무료세탁&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="픽업가능" <%=chk8 %>/>픽업가능	
					                  	 	<br />
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="트윈베드" <%=chk9 %>/>트윈베드&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="야외테라스" <%=chk10 %>/>야외테라스&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="무인텔" <%=chk11 %>/>무인텔&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="안마의자" <%=chk12 %>/>안마의자&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="무료영화" <%=chk13 %>/>무료영화&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="게임기" <%=chk14 %>/>게임기&nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="파티가능" <%=chk15 %>/>파티가능 &nbsp;&nbsp;&nbsp;	
					                  	 	<input type="checkbox" class="list-etc"    name="lodge_thema" value="상비약" <%=chk16 %>/>상비약&nbsp;&nbsp;&nbsp;		
		                  	 		
										</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소 특징</td>
  										<td style="text-align:left;">
  											<input type="checkbox" name="lodge_feature" value="최저가보상" <%=chk17 %>/>최저가보상	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="몰카예방" <%=chk18 %>/>몰카예방	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="현장적립" <%=chk19 %>/>현장적립	&nbsp;&nbsp;&nbsp;
					                  	 	<input type="checkbox" name="lodge_feature" value="좋은숙박 BEST100" <%=chk20 %>/>좋은숙박 BEST100
  										</td>
		                        	</tr>
		                        	<tr class="odd gradeX">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">숙소 정보</td>
		                        		<td>
		                        			<textarea name="lodge_note" id="" cols="70" rows="10">${dto.lodge_note }</textarea>
		                        		</td>
		                        	</tr>
		                        	<tr class="even gradeC">
		                        		<td style="font-weight:bold; vertical-align:middle; font-size:1.2em; width:20%; text-align:center;">
		                        			숙소 대표사진
		                        		</td>
		                        		<td>
		                        			<input type="file" name="lodge_photo" value="${dto.lodge_photo }"/>
		                        		</td>
		                        	</tr>
                        		</table>
                        		<button type="submit" class="btn btn-info">수정 완료</button>
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