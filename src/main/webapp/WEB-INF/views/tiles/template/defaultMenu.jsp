<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.html">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Quản lý bán hàng</div>
	</a>
	<hr class="sidebar-divider my-0">
	<sec:authorize access="hasRole('SUPPER_ADMIN')">
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/user/"> <i
				class="fas fa-user"></i> <span>Quản lý người dùng</span>
		</a></li>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/category/"> <i
				class="fas fa-list-ul"></i> <span>Quản lý Danh mục</span>
		</a></li>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/publisher/"> <i
				class="fas fa-industry"></i> <span>Quản lý nhà cung cấp</span>
		</a></li>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
		<li class="nav-item active"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/product/"> <i
				class="fas fa-box"></i> <span>Quản lý sản phẩm</span>
		</a></li>
	</sec:authorize>
	<li class="nav-item active"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/customer/"> <i
			class="fas fa-users"></i> <span>Quản lý khách hàng</span>
	</a></li>
	<li class="nav-item active"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/order/"> <i
			class="fas fa-file-invoice-dollar"></i> <span>Quản lý hóa đơn</span>
	</a></li>

</ul>
<!-- End of Sidebar -->