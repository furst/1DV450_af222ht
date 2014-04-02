angular.module('app', [
  	'ngRoute',
  	'ngCookies',
  	'resources',
  	'tags',
  	'users',
  	'licenses',
  	'types',
  	'crud',
  	'trimFilter',
  	'buttonDirective',
    'login',
    'errors'
])

.constant('REST_PATH', {
	resources: 'resources',
	tags: 'tags',
	users: 'users',
	licenses: 'licenses',
	types: 'types'
})

.constant('PAGE_LIMIT', 20)

.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
  	$routeProvider.when('/', {templateUrl: 'app/start.tpl.html', controller: 'AppController'});

  	$httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
  	$httpProvider.defaults.headers.common.Authorization = 'Token ' + '82c3ef38bbccc6348e36acc508cd41dd';
}])

.controller('AppController', ['$scope', '$cookies', '$routeParams', function($scope, $cookies, $routeParams) {
}]);
