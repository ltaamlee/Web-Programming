<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body class="bg-light">

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-5">

				<form action="register" method="post" class="card p-4 shadow">
					<h2 class="text-center mb-4">Đăng ký</h2>

					<c:if test="${alert != null}">
						<div class="alert alert-danger text-center">${alert}</div>
					</c:if>

					<!-- Họ và tên -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-user"></i></span> <input
							type="text" class="form-control" name="fullname"
							placeholder="Họ và tên" required>
					</div>

					<!-- Email -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-envelope"></i></span>
						<input type="email" class="form-control" name="email"
							placeholder="Email" required>
					</div>

					<!-- Username -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-user-circle"></i></span>
						<input type="text" class="form-control" name="username"
							placeholder="Tài khoản" required>
					</div>
					<!-- Phone -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-phone"></i></span>
						<input type="text" class="form-control" name="phone"
							placeholder="Số điện thoại" required>
					</div>
					
					<!-- Password -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
							type="password" class="form-control" name="password"
							placeholder="Mật khẩu" required>
					</div>

					<!-- Confirm Password -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
							type="password" class="form-control" name="confirmPassword"
							placeholder="Nhập lại mật khẩu" required>
					</div>

					<!-- Submit -->
					<div class="d-grid mb-3">
						<button type="submit" class="btn btn-success">Đăng ký</button>
					</div>

					<!-- Extra options -->
					<div class="text-center">
						<a href="login">Đã có tài khoản? Đăng nhập</a><br> <a
							href="forgot-password">Quên mật khẩu?</a>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
