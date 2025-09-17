<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thêm danh mục mới</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<style>
    body {
        min-height: 100vh;
        display: flex;
        background-color: #f8f9fa;
    }
    .sidebar {
        width: 250px;
        background: linear-gradient(180deg, #212529, #343a40);
        color: #fff;
        min-height: 100vh;
        position: sticky;
        top: 0;
        box-shadow: 2px 0 10px rgba(0,0,0,0.2);
    }
    .sidebar h4 {
        font-size: 1.3rem;
        font-weight: bold;
    }
    .sidebar a {
        color: #adb5bd;
        text-decoration: none;
        border-radius: 8px;
        padding: 10px 15px;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: all 0.3s ease;
    }
    .sidebar a:hover {
        background-color: #495057;
        color: #fff;
        transform: translateX(5px);
    }
    .content {
        flex-grow: 1;
        padding: 30px;
    }
    .card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: transform 0.2s ease;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .user-info {
        font-size: 0.95rem;
        background: rgba(255,255,255,0.1);
        padding: 8px;
        border-radius: 10px;
    }
</style>
</head>
<body>
    <!-- Main content -->
    <div class="content">
        <div class="card shadow-sm mx-auto" style="max-width: 450px;">
            <div class="card-header bg-primary text-white text-center">
                Thêm danh mục mới
            </div>
            <div class="card-body">
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMsg}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="<c:url value='/admin/category/add' />" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" placeholder="Tên danh mục" required>
                    </div>
                    <div class="mb-3">
                        <input type="file" class="form-control" name="icon" accept="image/*" required>
                    </div>
                    <div class="d-flex justify-content-center gap-2">
                        <button type="submit" class="btn btn-success btn-sm">Thêm</button>
                        <button type="reset" class="btn btn-secondary btn-sm">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
