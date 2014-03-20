angular.module('resources', ['crud'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/resources', {
		templateUrl: 'app/resources/resource-list.tpl.html',
		controller: 'ResourceListController'
	});
	$routeProvider.when('/resources/new', {
		templateUrl: 'app/resources/new.tpl.html',
		controller: 'ResourceCreateController'
	});
	$routeProvider.when('/resources/:r_id/update', {
		templateUrl: 'app/resources/update.tpl.html',
		controller: 'ResourceUpdateController'
	});
	$routeProvider.when('/resources/:r_id', {
		templateUrl: 'app/resources/resource.tpl.html',
		controller: 'ResourceController'
	});
	
}])

.controller('ResourceListController', ['$scope', 'Resource', '$routeParams', 'REST_PATH', function($scope, Resource, $routeParams, REST_PATH) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.resources, page).get(
			    {},
			    function (data) {
			        $scope.resources = data;

			    },
			    function (data) {
			        //error handling goes here
			});
		};
	};

	$scope.remove = function(r_id) {
		Resource.path(REST_PATH.resources).delete(
		    {r_id: r_id},
		    function (data) {
		        console.log('deleted');

		    },
		    function (data) {
		        //error handling goes here
		});
	}

	Resource.path(REST_PATH.resources).get(
	    {},
	    function (data) {
	        $scope.resources = data;

	    },
	    function (data) {
	        //error handling goes here
	});
}])

.controller('ResourceController', ['$scope', 'Resource', '$routeParams', 'REST_PATH', function($scope, Resource, $routeParams, REST_PATH) {
	Resource.path(REST_PATH.resources).get(
	    {r_id: $routeParams.r_id},
	    function (data) {
	        $scope.item = data;
	    },
	    function (data) {
	        //error handling goes here
	});
}])

.controller('ResourceCreateController', ['$scope', 'Resource', 'Cud', 'REST_PATH', function($scope, Resource, Cud, REST_PATH) {

	Resource.path(REST_PATH.tags).get(
	    {},
	    function (data) {
	        $scope.tags = data;

	    },
	    function (data) {
	        //error handling goes here
	});

	$scope.resource = {};

	$scope.processForm = function() {

		Cud.save($scope.resource).then(function(response) {
			console.log('saved');
		}).then({
			// Error
		});
	}
}])

.controller('ResourceUpdateController', ['$scope', 'Resource', 'Cud', '$routeParams', 'REST_PATH', function($scope, Resource, Cud, $routeParams, REST_PATH) {

	Resource.path(REST_PATH.resources).get(
	    {r_id: $routeParams.r_id},
	    function (data) {
	        $scope.resource = data;
	    },
	    function (data) {
	        //error handling goes here
	});

	$scope.processForm = function() {

		Cud.save($scope.resource).then(function(response) {
			console.log('saved');
		}).then({
			// Error
		});
	}
}]);






