_ = require 'lodash'

module.exports = (config) ->
  'use strict'

  config.set
    autoWatch: true,
    basePath: '',

    frameworks: ['browserify', 'jasmine-jquery', 'jasmine'],

    files: [
      'spec/unit/specHelper.coffee',
      'spec/unit/**/*Spec.coffee'
    ],

    preprocessors: {
      'spec/unit/specHelper.coffee': ['browserify'],
      'spec/unit/**/*Spec.coffee': ['browserify']
    },

    browserify: {
      paths: ['app/scripts'],
      transform: ['coffeeify', 'hbsfy'],
      extensions: ['.coffee', '.hbs']
    },

    reporters: ['spec', 'growl'],
    exclude: [],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    singleRun: false,
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
