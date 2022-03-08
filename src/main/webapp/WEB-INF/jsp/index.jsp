<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
	<div class="container" ng-app="app" ng-controller="ctl" ng-cloak>
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4"
					src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72"
					height="57">
				<h2>Checkout form</h2>
				<p class="lead">Below is an example form built entirely with
					Bootstrap’s form controls. Each required form group has a
					validation state that can be triggered by attempting to submit the
					form without completing it.</p>
			</div>

			<div class="row g-5">
				<div>
					<form class="needs-validation" novalidate>
						<div class="row g-3">
							<div class="col-sm-12">
								<label for="firstName" class="form-label">디렉토리 경로 혹은 파일
									명</label> <input type="text" class="form-control" id="firstName"
									placeholder="" value="" required> <small
									class="text-muted">디렉토리 경로를 입력하면 해당 디렉토리의 모든 파일을 조회합니다.</small>
								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>

							<div class="col-sm-6">
								<label for="country" class="form-label">추출 방식</label> <select
									class="form-select" id="country" required>
									<option value="">DB 적재</option>
									<option value="">CSV 다운로드</option>
								</select>
								<div class="invalid-feedback">Please select a valid
									country.</div>
							</div>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="same-address">
							<label class="form-check-label" for="same-address">Shipping
								address is the same as my billing address</label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info">Save this
								information for next time</label>
						</div>

						<hr class="my-4">

						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="col-1">#</th>
									<th scope="col" class="col-5">경로</th>
									<th scope="col" class="col-2">방법</th>
									<th scope="col" class="col-2">상태</th>
									<th scope="col" class="col-2">@</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Larry the Bird</td>
									<td>Larry the Bird</td>
									<td>@twitter</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary float-end">생성</button>
					</form>
				</div>
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017–2022 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/angularjs/1.6.9/angular.js"></script>
	<script>
		var app = angular.module('app', []);
		app.controller("ctl", ['$scope','$http', function($scope, $http){
		}]);
	</script>
</body>
</html>