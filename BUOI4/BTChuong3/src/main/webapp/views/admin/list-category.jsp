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
	<div class="container mt-4">
		<div class="card shadow-sm">
			<div class="card-header bg-primary text-white">
				<h5 class="mb-0">Danh sách danh mục</h5>
			</div>
			<div class="card-body">
				<!-- Nút Thêm mới -->
				<div class="d-flex justify-content-end mb-3">
					<a href="<c:url value='/admin/category/add' />"
						class="btn btn-success"> Thêm mới </a>
				</div>

				<!-- Table danh mục -->
				<table class="table table-striped table-hover align-middle">
					<thead class="table-dark">
						<tr>
							<th>#</th>
							<th>Ảnh</th>
							<th>Tên danh mục</th>
							<th>Hành động</th>
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
									class="btn btn-sm btn-warning me-1">Sửa</a> <a
									href="<c:url value='/admin/category/delete'><c:param name='id' value='${cate.cateid}'/></c:url>"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a></td>
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
