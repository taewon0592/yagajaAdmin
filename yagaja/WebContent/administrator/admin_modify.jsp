<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자등록</title>
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


</head>

<script>

function mValidate(fn) {
	
	if(fn.id.value=="") {
		alert("아이디를 입력해주세요");
		fn.id.focus();
		return false;
	}
	if(fn.nickname.value=="") {
		alert("닉네임을 입력해주세요");
		fn.nickname.focus();
		return false;
	}
	if(fn.pass1.value=="") {
		alert("비밀번호를 입력해주세요");
		fn.pass1.focus();
		return false;
	}
	if(fn.pass2.value=="") {
		alert("비밀번호 확인을 입력해주세요");
		fn.pass2.focus();
		return false;
	}
	if(fn.email1.value=="") {
		alert("이메일을 입력해주세요");
		fn.email1.focus();
		return false;
	}
	if(fn.email2.value=="") {
		alert("이메일을 입력해주세요");
		fn.email2.focus();
		return false;
	}
	
}

</script>

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
	                    <h1 class="page-header">관리자 정보수정</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">

	                        <div class="panel-body">
	                        
	                        	<div class="table-responsive">
	                        	
							       <form class="form-inline" action="../Administrator/AdminJoin" name="memberFrm" method="post" onsubmit="return mValidate(this);">
									
									<div class="form-group">
										<label for="InputId">▶ 관리자 아이디</label><br />
										<input type="text" class="form-control" name="id" id="userid" placeholder="관리자 아이디"  >
											<br />
									</div><br /><br />
									
									<div class="form-group">
										<label for="InputNickname">▶ 닉네임</label><br />
										<input type="nickname" class="form-control" name="nickname" placeholder="닉네임">
									</div><br /><br />
									
									<div class="form-group">
										<label for="InputPassword1">▶ 비밀번호</label><br /> 
										<input type="password" class="form-control" name="pass1" placeholder="비밀번호">
									</div><br /><br />
									
									<div class="form-group"> 
										<label for="InputPassword2">▶ 비밀번호 확인</label><br /> 
										<input type="password" class="form-control" name="pass2" placeholder="비밀번호 확인">
										<p class="help-block">※ 비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
									</div><br /><br />
									
									<div class="form-group">
										<label for="InputPhone">▶ 핸드폰번호</label><br />
										
										<input type="text" class="form-control" name="phone1" style="width:100px"/>&nbsp;&nbsp;-&nbsp;&nbsp;  
										<input type="text" class="form-control" name="phone2" style="width:100px"/>&nbsp;&nbsp;-&nbsp;&nbsp;  
										<input type="text" class="form-control" name="phone3" style="width:100px"/>
									</div><br /><br />
									
									<div class="form-group">
										<label for="InputEmail">▶ 이메일</label><br /> 
										
										<input type="text" class="form-control" name="email1" style="width:160px"/>&nbsp;&nbsp;@&nbsp;&nbsp; 
										<input type="text" class="form-control" name="email2" style="width:160px"/>
										</div><br /><br />
										
										<div class="form-group text-center">
											<button type="submit" class="btn btn-info">
												회원가입<i class="fa fa-check spaceLeft"></i>
											</button>
											<button type="submit" class="btn btn-warning">
												가입취소<i class="fa fa-times spaceLeft"></i>                      
											</button>
										</div>
									</form>
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