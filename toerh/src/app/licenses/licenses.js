angular.module('licenses', ['crud'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/licenses', {
		templateUrl: 'app/licenses/license-list.tpl.html',
		controller: 'LicenseListController'
	});
	$routeProvider.when('/licenses/:t_id/resources', {
		templateUrl: 'app/resources/resource-list.tpl.html',
		controller: 'LicenseController'
	});
	
}])

.controller('LicenseListController', ['$scope', 'Errors', 'Resource', 'REST_PATH', function($scope, Errors, Resource, REST_PATH) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.licenses, page).get(
			    {},
			    function (data) {
			        $scope.licenses = data;
			    },
			    function (data) {
			        Errors.message('Licenserna kunde inte hämtas', true);
			});
		};
	};

	Resource.path(REST_PATH.licenses).get(
	    {},
	    function (data) {
	        $scope.licenses = data;
	    },
	    function (data) {
	        Errors.message('Licenserna kunde inte hämtas', true);
	});
}])

.controller('LicenseController', ['$scope', 'Errors', 'ResourceChildren', '$routeParams', 'REST_PATH', function($scope, Errors, ResourceChildren, $routeParams, REST_PATH) {
	
	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			ResourceChildren.get($routeParams.t_id, REST_PATH.licenses, page).then(function(response) {
				$scope.resources = response.data;
			});
		};
		
	};

	ResourceChildren.get($routeParams.t_id, REST_PATH.licenses).then(function(response) {
		$scope.resources = response.data;
	});
	
}]);
