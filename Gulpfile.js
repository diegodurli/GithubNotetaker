var gulp    = require('gulp');
var coffee  = require('gulp-coffee');
var exec    = require('gulp-exec');
var lint    = require('gulp-coffeelint');
var stylish = require('coffeelint-stylish');

var config = {
  watchers: {
    index: '*.coffee',
    files: 'App/**/*.coffee'
  },
  index: {src: 'index.ios.coffee', dist: './'},
  files: {src: 'App/**/*.coffee', dist: 'App/Build'}
}

gulp.task('build', function() {
  var options = {
    continueOnError: false, // default = false, true means don't emit error event
    pipeStdout: true
  };

  gulp.src(config.files.src)
    .pipe(exec('cjsx-transform <%= file.path %>', options))
    .pipe(lint(null, {max_line_length: {value: 90}}))
    .pipe(lint.reporter(stylish))
    .pipe(coffee({bare: true}).on('error', function(error) {}))
    .pipe(gulp.dest(config.files.dist));
});

gulp.task('cjsx', ['build'], function() {
  var options = {
    continueOnError: false, // default = false, true means don't emit error event
  	pipeStdout: true
  };

  gulp.src(config.index.src)
    .pipe(exec('cjsx-transform <%= file.path %>', options))
    .pipe(coffee({bare: true}).on('error', function(error) {}))
    .pipe(gulp.dest(config.index.dist));
});

gulp.task('watch', ['cjsx'], function() {
  gulp.watch(config.watchers.index, ['cjsx']);
  // gulp.watch(config.watchers.files, ['build']);
  gulp.watch(config.watchers.files, function (file) {
    var options = {
      continueOnError: false, // default = false, true means don't emit error event
      pipeStdout: true
    };

    gulp.src('App/**/*' + file.path.split('/').pop())
      .pipe(exec('cjsx-transform <%= file.path %>', options))
      .pipe(lint(null, {max_line_length: {value: 90}}))
      .pipe(lint.reporter(stylish))
      .pipe(coffee({bare: true}).on('error', function(error) {}))
      .pipe(gulp.dest(config.files.dist));
  });
});

gulp.task('default', ['watch']);
