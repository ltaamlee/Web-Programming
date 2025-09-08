<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%@ page import="vn.iostart.model.User"%>

<%
User user = (User) session.getAttribute("account");
if (user == null || user.getRoleid() != 1) {
	response.sendRedirect(request.getContextPath() + "/login");
	return;
}
%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<style>
    body {
        min-height: 100vh;
        display: flex;
    }
    .sidebar {
        min-width: 220px;
        background-color: #343a40;
        color: #fff;
    }
    .sidebar a {
        color: #fff;
        text-decoration: none;
    }
    .sidebar a:hover {
        background-color: #495057;
    }
    .content {
        flex-grow: 1;
        padding: 20px;
    }
</style>
</head>
<body>
    <!-- Sidebar -->
    <nav class="sidebar d-flex flex-column p-3">
        <h4 class="text-center mb-4">Admin Panel</h4>
        <div class="mb-3 text-center">
            <strong><%= user.getUserName() %></strong>
        </div>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item mb-2">
                <a href="<c:url value='/admin/manageUsers' />" class="nav-link btn btn-dark w-100">Quản lý người dùng</a>
            </li>
            <li class="nav-item mb-2">
                <a href="<c:url value='/admin/category/list' />" class="nav-link btn btn-dark w-100">Quản lý danh mục</a>
            </li>
            <li class="nav-item mb-2">
                <a href="<c:url value='/admin/manageProducts' />" class="nav-link btn btn-dark w-100">Quản lý sản phẩm</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/logout' />" class="nav-link btn btn-danger w-100">Đăng xuất</a>
            </li>
        </ul>
    </nav>

    <!-- Main content -->
    <div class="content">
        <h2>Chào mừng Admin <%= user.getUserName() %></h2>

        <div class="row mt-4">
            <!-- Card 1 -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-primary h-100">
                    <div class="card-body">
                        <h5 class="card-title">Người dùng</h5>
                        <p class="card-text">Quản lý tài khoản người dùng.</p>
                        <a href="<c:url value='/admin/manageUsers' />" class="btn btn-light">Đi đến</a>
                    </div>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-success h-100">
                    <div class="card-body">
                        <h5 class="card-title">Danh mục</h5>
                        <p class="card-text">Quản lý danh mục sản phẩm.</p>
                        <a href="<c:url value='/admin/category/list' />" class="btn btn-light">Đi đến</a>
                    </div>
                </div>
            </div>
            <!-- Card 3 -->
            <div class="col-md-4 mb-3">
                <div class="card text-white bg-warning h-100">
                    <div class="card-body">
                        <h5 class="card-title">Sản phẩm</h5>
                        <p class="card-text">Quản lý sản phẩm trong cửa hàng.</p>
                        <a href="<c:url value='/admin/manageProducts' />" class="btn btn-light">Đi đến</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
