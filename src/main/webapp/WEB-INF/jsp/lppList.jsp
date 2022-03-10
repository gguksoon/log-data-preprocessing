<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Log Preprocessing</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	<style>
		.table-hover { cursor: pointer; }
	</style>
</head>
<body>
	<div class="container" ng-app="app" ng-controller="ctl" ng-cloak ng-init="fn_init()">
		<main>
			<div class="row g-5 mt-3">
				<div>
					<a class='btn btn-outline-primary float-end mb-3' ng-click='fn_goDtl()'><span aria-hidden='true'>등록</span></a>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" class="text-center">#</th>
								<th scope="col" class="col-8 text-center">경로</th>
								<th scope="col" class="col-2 text-center">등록일</th>
								<th scope="col" class="col-1 text-center">방법</th>
								<th scope="col" class="col-1 text-center">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="x in lppList" ng-click="fn_goDtl(x.lppId)">
								<th scope="row" class="text-center">{{($index+1) + (paramMap.page-1)*paramMap.size}}</th>
								<td>{{x.filePath}}</td>
								<td class="text-center">{{x.regDate | date:'yyyy-MM-dd HH:mm'}}</td>
								<td class="text-center">{{x.extrMethod.cdNm}}</td>
								<td class="text-center">{{x.status.cdNm}}</td>
							</tr>
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul id="pagination" class="pagination justify-content-center"></ul>
					</nav>
				</div>
			</div>
		</main>
	</div>
	<script>
		window.contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/angularjs/1.6.9/angular.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/webjars/angular-ui-router/1.0.20/angular-ui-router.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/lppList.js"></script>
	
</body>
</html>