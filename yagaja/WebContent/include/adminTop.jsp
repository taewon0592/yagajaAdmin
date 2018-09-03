<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="../Ex/index.jsp"><img src="../images/yagaja.png" alt="YAGAJA" style="width:110px;"/></a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-left">
	<li><a class="navbar-brand" href="../lodge/lodge_list.jsp">시설관리</a></li>
	<li><a class="navbar-brand" href="../reservation/reser_list.jsp">예약결제관리</a></li>
	<li><a class="navbar-brand" href="../Member/MemberList">회원관리</a></li>
	<li><a class="navbar-brand" href="#">통계관리</a></li>
	<li><a class="navbar-brand" href="../auction/auction_list.jsp">경매관리</a></li>
	<li><a class="navbar-brand" href="../hotdeal/hotdeal_list.jsp">핫딜관리</a></li>
	
</ul>


<ul class="nav navbar-top-links navbar-right">
	<li>
		<span style="font-weight:bold; color:#333;">
			${nickname }님,
		</span>반갑습니다^ㅡ^
	</li>
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">공지사항
		  <i class="glyphicon glyphicon-bullhorn"></i>
		</a>
		<ul class="dropdown-menu dropdown-messages">
            <li>
                <a href="../Notice/NoticeList">
                    <div style="text-align:center;">
                        <strong>공지내용</strong>
                       <!--  <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span> -->
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div style="text-align:center;">
                        <strong>자주 묻는 질문/답변</strong>
                        <!-- <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span> -->
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div style="text-align:center;">
                        <strong>Q & A</strong>
                        <!-- <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span> -->
                    </div>
                </a>
            </li>
        </ul>
	</li>
	<li>
		<a href="">실시간채팅   <i class="fa fa-bell-o"></i> </a>
	</li>
	<li>
		<a href="../Administrator/AdminLogout">로그아웃<i class="glyphicon glyphicon-log-out"></i> </a>
	</li>
 <!-- <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-messages">
            <li>
                <a href="#">
                    <div>
                        <strong>John Smith</strong>
                        <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <strong>John Smith</strong>
                        <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <strong>John Smith</strong>
                        <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>Read All Messages</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        /.dropdown-messages
    </li>
    /.dropdown
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-tasks">
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 1</strong>
                            <span class="pull-right text-muted">40% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                <span class="sr-only">40% Complete (success)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 2</strong>
                            <span class="pull-right text-muted">20% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                <span class="sr-only">20% Complete</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 3</strong>
                            <span class="pull-right text-muted">60% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                <span class="sr-only">60% Complete (warning)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 4</strong>
                            <span class="pull-right text-muted">80% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="sr-only">80% Complete (danger)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>See All Tasks</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        /.dropdown-tasks
    </li>
    /.dropdown
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-alerts">
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-comment fa-fw"></i> New Comment
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                        <span class="pull-right text-muted small">12 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-tasks fa-fw"></i> New Task
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>See All Alerts</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        /.dropdown-alerts
    </li>
    /.dropdown
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">설정
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">
            <li><a href="#"><i class="fa fa-user fa-fw"></i> 관리자 로그인</a>
            </li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
            </li>
                        <li class="divider"></li>
            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
            </li>
        </ul>
        /.dropdown-user
    </li>
    /.dropdown  -->
</ul>
