<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Products</title>
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

	<div class="container-fluid">
		<p>
			Kết quả tìm kiếm cho '${search}' - có ${size} kết quả tìm kiếm được <a
				href="/admin/user/" class="btn btn-light"><i class="fas fa-undo"></i>
				Quay lại</a>
		</p>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Quản lý sản phẩm</h6>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${ketqua}">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Xem</th>
										<th>Mã sản phẩm</th>
										<th>Tên sản phẩm</th>
										<th>Hình ảnh</th>
										<th>Số lượng</th>
										<th>Năm Sản Xuất</th>
										<th>Còn lại</th>
										<th>Ngày tạo</th>
										<th>Mô tả</th>
										<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
											<th>Cập nhật</th>
											<th>Xóa</th>
										</sec:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${products}" var="product">
										<tr>
											<td style="text-align: center"><a
												href="<c:url value='/admin/product/getProduct/${product.productCode}?mode=VIEW' />"><i
													class="fas fa-eye"></i></a></td>
											<td style="text-align: center">${product.productCode}</td>
											<td>${product.productName}</td>
											<td><img
												src="<c:url value="/upload/${product.productImages}" />"
												height="60" width="60"></td>
											<td style="text-align: center">${product.productNumber}</td>
											<td style="text-align: center">${product.yearManufactured}</td>
											<td style="text-align: center">${product.remain}</td>
											<td><fmt:formatDate type="date"
													value="${product.created}" /></td>
											<td>${product.description}</td>
											<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
												<td><a
													href="<c:url value='/admin/product/getProduct/${product.productCode}?mode=EDIT' />"><i
														class="far fa-edit"></i></a></td>
												<td><a
													href="<c:url value='/admin/product/deleteProduct/${product.productCode}' />"><i
														class="fas fa-trash-alt"></i></a></td>
											</sec:authorize>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<h4>Không có kết quả tìm kiếm</h4>
					</c:otherwise>
				</c:choose>
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