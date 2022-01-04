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
<title>Quản lý khách hàng</title>
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
</head>
<body id="page-top">
	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/user/searchCustomer" />
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
				<h6 class="m-0 font-weight-bold text-primary">Quản lý khách hàng</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Xem</th>
								<th>Tên khách hàng</th>
								<th>Email</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
									<th>Cập nhật</th>
									<th>Xóa</th>
								</sec:authorize>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customers.getContent()}" var="customer">
								<tr>
									<td><a
										href="<c:url value='/admin/user/getCustomer/${customer.id}?mode=VIEW' />"><i
											class="fas fa-eye"></a></td>
									<td>${customer.lastName}${customer.firstName}</td>
									<td>${customer.email}</td>
									<td>${customer.numberPhone}</td>
									<td>${customer.street}, ${customer.district}, ${customer.city}</td>
									<sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
										<td><a
											href="<c:url value='/admin/user/getCustomer/${customer.id}?mode=EDIT' />"><i
												class="fas fa-user-edit"></i></a></td>
										<td><a
											href="<c:url value='/admin/user/deleteCustomer/${customer.id}' />"><i
												class="fas fa-trash-alt"></i></a></td>
									</sec:authorize>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>

				<br> <br>
				<c:if test="${customers.totalPages > 0}">
					<util:pagination currentPage="${currentPage}"
						showPageTitle="Sô người dùng / Trang" thispage="${customers}"></util:pagination>
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