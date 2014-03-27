angular.module('crud', ['ngResource'])

.factory('Resource', ['$resource', 'PAGE_LIMIT', '$cookies', function($resource, PAGE_LIMIT, $cookie) {

	var factory = {};

	factory.path = function(restPath, page) {
		var authToken = $cookie.authToken;

		var pagePath = '';
		if (page != null) {
			pagePath = '?limit=' + PAGE_LIMIT + '&page=' + page;
		} else {
			pagePath = '?limit=' + PAGE_LIMIT;
		}
		return $resource('http://localhost\\:3001/api/' + restPath + '/:r_id' + pagePath, {r_id: '@id'}, {
			save: {
				method: 'POST',
				headers: {'X-auth-token': authToken}
			},
			delete: {
				method: 'DELETE',
				isArray: false,
				headers: {'X-auth-token': authToken}
			},
			update: {
				method: 'PUT',
				headers: {'X-auth-token': authToken}
			}
			
		});
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