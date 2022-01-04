<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin nhà sản xuất</title>
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
					<img src="<c:url value="/upload/${publisher.logo}" />"
						height="200" class="card-img-top avatar" alt="Logo">
					<div class="card-body">
						<h5 class="card-title">
							<b>Thông tin nhà sản xuất</b>
						</h5>
						<p class="card-text">
						<div class="row">
							<div class="col">
								<label> Tên: </label>

							</div>
							<div class="col">${publisher.publisherName}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Địa chỉ:</label>
							</div>
							<div class="col">${publisher.street},
								${publisher.district}, ${publisher.city}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>SĐT:</label>
							</div>
							<div class="col">${publisher.phoneNumber}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Email:</label>
							</div>
							<div class="col">${publisher.email}</div>
						</div>
						</p>
					</div>
					<div class="p-3">
						<div class="btn-group">
							<div>
								<a
									href="<c:url value='/admin/publisher/getPublisher/${publisher.id}?mode=EDIT' />"
									class="btn btn-primary"><i class="far fa-edit">Cập nhật</i></a>
							</div>
							<div type="reset" class="btn btn-light" value="Reset">
								<a href="/admin/publisher/"><i class="fas fa-undo">Trở
										lại</i> </a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
</body>
</html>