require.config({
  paths: {
    "jquery": "https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min",
    "underscore": "lib/underscore",
  }
});


require(['lib/modules/template'], function(template) {
  template.showName("Jack");
});