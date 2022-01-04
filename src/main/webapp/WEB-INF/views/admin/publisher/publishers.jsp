<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Quản lý nhà sản xuất</title>
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
			value="${pageContext.request.contextPath}/admin/publisher/search" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tên cần tìm" aria-label="Search">
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
				<h6 class="m-0 font-weight-bold text-primary">Quản lý nhà sản
					xuất</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Xem</th>
								<th>Tên</th>
								<th>Logo</th>
								<th>SĐT</th>
								<th>Địa chỉ</th>
								<th>Email</th>
								<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
									<th style="text-align: center">Sửa</th>
									<th style="text-align: center">Xóa</th>
								</sec:authorize>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${publishers.getContent()}" var="publisher">
								<tr>
									<td><a
										href="<c:url value='/admin/publisher/getPublisher/${publisher.id}?mode=VIEW' />"><i
											class="fas fa-eye"></i></a></td>
									<td>${publisher.publisherName}</td>
									<td><img
										src="<c:url value="/upload/${publisher.logo}" />" height="60"
										width="60"></td>
									<td>${publisher.phoneNumber}</td>
									<td>${publisher.street},${publisher.district},
										${publisher.city}</td>
									<td>${publisher.email}</td>
									<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
										<td style="text-align: center"><a
											href="<c:url value='/admin/publisher/getPublisher/${publisher.id}?mode=EDIT' />"><i
												class="far fa-edit"></i></a></td>
										<td style="text-align: center"><a
											href="<c:url value='/admin/publisher/deletePublisher/${publisher.id}' />"><i
												class="fas fa-trash-alt"></i></a></td>
									</sec:authorize>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
					<a href="<c:url value='/admin/publisher/addPublisher' />"><i
						class="far fa-plus-square"></i> Thêm mới</a>
				</sec:authorize>
				<br>
				<c:if test="${publishers.totalPages > 0}">
					<util:pagination currentPage="${currentPage}" filter="${filter}"
						showPageTitle="Số nhà xuất bản / trang" thispage="${publishers}"></util:pagination>
				</c:if>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
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