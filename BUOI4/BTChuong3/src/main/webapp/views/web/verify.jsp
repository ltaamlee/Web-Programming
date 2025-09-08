<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Xác nhận mã kích hoạt</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<div class="card shadow-sm">
					<div class="card-body">
						<h5 class="card-title mb-3 text-center">Xác nhận tài khoản</h5>
						<p class="text-center text-muted">
							Hệ thống đã gửi mã kích hoạt đến Email của bạn.<br /> Vui lòng
							nhập mã kích hoạt để kích hoạt tài khoản.
						</p>

						<form action="verifycode" method="post">
							<div class="mb-3">
								<label for="code" class="form-label">Mã kích hoạt</label> <input
									type="text" class="form-control" id="code" name="code"
									placeholder="Nhập mã kích hoạt" required />
							</div>
							<button type="submit" class="btn btn-primary w-100">Xác nhận</button>
						</form>

						<div class="mt-3 text-center">
							<a href="login" class="text-decoration-none">Quay lại đăng nhập!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>