_ = require 'lodash'

module.exports = (config) ->
  'use strict'

  config.set
    autoWatch: true,
    basePath: '',

    frameworks: ['browserify', 'jasmine'],

    files: [
      'spec/specHelper.coffee',
      'spec/**/*Spec.coffee'
    ],

    preprocessors: {
      'spec/specHelper.coffee': ['browserify'],
      'spec/**/*Spec.coffee': ['browserify']
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
      'karma-spec-reporter',
      'karma-junit-reporter',
      'karma-growl',
      'karma-chrome-launcher',
      'karma-phantomjs-launcher'
    ]
