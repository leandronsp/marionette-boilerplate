Marionette Boilerplate (Coffeescript)
======================

[![Build Status](https://travis-ci.org/leandronsp/marionette-boilerplate.svg?branch=master)](https://travis-ci.org/leandronsp/marionette-boilerplate)
[![Code Climate](https://codeclimate.com/github/leandronsp/marionette-boilerplate/badges/gpa.svg)](https://codeclimate.com/github/leandronsp/marionette-boilerplate)

Inspired by [es6-marionette](https://github.com/abiee/es6-marionette)

Looking for boilerplate projects to start working with Backbone.Marionette using Coffeescript I didn't found a project that fit my requirements, so I take the best part of other projects and put all together here. This project can be used to bootstrap new projects with Coffeescript support.

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
 - Protractor (Selenium)
 - Jasmine
 
 Setup
 -----
 	$ npm install
	$ webdriver-manager update (need for e2e tests)

Build
------
If you want to build the project run.

    $ gulp build

It will compile the project and put the result under `dist` directory. You can run the compiled project also.

    $ gulp serve:dist
   

Unit Testing
---------
Two options exists to run tests, the first one is for development process and aims to practice Test Driven Development.

    $ gulp tdd

It will open a Google Chrome instance and run all tests on it, when a file is updated tests will be run again. You can see the rests as a notification or in the console.
The other option to run tests is for Continuous Integration purposes, it will run all the tests against PanthomJS and output a jUnit format file for analysis.

    $ gulp test

You can get the results at `.tmp/test-results.xml`.


E2E Testing
------------
By calling :

	$ gulp e2e

Protractor will run a selenium driver and execute the scenarios under `e2e/scenarios/**/*.coffee`. 	

Contribution
---------------
Tested on Node 6.x+.
If you have ideas or find an error feel free to submit a PR.

Licence
-------
Licensed under the MIT license.
