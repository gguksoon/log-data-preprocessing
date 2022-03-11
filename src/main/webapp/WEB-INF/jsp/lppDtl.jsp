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
			<div class="row g-4 mt-3">
				<div>
					<form id="lpp">
						<hr>
						<div class="row mb-3">
							<label for="filePath" class="col-sm-3 col-form-label">디렉토리 경로 혹은 파일 명</label>
							<div class="col-sm-9">
								<input ng-model="lpp.filePath" type="text" class="form-control" id="filePath" name="filePath">
							</div>
						</div>
						<hr>
						<div class="row mb-3">
							<div class="col-sm-2 offset-3 text-center" ng-show="lpp.regex.length > 0">
								<label class="col-form-label">컬럼 명</label>
							</div>
							<div class="col-sm-7 text-center" ng-show="lpp.regex.length > 0">
								<label class="col-form-label">정규식</label>
							</div>
						</div>
						<div class="row mb-3" ng-repeat="x in lpp.regex">
							<label for="tableName" class="col-sm-3 col-form-label">
								정규식{{$index+1}} <button type="button" class="btn btn-danger btn-sm" ng-click="fn_removeRegex(x.regexId)">🗙</button>
							</label>
							<div class="col-sm-2">
								<input ng-model="x.columnName" type="text" class="form-control" id="tableName" name="tableName">
							</div>
							<div class="col-sm-7">
								<input ng-model="x.regex" type="text" class="form-control" id="tableName" name="tableName">
							</div>
						</div>
						<div class="row mb-3">
							<button type="button" class="btn btn-success btn-sm" ng-click="fn_addRegex()">정규식 추가</button>
						</div>
						<hr>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-3 pt-0">추출 방법</legend>
							<div class="col-sm-9">
								<div class="form-check">
									<input ng-model="lpp.extrMethod.cdId" class="form-check-input" type="radio" name="extrMethod" id="extrMethod1" value="CD0101" checked>
									<label class="form-check-label" for="extrMethod1">DB 적재</label>
								</div>
								<div class="form-check">
									<input ng-model="lpp.extrMethod.cdId" class="form-check-input" type="radio" name="extrMethod" id="extrMethod2" value="CD0102" >
									<label class="form-check-label" for="extrMethod2">다운로드</label>
								</div>
							</div>
						</fieldset>
						<div ng-show="lpp.extrMethod.cdId == 'CD0101'">
							<div class="row mb-3">
								<label for="dbType" class="col-sm-3 col-form-label">데이터베이스 유형</label>
								<div class="col-sm-9">
									<select ng-model="lpp.dbType" class="form-select">
										<option value="MariaDB">MariaDB</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<label for="dbUrl" class="col-sm-3 col-form-label">데이터베이스 주소</label>
								<div class="col-sm-9">
									<input ng-model="lpp.dbUrl" type="text" class="form-control" id="dbUrl" name="dbUrl">
								</div>
							</div>
							<div class="row mb-3">
								<label for="dbPort" class="col-sm-3 col-form-label">데이터베이스 포트</label>
								<div class="col-sm-9">
									<input ng-model="lpp.dbPort" type="text" class="form-control" id="dbPort" name="dbPort">
								</div>
							</div>
							<div class="row mb-3">
								<label for="dbName" class="col-sm-3 col-form-label">데이터베이스 명</label>
								<div class="col-sm-9">
									<input ng-model="lpp.dbName" type="text" class="form-control" id="dbName" name="dbName">
								</div>
							</div>
							<div class="row mb-3">
								<label for="dbUser" class="col-sm-3 col-form-label">데이터베이스 유저</label>
								<div class="col-sm-9">
									<input ng-model="lpp.dbUser" type="text" class="form-control" id="dbUser" name="dbUser">
								</div>
							</div>
							<div class="row mb-3">
								<label for="dbPass" class="col-sm-3 col-form-label">데이터베이스 패스워드</label>
								<div class="col-sm-9">
									<input ng-model="lpp.dbPass" type="text" class="form-control" id="dbPass" name="dbPass">
								</div>
							</div>
							<div class="row mb-3">
								<label for="tableName" class="col-sm-3 col-form-label">테이블 명</label>
								<div class="col-sm-9">
									<input ng-model="lpp.tableName" type="text" class="form-control" id="tableName" name="tableName">
								</div>
							</div>
							
						</div>
						<hr>
						<a class='btn btn-outline-primary float-end mb-3' href='${pageContext.request.contextPath }/'><span aria-hidden='true'>취소</span></a>
						<button type="submit" class='btn btn-outline-primary float-end mb-3' ng-click="fn_upsertLpp()">저장</button>
					</form>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/lppDtl.js"></script>
	
</body>
</html>