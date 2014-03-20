/* Resources factory */

angular.module('app.factories', [])
	.factory('resources', ['webservice', function(dataStorage) {

		var resources = [];
		var factory = {};

		factory.getResources = function () {
			resources = dataStorage.load() || [];

			return resources;
		}

		return factory;

	}]);