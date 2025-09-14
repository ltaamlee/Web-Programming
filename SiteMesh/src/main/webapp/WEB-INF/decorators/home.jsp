<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/home">🌸 LTaam!</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                            <li class="nav-item me-2 d-flex align-items-center">
                                <span class="text-dark">Xin chào, 
                                    <strong>${sessionScope.account.username}</strong>
                                </span>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <main class="flex-grow-1 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg border-0 rounded-4 p-4 text-center" style="max-width: 500px; width: 100%;">
            <h1 class="mb-3 text-primary">Chào mừng đến với WebThuViet!</h1>
            <c:choose>
                <c:when test="${not empty sessionScope.account}">
                    <p class="lead">Rất vui được gặp bạn, 
                        <strong>${sessionScope.account.username}</strong> 🎉</p>
                </c:when>
                <c:otherwise>
                    <p class="text-muted">Vui lòng đăng nhập hoặc đăng ký để trải nghiệm đầy đủ tính năng.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <footer class="bg-light border-top py-3 mt-auto">
        <div class="container text-center">
            <small class="text-muted">&copy; 2025 LTaam!. All rights reserved.</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
