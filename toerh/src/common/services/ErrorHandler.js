angular.module('errors', [])

.factory('Errors', function ($rootScope, $timeout) {

    return {
        message: function(message, isError) {
            if (isError) {
                $rootScope.errorsClass = 'error';
                $rootScope.errors = message;
            } else {
                $rootScope.errorsClass = 'success';
                $rootScope.errors = message;  
            }

            $timeout(function() {
                $rootScope.errors = '';
            }, 3000)
            
        }
    };

});