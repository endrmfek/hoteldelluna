<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String q_no=request.getParameter("q_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DataTable - Mazer Admin Dashboard</title>
<style>
.mylogo {
	margin-left: 70px;
	padding-top: 35px;
	padding-bottom: 20px;
}

.button4 {
	background-color: white;
	color: rgb(221, 188, 38);
	border: 1px solid #dda937;
	width: 120px;
	height: 50px;
	margin-left: 20px;
	float: right;
}
.button4:hover {
	background-color: #e9c72e;
	color: white;
}
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">

<link rel="stylesheet" href="admin/assets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg"
	type="image/x-icon">
<link rel="stylesheet" href="admin/assets/css/cs_manager_write.css">
<script type="text/javascript">
window.onload=function(){
	document.getElementById('rbtn').onclick=function(){
		//alert('click');
		//필수요소 검사
		if(document.rfrm.info.checked == false){
			alert('동의를 하셔야 합니다.');
			return false;
		}
		if(document.rfrm.q_name.value.trim()== ''){
			alert('글쓴이를 입력하셔야 합니다.');
			return false;
		}
		if(document.rfrm.q_subject.value.trim()== ''){
			alert('제목을 입력하셔야 합니다.');
			return false;
		}
		if(document.rfrm.q_pwd.value.trim()== ''){
			alert('비밀번호를 입력하셔야 합니다.');
			return false;
		}
		document.rfrm.submit();
	};
};
</script>
</head>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="mylogo">
					<a href="index.do"><img src="admin/assets/images/logo/logo.png"
						width="180" height="70"></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
				<div class="sidebar-menu">
					<ul class="menu">
						<li class="sidebar-item active "><a href="index.do"
							class='sidebar-link'> <i class="bi bi-grid-fill"></i> <span>Main</span>
						</a></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>회원
									관리</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="users_manager.do">회원
										관리</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>예약
									관리</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a
									href="reservation_manager.do">예약 관리</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>객실
									관리</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="room_manager.do">객실
										관리</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>게시판
									관리</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="notice_manager.do">Notice</a>
								</li>
								<li class="submenu-item "><a href="faqlist.do">FAQ</a>
								</li>
								<li class="submenu-item "><a href="cs_manager.do">일대일
										문의</a></li>
							</ul></li>
					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>
			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>FAQ Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<div class="con_txt">
								<form action="./faqreply" method="post" name="rfrm">
								<input type="hidden" name="q_no" value="<%=q_no %>"/>
									<div class="contents_sub">
										<!--게시판-->
										<div class="board_write">
											<table>
												<tr>
													<th class="top">글쓴이</th>
													<td class="top" colspan="3"><input type="text"
														name="q_name" value="" class="board_view_input_mail"
														maxlength="5" /></td>
												</tr>
												<tr>
													<th>제목</th>
													<td colspan="3"><input type="text" name="q_subject"
														value="" class="board_view_input" /></td>
												</tr>
												<tr>
													<th>비밀번호</th>
													<td colspan="3"><input type="password" name="q_pwd"
														value="" class="board_view_input_mail" /></td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan="3"><textarea name="q_content"
															class="board_editor_area"></textarea></td>
												</tr>
												<tr>
													<th>이메일</th>
													<td colspan="3"><input type="text" name="mail1"
														value="" class="board_view_input_mail" /> @ <input
														type="text" name="mail2" value=""
														class="board_view_input_mail" /></td>
												</tr>
											</table>

											<table>
												<tr>
													<br />
													<td
														style="text-align: left; border: 1px solid #e0e0e0; background-color: f9f9f9; padding: 5px">
														<div
															style="padding-top: 7px; padding-bottom: 5px; font-weight: bold; padding-left: 7px; font-family: Gulim, Tahoma, verdana;">※
															개인정보 수집 및 이용에 관한 안내</div>
														<div style="padding-left: 10px;">
															<div
																style="width: 97%; height: 95px; font-size: 11px; letter-spacing: -0.1em; border: 1px solid #c5c5c5; background-color: #fff; padding-left: 14px; padding-top: 7px;">
																1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호,
																주소 <br /> 2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통
																경로 확보 <br /> 3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를
																위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br /> 4. 그 밖의 사항은
																개인정보취급방침을 준수합니다.
															</div>
														</div>
														<div
															style="padding-top: 7px; padding-left: 5px; padding-bottom: 7px; font-family: Gulim, Tahoma, verdana;">
															<input type="checkbox" name="info" value="1"
																class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
														</div>
													</td>
												</tr>
											</table>
										</div>

										<div class="btn_area">
											<div class="align_left">
												<input type="button" value="목록" class="btn_list btn_txt02"
													style="cursor: pointer;"
													onclick="location.href='./faqlist.do'" />
											</div>
											<div class="align_right">
												<input type="button" id="rbtn" value="답글쓰기" class="btn_write btn_txt01"
													style="cursor: pointer;" />
											</div>
										</div>
										<!--//게시판-->
									</div>
								</form>
							</div>
							<!-- 하단 디자인 -->
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script src="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="admin/assets/js/bootstrap.bundle.min.js"></script>

	<script src="admin/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	<script src="admin/assets/js/mazer.js"></script>
</body>
</html>