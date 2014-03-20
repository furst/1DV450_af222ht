angular.module('trimFilter', [])

.filter('trim', function(limitToFilter) {
	return function(input, limit) {
		if (input.length > limit) {
			return limitToFilter(input, limit-3) + '...';
		}
		return input;
	};
});