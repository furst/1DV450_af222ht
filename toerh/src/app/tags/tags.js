angular.module('tags', ['crud'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/tags', {
		templateUrl: 'app/tags/tag-list.tpl.html',
		controller: 'TagListController'
	});
	$routeProvider.when('/tags/:t_id/resources', {
		templateUrl: 'app/resources/resource-list.tpl.html',
		controller: 'TagController'
	});
	
}])

.controller('TagListController', ['$scope', 'Resource', 'REST_PATH', function($scope, Resource, REST_PATH) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.tags, page).get(
			    {},
			    function (data) {
			        $scope.tags = data;
			    },
			    function (data) {
			        //error handling goes here
			});
		};
	};

	Resource.path(REST_PATH.tags).get(
	    {},
	    function (data) {
	        $scope.tags = data;
	    },
	    function (data) {
	        //error handling goes here
	});
}])

.controller('TagController', ['$scope', 'ResourceChildren', '$routeParams', 'REST_PATH', function($scope, ResourceChildren, $routeParams, REST_PATH) {
	
	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			ResourceChildren.get($routeParams.t_id, REST_PATH.tags, page).then(function(response) {
				$scope.resources = response.data;
			}).then({
				// Error
			});
		};
		
	};

	ResourceChildren.get($routeParams.t_id, REST_PATH.tags).then(function(response) {
		$scope.resources = response.data;
	}).then({
		// Error
	});
	
}]);
