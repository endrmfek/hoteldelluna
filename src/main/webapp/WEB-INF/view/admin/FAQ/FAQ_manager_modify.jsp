
<%@page import="com.hoteldelluna.web.entity.FAQTO"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");

	FAQTO to = (FAQTO)request.getAttribute("to");
	String q_no = to.getQ_no();
	String q_subject = to.getQ_subject();
	String q_name = to.getQ_name();
	String q_content = to.getQ_content();
	
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
	window.onload = function() {
		document.getElementById( 'mbtn' ).onclick = function() {
			if( document.mfrm.q_subject.value.trim() == '' ) {
				alert( '????????? ??????????????? ?????????.' );
				return false;
			}
			if( document.mfrm.q_pwd.value.trim() == '' ) {
				alert( '??????????????? ??????????????? ?????????.' );
				return false;
			}
			document.mfrm.submit();
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
						<li class="sidebar-item  has-sub"><a href="./users_manager.do"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>??????
									??????</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="users_manager.do">??????
										??????</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="./reservation_manager.do"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>??????
									??????</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a
									href="reservation_manager.do">?????? ??????</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="./room_manager.do"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>??????
									??????</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="room_manager.do">??????
										??????</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>?????????
									??????</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="notice_manager.do">Notice</a>
								</li>
								<li class="submenu-item "><a href="faqlist.do">FAQ</a>
								</li>
								<li class="submenu-item "><a href="cs_manager.do">?????????
										??????</a></li>
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
								<form action="faqmodify" method="post" name="mfrm">
								<input type="hidden" name="action" value="modify_ok"/>
								<input type="hidden" name="q_no" value="<%=q_no %>"/>
									<div class="contents_sub">
										<!--?????????-->
										<div class="board_write">
											<table>
												<tr>
													<th class="top">?????????</th>
													<td class="top" colspan="3"><input type="text"
														name="q_name" value="admin" class="board_view_input_mail"
														maxlength="5" readonly /></td>
												</tr>
												<tr>
													<th>??????</th>
													<td colspan="3"><input type="text" name="q_subject"
														value="<%=q_subject %>" class="board_view_input" /></td>
												</tr>
												<tr>
													<th>????????????</th>
													<td colspan="3"><input type="password" name="q_pwd"
														value="" class="board_view_input_mail" /></td>
												</tr>
												<tr>
													<th>??????</th>
													<td colspan="3"><textarea name="q_content"
															class="board_editor_area"><%=q_content %></textarea></td>
												</tr>
											</table>
										</div>

										<div class="btn_area">
											<div class="align_left">
												<input type="button" value="??????" class="btn_list btn_txt02"
													style="cursor: pointer;"
													onclick="location.href='faqlist'" /> <input
													type="button" value="??????" class="btn_list btn_txt02"
													style="cursor: pointer;"
													onclick="location.href='faqview?q_no=<%=q_no %>'" />
											</div>
											<div class="align_right">
												<input type="submit" id="mbtn" value="??????" class="btn_write btn_txt01"
													style="cursor: pointer;" />
											</div>
										</div>
										<!--//?????????-->
									</div>
								</form>
							</div>
							<!-- ?????? ????????? -->
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