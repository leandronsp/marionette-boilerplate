gulp        = require 'gulp'
open        = require 'gulp-open'
browserify  = require 'browserify'
sassify     = require 'sassify'
hbsfy       = require 'hbsfy'
browserify  = require 'browserify'
watchify    = require 'watchify'
sass        = require 'gulp-sass'
sassGlob    = require 'gulp-sass-glob'
source      = require 'vinyl-source-stream'
buffer      = require 'vinyl-buffer'
browserSync = require 'browser-sync'
reload      = browserSync.reload
del         = require 'del'

$ = require('gulp-load-plugins')()
KarmaServer = require('karma').Server
protractor  = require('gulp-protractor').protractor

jsonServer = require 'gulp-json-srv'

Params = {
  browserifyEntries: 'app/scripts/main.coffee'
  targetFolder: 'dist'
}

gulp.task 'browserify', ->
  bundler = browserify
    entries:  Params.browserifyEntries,
    debug: true,
    transform: ['coffeeify', 'hbsfy'],
    extensions: ['.coffee']

  bundler = watchify(bundler)

  rebundle = =>
    bundler.bundle()
      .on 'error', $.util.log
      .pipe source('main.js')
      .pipe gulp.dest("#{Params.targetFolder}/scripts")

  bundler.on 'update', rebundle
  rebundle()

gulp.task 'images', ->
  gulp.src 'app/images/**/*'
    .pipe $.cache($.imagemin({
      progressive: true,
      interlaced: true
    }))
    .pipe gulp.dest("#{Params.targetFolder}/images")
    .pipe $.size({title: 'images'})

gulp.task 'fonts', ->
  gulp.src([
    'app/{,styles/}fonts/**/*',
    'node_modules/bootstrap/dist/fonts/**/*'
  ])
    .pipe $.flatten()
    .pipe gulp.dest("#{Params.targetFolder}/fonts")

gulp.task 'styles', ->
  gulp.src 'app/styles/**/*.sass'
    .pipe $.sourcemaps.init()
    .pipe sassGlob()
    .pipe sass()
    .pipe $.postcss([
      require('autoprefixer')({browsers: ['last 1 version']})
    ])
    .pipe $.sourcemaps.write()
    .pipe gulp.dest("#{Params.targetFolder}/styles")
    .pipe reload({ stream: true })

gulp.task 'html', ['styles'], ->
  gulp.src 'app/*.html'
    .pipe $.htmlReplace()
    .pipe $.useref()
    .pipe $.if('*.css', $.csso())
    .pipe $.if('*.html', $.minifyHtml({conditionals: true, loose: true}))
    .pipe gulp.dest(Params.targetFolder)

gulp.task 'extras', ->
  gulp.src([
    'app/*.*',
    '!app/*.html'
  ], {
    dot: true
  }).pipe gulp.dest(Params.targetFolder)

gulp.task 'test:unit', (callback) ->
  karma = new KarmaServer({
    configFile: __dirname + '/karma.conf.coffee',
    singleRun: true,
    browsers: ['PhantomJS'],
    reporters: ['dots', 'junit'],
    junitReporter: {
      outputFile: '.tmp/test-results.xml'
    }
  }, callback)

  karma.start()

gulp.task 'test:unit:watch', (callback) ->
  karma = new KarmaServer({
    configFile: __dirname + '/karma.conf.coffee'
  }, callback)

  karma.start()

gulp.task 'test:unit:coverage', (callback) ->
  karma = new KarmaServer({
    configFile: __dirname + '/karma.conf-coverage.coffee'
  }, callback)

  karma.start()

gulp.task 'coverage', ['test:unit:coverage'], ->
  gulp.src './coverage/lcov-report/index.html'
    .pipe open()

gulp.task 'test:e2e', ['serve'], ->
  gulp.src(['spec/e2e/**/*.coffee'])
    .pipe protractor({ configFile: 'protractor.conf.coffee' })
    .on 'error', $.util.log
    .once 'end', -> process.exit()

gulp.task 'test:e2e:watch', ['serve'], ->
  bundle = =>
    gulp.src(['spec/e2e/**/*.coffee'])
      .pipe protractor({ configFile: 'protractor.conf.coffee' })
      .on 'error', $.util.log

  gulp.watch([
    'app/*html',
    'app/scripts/**/*.coffee',
    'app/images/**/*',
    'spec/e2e/**/*.coffee',
    'spec/e2e/mocks/api.json',
    'dist/**/*.js',
  ]).on 'change', bundle

  bundle()

server = jsonServer.create({
  port: 8001
  baseUrl: '/api'
})

gulp.task 'serve:mock', ['serve:api', 'serve'], ->
  gulp.watch(['api/response.json'], ['serve:api'])

gulp.task 'serve:api', ->
  gulp.src 'api/response.json'
    .pipe server.pipe()

gulp.task 'serve', ['build'], ->
  browserSync
    open: false,
    notify: false,
    port: 9000,
    ui: { port: 9001 },
    server: {
      baseDir: [Params.targetFolder],
      routes: { '/node_modules': 'node_modules' }
    }

  gulp.watch([
    'app/*html',
    'app/scripts/**/*.coffee',
    'app/images/**/*',
    'api/response.json',
    "#{Params.targetFolder}/**/*.js",
  ]).on 'change', reload

  gulp.watch 'app/styles/**/*.sass', ['styles']

gulp.task 'serve:dist', ->
  browserSync
    open: false,
    notify: false,
    port: 9000,
    ui: { port: 9001 },
    server: {
      baseDir: ['dist'],
      routes: { '/node_modules': 'node_modules' }
    }

gulp.task 'build', ['browserify', 'html', 'images', 'fonts', 'extras'], ->
  size = $.size({title: 'build', gzip: true })
  gulp.src "#{Params.targetFolder}/**/*"
    .pipe size
    .pipe $.notify
      onLast: true,
      title: 'Build complete',
      message: =>
        return 'Total scripts size (gzip) ' + size.prettySize

gulp.task 'clean', (callback) ->
  del = require('del')
  del ['dist'], ->
    $.cache.clearAll(callback)

gulp.task 'default', ['clean'], ->
  gulp.start 'build'
