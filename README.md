Marionette Boilerplate (Coffeescript)
======================

Inspired by [es6-marionette](https://github.com/abiee/es6-marionette)

[![Code Climate](https://codeclimate.com/github/leandronsp/marionette-boilerplate/badges/gpa.svg)](https://codeclimate.com/github/leandronsp/marionette-boilerplate)

What's inside
----------------
Batteries included:
 - Gulp
 - Bootstrap
 - SASS
 - jQuery
 - Underscore
 - Backbone
 - Marionette
 - Handlebars
 - BrowserSync
 - Karma
 - Jasmine

Build
------
If you want to build the project run.

    $ gulp build

It will compile the project and put the result under `dist` directory. You can run the compiled project also.

    $ gulp serve:dist

Testing
---------
Two options exists to run tests, the first one is for development process and aims to practice Test Driven Development.

    $ gulp tdd

It will open a Google Chrome instance and run all tests on it, when a file is updated tests will be run again. You can see the rests as a notification or in the console.
The other option to run tests is for Continuous Integration purposes, it will run all the tests against PanthomJS and output a jUnit format file for analysis.

    $ gulp test

You can get the results at `.tmp/test-results.xml`.
