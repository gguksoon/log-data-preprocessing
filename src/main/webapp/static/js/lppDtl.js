var app = angular.module('app', []);

app.controller("ctl", ['$scope', '$http', '$window', function($scope, $http, $window) {
	$scope.fn_init = function() {
		$scope.fn_getLpp();
	}
	
	$scope.fn_getLpp = function() {
		let lppId = $scope.fn_getParam("lppId");
		if(lppId != null) {
			$http({
				url: $window.contextPath + "/getLpp",
				method: 'POST',
				data: {"lppId": lppId},
			}).then(function success(response) {
				let lpp = response.data.lpp;
				$scope.lpp = lpp;
			}, function error(response) {
				console.log(response);
			});
		}
	}
	
	$scope.fn_getParam = function(param) {
		let result = null;
		let tmp = [];
		location.search.substr(1).split("&").forEach(function(item) {
			tmp = item.split("=");
			if (tmp[0] === param) result = decodeURIComponent(tmp[1]);
		});
		return result;
	}

}]);