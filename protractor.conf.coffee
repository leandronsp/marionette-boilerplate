exports.config = {
  framework: 'jasmine',
  seleniumServerJar: './node_modules/protractor/node_modules/webdriver-manager/selenium/selenium-server-standalone-2.53.1.jar',
  specs: ['e2e/scenarios/**/*.coffee']
  baseUrl: 'http://localhost:9000'
  #capabilities: {
  #  browserName: 'firefox'
  #}
  #multiCapabilities: [{
  #  browserName: 'firefox'
  #}, {
  #  browserName: 'chrome'
  #}]
}
