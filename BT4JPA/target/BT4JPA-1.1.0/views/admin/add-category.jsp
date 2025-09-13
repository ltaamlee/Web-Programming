<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thêm danh mục mới</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- Sidebar -->
	<nav class="sidebar d-flex flex-column p-3">
		<h4 class="text-center mb-4">🌐 Admin Panel</h4>
		<div class="mb-4 text-center user-info">
			<i class="bi bi-person-circle fs-4"></i>
		</div>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item mb-2"><a
				href="<c:url value='/admin/manageUsers' />" class="nav-link"> <i
					class="bi bi-people-fill"></i> Account
			</a></li>
			<li class="nav-item mb-2"><a
				href="<c:url value='/admin/category/list' />" class="nav-link">
					<i class="bi bi-tags-fill"></i> Categories
			</a></li>
			<li class="nav-item mb-2"><a
				href="<c:url value='/admin/manageProducts' />" class="nav-link">
					<i class="bi bi-box-seam"></i> Products
			</a></li>
			<li class="nav-item mt-3"><a href="<c:url value='/logout' />"
				class="nav-link bg-danger text-white"> <i
					class="bi bi-box-arrow-right"></i> Logout
			</a></li>
		</ul>
	</nav>

	<div class="container mt-5">
		<div class="card shadow-sm mx-auto" style="max-width: 450px;">
			<div class="card-header bg-primary text-white text-center">
				Thêm danh mục mới</div>
			<div class="card-body">
				<c:if test="${not empty errorMsg}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						${errorMsg}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<form action="<c:url value='/admin/category/add' />" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<input type="text" class="form-control" name="name"
							placeholder="Tên danh mục" required>
					</div>
					<div class="mb-3">
						<input type="file" class="form-control" name="icon"
							accept="image/*" required>
					</div>
					<div class="d-flex justify-content-center gap-2">
						<button type="submit" class="btn btn-success btn-sm">Thêm</button>
						<button type="reset" class="btn btn-secondary btn-sm">Hủy</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
