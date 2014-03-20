'use strict';

/* Controllers */

angular.module('app.controllers', []).
  	controller('ResourceController', function($scope, resources) {
  		$scope.test = 'test';
  		//console.log(resources.getResources());
  	});