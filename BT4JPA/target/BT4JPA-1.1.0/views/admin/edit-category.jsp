<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.card-header {
	background-color: #0d6efd;
	color: white;
	font-weight: 500;
	font-size: 1.25rem;
	text-align: center;
}

.img-preview {
	max-height: 200px;
	max-width: 250px;
}
</style>
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
		<div class="card shadow mx-auto"
			style="max-width: 700px; width: 100%;">
			<div class="card-header">Edit Categories</div>
			<div class="card-body">

				<!-- Thông báo lỗi -->
				<c:if test="${not empty errorMsg}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						${errorMsg}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<form action="<c:url value='/admin/category/edit' />" method="post"
					enctype="multipart/form-data">

					<!-- Hidden ID -->
					<input type="hidden" name="id"
						value="${cate != null ? cate.cateid : ''}" />

					<!-- Tên danh mục -->
					<div class="mb-3">
						<label for="name" class="form-label">Tên danh mục:</label> <input
							type="text" class="form-control" id="name" name="name"
							value="${cate != null ? cate.catename : ''}" required>
					</div>

					<!-- Ảnh hiện tại -->
					<div class="mb-3">
						<label class="form-label">Ảnh hiện tại:</label><br>
						<c:if test="${cate != null && not empty cate.icon}">
							<c:url value="/image" var="imgUrl">
								<c:param name="fname" value="${cate.icon}" />
							</c:url>
							<img src="${imgUrl}" class="img-thumbnail img-preview mb-2"
								alt="Icon">
						</c:if>
					</div>

					<!-- Upload ảnh mới -->
					<div class="mb-3">
						<label for="icon" class="form-label">Chọn ảnh mới:</label> <input
							type="file" class="form-control" id="icon" name="icon">
					</div>

					<!-- Buttons -->
					<div class="d-flex justify-content-between">
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
