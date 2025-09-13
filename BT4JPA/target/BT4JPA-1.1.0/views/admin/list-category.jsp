<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách danh mục</title>
<!-- Bootstrap 5 CSS -->
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

	<div class="container mt-4">
		<div class="card shadow-sm">
			<div class="card-header bg-primary text-white">
				<h5 class="mb-0">Categories</h5>
			</div>
			<div class="card-body">
				<div class="d-flex justify-content-end mb-3">
					<a href="<c:url value='/admin/category/add' />"
						class="btn btn-success"> Add </a>
				</div>

				<!-- Table danh mục -->
				<table class="table table-striped table-hover align-middle">
					<thead class="table-dark">
						<tr>
							<th>#</th>
							<th>Image</th>
							<th>Category</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cateList}" var="cate" varStatus="STT">
							<c:url value="/image" var="imgUrl">
								<c:param name="fname" value="${cate.icon}" />
							</c:url>

							<tr>
								<td>${STT.index + 1}</td>
								<td><img src="${imgUrl}" class="img-thumbnail"
									style="max-height: 150px; max-width: 200px;" /></td>
								<td>${cate.catename}</td>
								<td><a
									href="<c:url value='/admin/category/edit'><c:param name='id' value='${cate.cateid}'/></c:url>"
									class="btn btn-sm btn-warning me-1">Edit</a> <a
									href="<c:url value='/admin/category/delete'><c:param name='id' value='${cate.cateid}'/></c:url>"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Bạn có chắc muốn xóa?');">Delete</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Bootstrap 5 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
