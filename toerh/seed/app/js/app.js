'use strict';

angular.module('app', [
  	'ngRoute',
  	'app.filters',
  	'app.directives',
  	'app.factories',
  	'app.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  	$routeProvider.when('/view1', {templateUrl: 'partials/partial1.html', controller: 'ResourceController'});
  	$routeProvider.when('/view2', {templateUrl: 'partials/partial2.html', controller: 'ResourceController'});
  	$routeProvider.otherwise({redirectTo: '/view1'});
}]);
