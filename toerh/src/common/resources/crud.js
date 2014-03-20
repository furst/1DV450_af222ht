angular.module('crud', ['ngResource'])

.factory('Resource', ['$resource', 'PAGE_LIMIT', function($resource, PAGE_LIMIT) {

	var factory = {};

	factory.path = function(restPath, page) {
		var pagePath = '';
		if (page != null) {
			pagePath = '?limit=' + PAGE_LIMIT + '&page=' + page;
		};
		return $resource('http://localhost\\:3001/api/' + restPath + '/:r_id' + pagePath, {r_id: '@id'});
	}
	
	return factory;
}])

.factory('Cud', ['$http', function($http) {
	var factory = {};

	factory.save = function(data) {
		return $http.post('http://localhost:3001/api/resources', data);
	}

	factory.update = function(data) {
		return $http.put();
	}

	return factory;
}])

.factory('ResourceChildren', ['$http', 'PAGE_LIMIT', function($http, PAGE_LIMIT) {
	var factory = {};

	factory.get = function(t_id, restPath, page) {
		return $http.get('http://localhost:3001/api/' + restPath + '/' + t_id + '/resources?limit=' + PAGE_LIMIT + '&page=' + page);
	};

	return factory;
	
}]);