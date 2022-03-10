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
			data: $scope.paramMap,
			headers: { "Content-Type": "application/json" },
			dataType: "json"
		}).then(function success(response) {
			let lppList = response.data.lppList;
			$scope.lppList = lppList.content;
			$("#pagination").empty();
			$compile($("#pagination").append(response.data.pagination))($scope);
		}, function error(response) {
			console.log(response);
		});
	}

}]);