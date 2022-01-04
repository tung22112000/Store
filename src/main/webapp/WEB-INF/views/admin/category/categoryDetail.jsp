<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin danh mục</title>
</head>
<body>
	<div class="container-fluid">

		<div class="col-lg-12">

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin danh
						mục</h6>
				</div>
				<div class="card-body">
					<div class="card-body">
						<h5 class="card-title">${user.firstname}${user.lastname}</h5>
						<p class="card-text">
						<div class="row">
							<div class="col">
								<label>Tên danh mục: </label>

							</div>
							<div class="col">${category.categoryName}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Biểu tượng danh mục: </label>

							</div>
							<div class="col">${category.categoryImages}</div>
							<div class="btn-group">
								<a
									href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=EDIT' />"
									class="btn btn-primary"><i class="far fa-edit">Cập nhật</i></a>

								<div type="reset" class="btn btn-light" value="Reset">
									<a href="/admin/category/"><i class="fas fa-undo">Trở
											lại</i> </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>