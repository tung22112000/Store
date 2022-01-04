<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sb-admin-2.min.css" />"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.button {
	border: none;
	border-radius: 6px;
	background-color: #4E73DF;
	color: white;
	width: 345px;
	height: 45px;
	border-radius: 6px;
}
</style>

</head>
<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Chào mừng bạn</h1>
									</div>
									<form class="user" method="post" action="login">
										<div>
											<c:if test="${param.error != null}">
												<div class="alert alert-danger" role="alert">Sai tên
													đăng nhập hoặc mật khẩu</div>
											</c:if>
											<c:if test="${param.logout != null}">
												<div class="alert alert-danger" role="alert">Bạn đã bị
													đăng xuất</div>
											</c:if>
										</div>
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="exampleInputText" placeholder="Username" name="username">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password"
												name="password">
										</div>
										<div class="form-group">
											<input type="submit" class="button" value="Đăng nhập">
										</div>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Quên mật
											khẩu?</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<script src="<c:url value="resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script
		src="<c:url value="resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>
	<script src="<c:url value="resources/js/sb-admin-2.min.js" />"></script>
</body>
</html>