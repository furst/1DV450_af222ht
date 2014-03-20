angular.module('types', ['crud'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/resource-types', {
		templateUrl: 'app/types/type-list.tpl.html',
		controller: 'TypeListController'
	});
	$routeProvider.when('/resource-types/:t_id/resources', {
		templateUrl: 'app/resources/resource-list.tpl.html',
		controller: 'TypeController'
	});
	
}])

.controller('TypeListController', ['$scope', 'Resource', 'REST_PATH', function($scope, Resource, REST_PATH) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.types, page).get(
			    {},
			    function (data) {
			        $scope.types = data;
			    },
			    function (data) {
			        //error handling goes here
			});
		};
	};

	Resource.path(REST_PATH.types).get(
	    {},
	    function (data) {
	        $scope.types = data;
	    },
	    function (data) {
	        //error handling goes here
	});
}])

.controller('TypeController', ['$scope', 'ResourceChildren', '$routeParams', 'REST_PATH', function($scope, ResourceChildren, $routeParams, REST_PATH) {
	
	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			ResourceChildren.get($routeParams.t_id, REST_PATH.types, page).then(function(response) {
				$scope.resources = response.data;
			}).then({
				// Error
			});
		};
		
	};

	ResourceChildren.get($routeParams.t_id, REST_PATH.types).then(function(response) {
		$scope.resources = response.data;
	}).then({
		// Error
	});
	
}]);
