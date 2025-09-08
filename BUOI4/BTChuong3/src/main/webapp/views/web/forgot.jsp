<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

    <div class="card shadow-lg rounded-4" style="width: 24rem;">
        <div class="card-body p-4">
            <h3 class="card-title text-center mb-3">Quên mật khẩu</h3>
            <p class="text-muted text-center mb-4">Vui lòng nhập email để lấy lại mật khẩu</p>

            <!-- Form gửi email -->
            <form action="${pageContext.request.contextPath}/forgot" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Địa chỉ Email</label>
                    <input type="email" class="form-control" id="email" name="email" 
                           placeholder="nhapemail@domain.com" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Gửi liên kết đặt lại mật khẩu</button>
                </div>
            </form>

            <!-- Hiển thị thông báo -->
            <c:if test="${not empty message}">
                <div class="alert alert-info mt-3">
                    ${message}
                </div>
            </c:if>

            <div class="text-center mt-3">
                <a href="login" class="text-decoration-none">Quay lại đăng nhập</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
