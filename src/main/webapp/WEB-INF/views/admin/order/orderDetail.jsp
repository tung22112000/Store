<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin hóa đơn</title>
</head>
<body>
	<div class="container-fluid">

		<div class="col-lg-12">

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Thông tin hóa
						đơn</h6>
				</div>
				<div class="card-body">
					<!--  <img src="<c:url value="/uploads/${user.profileImage}" />"
						height="200" class="card-img-top avatar" alt="Avatar">-->
					<div class="card-body">
						<p class="card-text">
						<div class="row">
							<div class="col">
								<label> Tên:</label>

							</div>
							<div class="col">${order.customer.firstName}
								${order.customer.lastName}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Địa chỉ:</label>
							</div>
							<div class="col">${order.customer.street},
								${order.customer.district}, ${order.customer.city}</div>
						</div>

						<div class="row">
							<div class="col">
								<label>SĐT:</label>

							</div>
							<div class="col">${order.customer.numberPhone}</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Email:</label>

							</div>
							<div class="col">${order.customer.email}</div>
						</div>
						<h4>Tóm lược đơn hàng của bạn</h4>

						<div class="row">
							<div class="col">
								<label>Ngày tạo:</label>
							</div>
							<div class="col">
								<fmt:formatDate type="date" value="${order.orderDate}" />
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label>Trạng thái:</label>
							</div>
							<div class="col">
								<c:set var="saveUrl"
									value="${pageContext.request.contextPath}/admin/order/save" />
								<form:form enctype="multipart/form-data" method="POST"
									action="${saveUrl}" modelAttribute="order" id="f1">
									<form:input type="hidden" path="id" id="id" />
									<form:input type="hidden" path="customer" id="customeId" />
									<form:input path="amount" type="hidden" id="amount" />
									<form:input path="orderDate" type="hidden" id="orderDate" />
									<form:input path="totalQuanity" type="hidden" id="totalQuanity" />
									<form:input path="hour" type="hidden" id="Hour" />
									<form:input path="minute" type="hidden" id="totalQuanity" />
									<!-- 		<div class="form-group">
					<div class="form-group"> -->
									<%-- <label><spring:message code="admin.order.status"></spring:message>:
						</label> --%>
									<form:select path="status">
										<c:if test="${order.status==0}">
											<option selected value="0"><spring:message
													code="admin.order.status.0"></spring:message></option>
											<option value="1"><spring:message
													code="admin.order.status.1"></spring:message></option>
											<option value="2"><spring:message
													code="admin.order.status.2"></spring:message></option>
											<option value="3"><spring:message
													code="admin.order.status.3"></spring:message></option>
										</c:if>

										<c:if test="${order.status==1}">
											<option value="0"><spring:message
													code="admin.order.status.0"></spring:message></option>
											<option selected value="1"><spring:message
													code="admin.order.status.1"></spring:message></option>
											<option value="2"><spring:message
													code="admin.order.status.2"></spring:message></option>
											<option value="3"><spring:message
													code="admin.order.status.3"></spring:message></option>
										</c:if>
										<c:if test="${order.status==2}">
											<option value="0"><spring:message
													code="admin.order.status.0"></spring:message></option>
											<option value="1"><spring:message
													code="admin.order.status.1"></spring:message></option>
											<option selected value="2"><spring:message
													code="admin.order.status.2"></spring:message></option>
											<option value="3"><spring:message
													code="admin.order.status.3"></spring:message></option>
										</c:if>
										<c:if test="${order.status==3}">
											<option value="0"><spring:message
													code="admin.order.status.0"></spring:message></option>
											<option value="1">Đang xử lý</option>
											<option value="2"><spring:message
													code="admin.order.status.2"></spring:message></option>
											<option selected value="3"><spring:message
													code="admin.order.status.3"></spring:message></option>
										</c:if>
									</form:select>
									<!-- </div> -->
								</form:form>
							</div>
						</div>
					</div>
					<center>
						<a href="/admin/user/" class="btn btn-light"><i
							class="fas fa-undo"></i> Trở lại</a>

					</center>
				</div>
			</div>
		</div>
</body>
</html>