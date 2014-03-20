/* Resources factory */

angular.module('app.factories', [])
	.factory('webservice', function() {

		var factory = {};

		factory.load = function() {

			$http.get('http://localhost:3000/api/resources')
			.success(function(data, status, headers, config) {
				resources = data;
			})
			.error(function() {
				console.log('error');
			});

	        return resources;
	    }
		
	});