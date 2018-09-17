<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
						<!-- 	
							<div class="input-group custom-search-form">
							
							서치폼안에 어떤걸 검색할건지 셀렉트로 분류넣어줘야함
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div> -->
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="../Ex/lodge_list.jsp"><i class="fa fa-dashboard fa-fw"></i> 숙박 업소 관리<span class="fa arrow"></a>
                             <ul class="nav nav-second-level">
                                <li>
                                    <a href="../lodge/lodge_write">숙박 업소 등록</a>
                                </li>
                                <li>
                                    <a href="../lodge/lodge_list">숙박 업소 목록</a>
                                </li>
                                <li>
                                    <a href="../lodge/registWrite">주변시설 등록</a>                               
                                </li>
                                <li>
                                    <a href="../lodge/registList">주변시설 리스트</a>                               
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>예약 및 결제 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="../Reservation/ReservationList">예약 및 결제 목록</a>
                                </li>
                                <li>
                                    <a href="../Reservation/ReservationCancleList">예약 취소 목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> 회원관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="../Member/MemberList">회원목록</a>
                                </li>
                                <li>
                                    <a href="../Member/LeaveMemberList">탈퇴회원</a>
                                </li>
                                <li>
                                    <a href="../member/terms_and_conditions.jsp">약관동의</a>
                                </li>
                            </ul>
                        </li>                      
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 경매관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="../Yagaja/AuctionWrite">경매등록</a>
                                </li>
                                <li>
                                    <a href="../Yagaja/AuctionList?mode=1">등록된 경매목록</a>
                                </li>
                                <li>
                                    <a href="../Yagaja/Auction_EndList?mode=0">마감된 경매목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 핫딜관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="../HotDeal/HotDealWrite">핫딜 등록</a>
                                </li>
                                <li>
                                    <a href="../HotDeal/HotDealList">진행중 핫딜목록</a>
                                </li>
                                <li>
                                    <a href="../HotDeal/HotDealEndList?mode=0">마감된 핫딜목록</a>
                                </li>
                                 <!--
    								드롭다운안의 드롭다운                             
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    
                                  
 	                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul> 
                                </li>
                                   //end of .nav-third-level
                                    -->
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="../notice/notice_list.jsp"><i class="fa fa-files-o fa-fw"></i>공지사항<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href="../Notice/NoticeList">공지사항목록</a>
                                </li>
                                <li>
                                    <a href="../notice/notice_write.jsp">공지사항등록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <!-- <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>실시간채팅관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">뭐가</a>
                                </li>
                                <li>
                                    <a href="#">들어가야할까?</a>
                                </li>
                            </ul>
                            /.nav-second-level
                        </li> -->
                        <!-- 
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>관리자설정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="../administrator/admin_join.jsp">관리자등록</a>
                                </li>
                                <li>
                                    <a href="../administrator/admin_modify.jsp">관리자수정</a>
                                </li>
                                <li>
                                    <a href="../">로그인</a>
                                </li>
                            </ul>
                            /.nav-second-level
                        </li> 
                        -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
