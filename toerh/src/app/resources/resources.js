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

.controller('ResourceListController', ['$scope', 'Errors', 'Resource', '$routeParams', 'REST_PATH', '$cookies', function($scope, Errors, Resource, $routeParams, REST_PATH, $cookie) {

	$scope.page = function(page) {
		if (page != null) {
			page = page.href.substring(page.href.indexOf('page') + 5);
			Resource.path(REST_PATH.resources, page).get(
			    {},
			    function (data) {
			        $scope.resources = data;

			    },
			    function (data) {
			        Errors.message('Data kunde inte hämtas', true);
			});
		};
	};

	$scope.remove = function(r_id) {

		var resourceToRemove = $scope.resources.resources[r_id];

		Resource.path(REST_PATH.resources).delete(
		    {r_id: resourceToRemove.resource.data.id},
		    function (data) {
		        $scope.resources.resources.splice(r_id, 1);
		    },
		    function (data) {
		        Errors.message('Resursen kunde inte tas bort', true);
		});
	}

	Resource.path(REST_PATH.resources).get(
	    {},
	    function (data) {
	        $scope.resources = data;
	        if ($cookie.authToken == ' ') {
	        	$scope.loggedIn = false;
	        } else {
	        	$scope.loggedIn = true;
	        }
	    },
	    function (data) {
	        Errors.message('Resurserna kunde inte hämtas', true);
	});
}])

.controller('ResourceController', ['$scope', 'Errors', 'Resource', '$routeParams', 'REST_PATH', function($scope, Errors, Resource, $routeParams, REST_PATH) {
	Resource.path(REST_PATH.resources).get(
	    {r_id: $routeParams.r_id},
	    function (data) {
	        $scope.item = data;
	    },
	    function (data) {
	        Errors.message('Resursen kunde inte hämtas', true);
	});
}])

.controller('ResourceCreateController', ['$scope', 'Errors', 'Resource', 'REST_PATH', '$location', function($scope, Errors, Resource, REST_PATH, $location) {

	Resource.path(REST_PATH.tags).get(
	    {},
	    function (data) {
	        $scope.tags = data;
	    },
	    function (data) {
	        Errors.message('Taggarna kunde inte hämtas', true);
	});

	Resource.path(REST_PATH.licenses).get(
	    {},
	    function (data) {
	        $scope.licenses = data;
	    },
	    function (data) {
	        Errors.message('Licenserna kunde inte hämtas', true);
	});

	Resource.path(REST_PATH.types).get(
	    {},
	    function (data) {
	        $scope.types = data;
	    },
	    function (data) {
	        Errors.message('Resurstyperna kunde inte hämtas', true);
	});

	$scope.resource = {};

	$scope.processForm = function() {
		Resource.path(REST_PATH.resources).save(
			$scope.resource,
			function(data) {
				$location.path('/resources');
				Errors.message('Resursen skapades', false);
			},
			function(data) {
				Errors.message(data.data.messages, true);
			}
		);
	}
}])

.controller('ResourceUpdateController', ['$scope', 'Errors', 'Resource', '$routeParams', 'REST_PATH', function($scope, Errors, Resource, $routeParams, REST_PATH) {

	Resource.path(REST_PATH.resources).get(
	    {r_id: $routeParams.r_id},
	    function (data) {
	        $scope.resource = data;
	    },
	    function (data) {
	        Errors.message('Resursen kunde inte hämtas', true);
	});

	Resource.path(REST_PATH.tags).get(
	    {},
	    function (data) {
	        $scope.tags = data;
	    },
	    function (data) {
	        Errors.message('Taggarna kunde inte hämtas', true);
	});

	Resource.path(REST_PATH.licenses).get(
	    {},
	    function (data) {
	        $scope.licenses = data;
	    },
	    function (data) {
	        Errors.message('Licenserna kunde inte hämtas', true);
	});

	Resource.path(REST_PATH.types).get(
	    {},
	    function (data) {
	        $scope.types = data;
	    },
	    function (data) {
	        Errors.message('Resurstyperna kunde inte hämtas', true);
	});

	$scope.processForm = function() {
		Resource.path(REST_PATH.resources).update(
			{r_id: $scope.resource.resource.data.id},
			$scope.resource.resource.data,
			function(data) {
				Errors.message('Resursen uppdaterad', false);
			},
			function(data) {
				Errors.message('Resursen kunde inte uppdateras', true);
			}
		);
	}
}]);






