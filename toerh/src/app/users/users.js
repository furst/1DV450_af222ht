angular.module('users', ['crud'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/users', {
		templateUrl: 'app/users/user-list.tpl.html',
		controller: 'UserListController'
	});
	$routeProvider.when('/users/:u_id/resources', {
		templateUrl: 'app/resources/resource-list.tpl.html',
		controller: 'UserController'
	});
	
}])

.controller('UserListController', ['$scope', 'Resource', 'REST_PATH', function($scope, Resource, REST_PATH) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.users, page).get(
			    {},
			    function (data) {
			        $scope.users = data;
			    },
			    function (data) {
			        //error handling goes here
			});
		};
	};

	Resource.path(REST_PATH.users).get(
	    {},
	    function (data) {
	        $scope.users = data;
	    },
	    function (data) {
	        //error handling goes here
	});
}])

.controller('UserController', ['$scope', 'ResourceChildren', '$routeParams', 'REST_PATH', function($scope, ResourceChildren, $routeParams, REST_PATH) {
	
	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			ResourceChildren.get($routeParams.u_id, REST_PATH.users, page).then(function(response) {
				$scope.resources = response.data;
			}).then({
				// Error
			});
		};
		
	};

	ResourceChildren.get($routeParams.u_id, REST_PATH.users).then(function(response) {
		$scope.resources = response.data;
	}).then({
		// Error
	});
	
}]);
