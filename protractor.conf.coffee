exports.config = {
  framework: 'jasmine',
  seleniumServerJar: './node_modules/protractor/node_modules/webdriver-manager/selenium/selenium-server-standalone-2.53.1.jar',
  specs: ['spec/e2e/**/*.coffee']
  baseUrl: 'http://localhost:9000'
  capabilities: {
    maxInstances: 1
    browserName: 'phantomjs'
  }
  #multiCapabilities: [{
  #  browserName: 'firefox'
  #}, {
  #  browserName: 'chrome'
  #}]
}
