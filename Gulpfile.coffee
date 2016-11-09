gulp        = require 'gulp'
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

gulp.task 'browserify', ->
  bundler = browserify
    entries:  'app/scripts/main.coffee',
    debug: true,
    transform: ['coffeeify', 'hbsfy'],
    extensions: ['.coffee']

  bundler = watchify(bundler)

  rebundle = =>
    bundler.bundle()
      .on 'error', $.util.log
      .pipe source('main.js')
      .pipe gulp.dest('dist/scripts')

  bundler.on 'update', rebundle
  rebundle()

gulp.task 'images', ->
  gulp.src 'app/images/**/*'
    .pipe $.cache($.imagemin({
      progressive: true,
      interlaced: true
    }))
    .pipe gulp.dest('dist/images')
    .pipe $.size({title: 'images'})

gulp.task 'fonts', ->
  gulp.src([
    'app/{,styles/}fonts/**/*',
    'node_modules/bootstrap/dist/fonts/**/*'
  ])
    .pipe $.flatten()
    .pipe gulp.dest('dist/fonts')

gulp.task 'styles', ->
  gulp.src 'app/styles/**/*.sass'
    .pipe $.sourcemaps.init()
    .pipe sassGlob()
    .pipe sass()
    .pipe $.postcss([
      require('autoprefixer')({browsers: ['last 1 version']})
    ])
    .pipe $.sourcemaps.write()
    .pipe gulp.dest('dist/styles')
    .pipe reload({ stream: true })

gulp.task 'html', ['styles'], ->
  gulp.src 'app/*.html'
    .pipe $.htmlReplace()
    .pipe $.useref()
    .pipe $.if('*.css', $.csso())
    .pipe $.if('*.html', $.minifyHtml({conditionals: true, loose: true}))
    .pipe gulp.dest('dist')

gulp.task 'extras', ->
  gulp.src([
    'app/*.*',
    '!app/*.html'
  ], {
    dot: true
  }).pipe gulp.dest('dist')

gulp.task 'tdd', (callback) ->
  karma = new KarmaServer({
    configFile: __dirname + '/karma.conf.js'
  }, callback)

  karma.start()

gulp.task 'test', (callback) ->
  karma = new KarmaServer({
    configFile: __dirname + '/karma.conf.js',
    singleRun: true,
    browsers: ['PhantomJS'],
    reporters: ['dots', 'junit'],
    junitReporter: {
      outputFile: '.tmp/test-results.xml'
    }
  }, callback)

  karma.start();

gulp.task 'serve', ['build'], ->
  browserSync
    open: false,
    notify: false,
    port: 9000,
    ui: { port: 9001 },
    server: {
      baseDir: ['dist'],
      routes: { '/node_modules': 'node_modules' }
    }

  gulp.watch([
    'app/*html',
    'app/scripts/**/*.coffee',
    'app/images/**/*',
    'dist/**/*.js',
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
  gulp.src 'dist/**/*'
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
