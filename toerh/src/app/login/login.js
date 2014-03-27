angular.module('login', [])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/login', {
		templateUrl: 'app/login/login.tpl.html',
		controller: 'LoginController'
	});
}])

.controller('LoginController', ['$rootScope', '$scope', '$location', '$cookies', function($rootScope, $scope, $location, $cookie) {
	function getURLParameter(name) {
  		return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
	}

	$cookie.authToken = getURLParameter('auth_token');

	window.location.href = '/toerh/src';
}]);