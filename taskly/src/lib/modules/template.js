define(['underscore', 'jquery'], function() {

	var showName = function(n) {
		var temp = _.template("Hello <%= name %>!");
		$(".content").html(temp({ name: n}));
	};

	return {
		showName: showName
	};
});



