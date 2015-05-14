var gulp    = require('gulp'),
gutil   = require('gulp-util'),
uglify  = require('gulp-uglify'),
concat  = require('gulp-concat');
var del     = require('del');
var minifyHTML = require('gulp-minify-html');
var minifyCSS  = require('gulp-minify-css');
var run = require('gulp-run');
var karma = require('karma').server;

gulp.task('minify', function () {
  gulp.src('./app.coffee')
  .pipe(uglify())
  .pipe(gulp.dest('minified'));

  gulp.src('./public/javascript/*.js')
  .pipe(uglify())
  .pipe(gulp.dest('minified'));

  gulp.src('./views/*.jade')
  .pipe(minifyHTML())
  .pipe(gulp.dest('./minified/'))

  gulp.src('./public/stylesheets/*.css')
  .pipe(minifyCSS({keepBreaks:true}))
  .pipe(gulp.dest('./minified/'))
});

gulp.task('clean', function(cb) {
  del(['minified/*'], cb);
});

gulp.task('tests', function() {
  run('mocha --compilers coffee:coffee-script/register -R spec public/tests/tests.coffee').exec()
});

gulp.task('default', function(done) {
  run('mocha --compilers coffee:coffee-script/register -R spec public/tests/tests.coffee').exec()
});
