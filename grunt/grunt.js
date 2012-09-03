/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    meta: {
      version: '0.1.0',
      banner: '/*! GruntTest - v<%= meta.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '* http://riaanhanekom.com/\n' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
        'Riaan Hanekom; Licensed MIT */'
    },
    lint: {
      files: ['grunt.js', 'lib/**/*.js', 'test/**/*.js']
    },
    qunit: {
      files: ['test/unit/**/*.html']
    },
    concat: {
      dist: {
        src: ['<banner:meta.banner>', '<file_strip_banner:lib/Calculator.js>'],
        dest: 'dist/Calculator.js'
      }
    },
    min: {
      dist: {
        src: ['<banner:meta.banner>', '<config:concat.dist.dest>'],
        dest: 'dist/Calculator.min.js'
      }
    },
    watch: {
      files: '<config:lint.files>',
      tasks: 'lint qunit'
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        boss: true,
        eqnull: true,
        browser: true
      },
      globals: {}
    },
    jasmine : {
      src : 'lib/**/*.js',
      specs : 'test/specs/**/*.js',
      junit : {
        output : 'junit/'
      }
     },
    uglify: {}
  });


  grunt.loadNpmTasks('grunt-jasmine-runner');

  // Default task.
  grunt.registerTask('default', 'lint qunit jasmine concat min');
};
