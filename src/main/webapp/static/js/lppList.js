var app = angular.module('app', []);

app.controller("ctl", ['$scope', '$http', '$window', '$compile', function($scope, $http, $window, $compile) {

	$scope.paramMap = {
		"page": 1,
		"size": 10
	}
	$scope.paging = {};
	
	$scope.fn_init = function() {
		$scope.fn_getPagingList();
	}
	
	$scope.fn_getPagingList = function(page) {
		$scope.paramMap.page = page == undefined ? 1 : page;
		$http({
			url: $window.contextPath + "/getLppList",
			method: 'POST',
			data: $scope.paramMap
		}).then(function success(response) {
			let lppList = response.data.lppList;
			$scope.lppList = lppList.content;
			console.log($scope.lppList);
			$("#pagination").empty();
			$compile($("#pagination").append(response.data.pagination))($scope);
		}, function error(response) {
			console.log(response);
		});
	}
	
	$scope.fn_goDtl = function(lppId) {
		if(lppId !== undefined) {
			$window.location.href = $window.contextPath + "/dtl?lppId=" + lppId;
		} else {
			$window.location.href = $window.contextPath + "/dtl";
		}
	}

}]);