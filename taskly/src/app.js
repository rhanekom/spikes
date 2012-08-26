require.config({
  paths: {
    "jquery": "https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min",
    "underscore": "lib/underscore",
  }
});


require(['lib/modules/template'], function(template) {
  template.showName("Somebod2y");
});
