<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Log Preprocessing</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
	<div class="container" ng-app="app" ng-controller="ctl" ng-cloak ng-init="fn_init()">
		<main>
			<div class="row g-5 mt-3">
				<div>
<!-- 					<form class="needs-validation" novalidate> -->
<!-- 						<div class="row g-3"> -->
<!-- 							<div class="col-sm-12"> -->
<!-- 								<label for="firstName" class="form-label">디렉토리 경로 혹은 파일 -->
<!-- 									명</label> <input type="text" class="form-control" id="firstName" -->
<!-- 									placeholder="" value="" required> <small -->
<!-- 									class="text-muted">디렉토리 경로를 입력하면 해당 디렉토리의 모든 파일을 조회합니다.</small> -->
<!-- 								<div class="invalid-feedback">Valid first name is -->
<!-- 									required.</div> -->
<!-- 							</div> -->

<!-- 							<div class="col-sm-6"> -->
<!-- 								<label for="country" class="form-label">추출 방식</label> <select -->
<!-- 									class="form-select" id="country" required> -->
<!-- 									<option value="">DB 적재</option> -->
<!-- 									<option value="">CSV 다운로드</option> -->
<!-- 								</select> -->
<!-- 								<div class="invalid-feedback">Please select a valid -->
<!-- 									country.</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-check"> -->
<!-- 							<input type="checkbox" class="form-check-input" id="same-address"> -->
<!-- 							<label class="form-check-label" for="same-address">Shipping -->
<!-- 								address is the same as my billing address</label> -->
<!-- 						</div> -->

<!-- 						<div class="form-check"> -->
<!-- 							<input type="checkbox" class="form-check-input" id="save-info"> -->
<!-- 							<label class="form-check-label" for="save-info">Save this -->
<!-- 								information for next time</label> -->
<!-- 						</div> -->
<!-- 					</form> -->

					<button type="button" class="btn btn-outline-secondary float-end mb-3" ng-click="fn_getPagingList()">등록</button>
					<table class="table">
						<thead>
							<tr>
								<th scope="col" class="text-center">#</th>
								<th scope="col" class="col-7 text-center">경로</th>
								<th scope="col" class="col-2 text-center">등록일</th>
								<th scope="col" class="col-1 text-center">방법</th>
								<th scope="col" class="col-1 text-center">상태</th>
								<th scope="col" class="col-1 text-center"></th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="x in lppList">
								<th scope="row" class="text-center">{{($index+1) + (paramMap.page-1)*paramMap.size}}</th>
								<td>{{x.filePath}}</td>
								<td class="text-center">{{x.regDate | date:'yyyy-MM-dd HH:mm'}}</td>
								<td class="text-center">{{x.extrMethod.cdNm}}</td>
								<td class="text-center">{{x.status.cdNm}}</td>
								<td class="text-center">
									<button type="button" class="btn btn-outline-secondary btn-sm" ng-show="x.status.cdId == 'CD0201'">시작</button>
									<button type="button" class="btn btn-secondary btn-sm" ng-show="x.status.cdId == 'CD0202'" disabled>진행중</button>
									<button type="button" class="btn btn-outline-secondary btn-sm" ng-show="x.status.cdId == 'CD0203' || x.status.cdId == 'CD0204'">재시작</button>
								</td>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/index.js"></script>
	
</body>
</html>