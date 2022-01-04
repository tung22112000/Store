<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Quản lý hóa đơn</title>
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sb-admin-2.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.css" />"
	rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function() {
		$("input[value='hien']").click(function() {
			$("#div1").show();
			$("#div2").hide();
		})
		$("input[value='an']").click(function() {
			$("#div1").hide();
			$("#div2").show();
		})
	})
</script>
<script>
	$(document).ready(function() {
		$('#div2').hide();
	})
</script>
</head>
<body id="page-top">

	<input type="radio" name="abc" value="hien" checked> Tìm kiếm
	theo ngày bắt đầu và ngày kết thúc
	<input type="radio" name="abc" value="an"> Tìm kiếm theo ngày
	giờ

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/user/searchUser" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tài khoản hoặc số điện thoại"
						aria-label="Search">
				</div>
				<div class="col-sm">

					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
				</div>
			</div>
		</form:form>
	</div>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Quản lý người
					dùng</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Xem</th>
								<th>Mã HĐ</th>
								<th>Tên</th>
								<th>Ngày tạo</th>
								<th>Địa chỉ</th>
								<th>Email</th>
								<th>Trạng thái</th>
								<sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
									<th>Cập nhật</th>
									<th>Xóa</th>
								</sec:authorize>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orders.getContent()}" var="order">
					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/order/getOrder/${order.id}?mode=VIEW' />"><i
								class="fas fa-eye"></i></a></td>
						<td style="text-align: center">${order.id }</td>
						<td>${order.customer.lastName}${order.customer.firstName}</td>
						<td><fmt:formatDate type="date" value="${order.orderDate}" /></td>
						<td>${order.customer.street},${order.customer.district},
							${order.customer.city}</td>
						<td>${order.customer.email}</td>
						<td><c:if test="${order.status == 0}">
								<p>
									Đang chờ xử lý
								<p>
							</c:if> <c:if test="${order.status == 1}">
								<p>
									Đang xử lý
								<p>
							</c:if> <c:if test="${order.status == 2}">
								<p>
									Đã xử lý
								<p>
							</c:if><c:if test="${order.status == 3}">
								<p>
									Đã hoàn thành
								<p>
							</c:if></td>

						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">

							<td style="text-align: center"><a
								href="<c:url value='/admin/order/getOrder/${order.id}?mode=EDIT' />"><i
									class="far fa-edit"></a></td>
									</sec:authorize>
									<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
							<td style="text-align: center"><a
								href="<c:url value='/admin/order/deleteOrder/${order.id}' />">
									<i class="fas fa-trash-alt"></i>
							</a></td>
						</sec:authorize>
					</tr>
					</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
					<a href="<c:url value='/admin/user/addUser' />"><i
						class="far fa-plus-square"></i> Thêm người dùng mới</a>
				</sec:authorize>

				<br> <br>
				<c:if test="${users.totalPages > 0}">
					<util:pagination currentPage="${currentPage}"
						showPageTitle="Sô người dùng / Trang" thispage="${users}"></util:pagination>
				</c:if>
				<br />
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->



	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>
	<script src="<c:url value="/resources/js/sb-admin-2.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js" />"></script>
	<script src="<c:url value="/resources/js/demo/datatables-demo.js" />"></script>
</body>
</html>