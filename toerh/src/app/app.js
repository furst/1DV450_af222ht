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
  	'buttonDirective'
])

.constant('REST_PATH', {
	resources: 'resources',
	tags: 'tags',
	users: 'users',
	licenses: 'licenses',
	types: 'types'
})

.constant('PAGE_LIMIT', 5)

.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
  	$routeProvider.when('/', {templateUrl: 'app/start.tpl.html', controller: 'AppController'});

  	$httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
  	$httpProvider.defaults.headers.common.Authorization = 'Token ' + 'a50b507c261f7df8615fb0d3ae11833b';

}])

.controller('AppController', ['$scope', '$cookies', '$routeParams', function($scope, $cookies, $routeParams) {
}]);
