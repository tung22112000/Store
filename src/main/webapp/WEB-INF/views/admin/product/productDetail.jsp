<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin sản phẩm</title>
</head>
<body>
	<div class="container-fluid">

		<div class="col-lg-12">

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin người
						dùng</h6>
				</div>
				<div class="card-body">
					<img src="<c:url value="/upload/${product.productImages}" />"
						height="200" width="200" class="cangiua" alt="Avatar">
					<div class="card-body">
						<p class="card-text">
						<div class="row">
							<div class="col">
								<label>Mã Sản Phẩm: </label>

							</div>
							<div class="col">${product.productCode}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Tên Sản Phẩm:</label>
							</div>
							<div class="col">${product.productName}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Số lượng: </label>

							</div>
							<div class="col">
								<strong>${product.productNumber}</strong>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Năm sản xuất: </label>

							</div>
							<div class="col">${product.yearManufactured}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Ngày tạo: </label>

							</div>
							<div class="col">
								<fmt:formatDate type="date" value="${product.created}" />
							</div>
						</div>

						<div class="row">
							<div class="col">
								<label>Mô tả: </label>

							</div>
							<div class="col">${product.description}</div>
						</div>
						<div class="row">
							<div class="col">

								<label>Loại danh mục: </label>
							</div>
							<c:forEach items="${product.categories}" var="c">
								<div class="col">${c.categoryName}</div>
							</c:forEach>

						</div>
						<div class="row">
							<div class="col">
								<label>Nhà xuất bản: </label>

							</div>
							<div class="col">${product.publisher.publisherName}</div>
						</div>
					</div>
				</div>
				<div class="p-3">
					<div class="btn-group">
						<a
							href="<c:url value='/admin/product/getProduct/${product.productCode}?mode=EDIT' />"
							class="btn btn-primary"><i class="far fa-edit">Cập nhật</i></a>

						<div type="reset" class="btn btn-light" value="Reset">
							<a href="/admin/product/"><i class="fas fa-undo">Trở lại</i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>