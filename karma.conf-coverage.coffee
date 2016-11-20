_ = require 'lodash'

module.exports = (config) ->
  'use strict'

  config.set
    singleRun: true,
    action: 'run'
    frameworks: ['browserify', 'jasmine-jquery', 'jasmine'],

    files: [
      '**/scripts/**/*.coffee'
      'spec/unit/specHelper.coffee'
      'spec/unit/**/*Spec.coffee'
    ],

    exclude: ['app/scripts/app.coffee'],

    preprocessors: {
      'app/scripts/**/*.coffee': ['browserify', 'coverage']
      'spec/unit/**/*.coffee': ['browserify']
    },

    reporters: ['progress', 'coverage']

    coverageReporter: {
      type: 'lcov'
      dir: 'coverage/'
      subdir: '.'
    }

    browserify: {
      paths: ['app/scripts'],
      transform: ['coffeeify', 'hbsfy'],
      extensions: ['.coffee', '.hbs']
    },

    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    browsers: ['Chrome'],

    plugins: [
      'karma-browserify',
      'karma-jasmine',
      'karma-jasmine-jquery',
      'karma-spec-reporter',
      'karma-junit-reporter',
      'karma-coverage',
      'karma-growl',
      'karma-chrome-launcher',
      'karma-phantomjs-launcher'
    ]
