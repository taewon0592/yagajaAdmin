<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지 첫화면</title>
<!-- yagaja 파비콘 -->
<LINK href="https://yaimg.yanolja.com/joy/pw/favicon/favicon_32x32.ico" rel="shortcut icon" type="image/x-icon" >
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
</head>

<script>

function mValidate(fn) {
	
	if(fn.id.value=="") {
		alert("아이디를 입력해주세요");
		fn.id.focus();
		return false;
	}
	if(fn.pass.value=="") { 
		alert("패스워드를 입력해주세요");
		fn.pass.focus();
		return false;
	}
}

$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#id_save").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#id_save").change(function(){ // 체크박스에 변화가 있다면,
        if($("#id_save").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#id_save").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

<body>
   <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <a class="navbar-brand" href="../Ex/main.jsp"><img src="../images/yagaja.png" alt="YAGAJA" style="width:110px;" /></a>
                    <br /><br /><br />
                    <div class="panel-heading">
                        <h3 class="panel-title">관리자 로그인</h3>
                    </div>
                   
                    <div class="panel-body">
                        <form action="../Administrator/AdminLogin" method="post" name="loginFrm" onsubmit="return mValidate(this);">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" name="id" id="userid" type="text" value="" placeholder="관리자아이디" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="pass" id="userpass" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
										<input id="id_save" name="id_save" type="checkbox" value="" checked="" />아이디 저장			
                                    </label>
                                </div>
                                

                                <button type="submit" class="btn btn-lg btn-success btn-block">LOGIN</button>
                                <!-- <a href="../administrator/admin_join.jsp" class="btn btn-lg btn-primary btn-block">관리자등록</a> -->
                                
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>