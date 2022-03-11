var app = angular.module('app', []);

app.controller("ctl", ['$scope', '$http', '$window', function($scope, $http, $window) {
	$scope.fn_init = () => {
		$scope.fn_getLpp();
	}
	
	$scope.fn_getLpp = () => {
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
	
	$scope.fn_addRegex = () => {
		if($scope.lpp == undefined) {
			$scope.lpp = {regex: [{regexId: 1}]};
		} else if($scope.lpp.regex == undefined) {
			$scope.lpp.regex = [{regexId: 1}];
		} else {
			let regexList = $scope.lpp.regex;
			let max = 0;
			for(let i = 0; i < regexList.length; i++) {
				max = regexList[i].regexId > max ? regexList[i].regexId : max; 
			}
			regexList.push({regexId: ++max});
		}
	}
	
	$scope.fn_removeRegex = (regexId) => {
		let regexList = $scope.lpp.regex;
		for(let i = 0; i < regexList.length; i++) {
			if(regexList[i].regexId == regexId) {
				regexList.splice(i, 1);
			}
		}
	}
	
	$scope.fn_upsertLpp = () => {
		$http({
			url: $window.contextPath + "/upsertLpp",
			method: 'POST',
			data: $scope.lpp,
		}).then(function success(response) {
//			let lpp = response.data.lpp;
//			$scope.lpp = lpp;
		}, function error(response) {
			console.log(response);
		});
	}
	
	$scope.fn_getParam = (param) => {
		let result = null;
		let tmp = [];
		location.search.substr(1).split("&").forEach(function(item) {
			tmp = item.split("=");
			if (tmp[0] === param) result = decodeURIComponent(tmp[1]);
		});
		return result;
	}

}]);