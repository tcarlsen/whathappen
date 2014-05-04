var gulp = require('gulp');
var coffee = require('gulp-coffee');
var ngmin = require('gulp-ngmin');
var uglify = require('gulp-uglify');
var styl = require('gulp-styl');
var concat = require('gulp-concat');
var csso = require('gulp-csso');
var refresh = require('gulp-livereload');
var imagemin = require('gulp-imagemin');
var lr = require('tiny-lr');
var server = lr();

gulp.task('lr-server', function () {
  server.listen(35729, function (err) {
    if (err) {
        return console.log(err);
    }
  });
});

gulp.task('scripts', function () {
  gulp.src(['src/coffee/**'])
    .pipe(coffee())
    .pipe(ngmin())
    //.pipe(uglify())
    .pipe(concat('scripts.min.js'))
    .pipe(gulp.dest('app'))
    .pipe(refresh(server));
});

gulp.task('styles', function () {
  gulp.src(['src/css/**'])
    .pipe(styl())
    .pipe(csso())
    .pipe(concat('styles.min.css'))
    .pipe(gulp.dest('app'))
    .pipe(refresh(server));
});

gulp.task('images', function () {
  gulp.src(['src/img/**'])
    .pipe(imagemin())
    .pipe(gulp.dest('app/img'))
    .pipe(refresh(server));
});

gulp.task('doms', function () {
  gulp.src(['src/index.html'])
    .pipe(gulp.dest('app'))
    .pipe(refresh(server));

  gulp.src(['src/partials/*.html'])
    .pipe(gulp.dest('app/partials'))
    .pipe(refresh(server));
});

gulp.task('watch', function () {
  gulp.watch('src/coffee/**', ['scripts']);
  gulp.watch('src/css/**', ['styles']);
  gulp.watch('src/img/**', ['images']);
  gulp.watch(['src/index.html', 'src/partials/*.html'], ['doms']);
});

gulp.task('default', ['lr-server', 'scripts', 'styles', 'images', 'doms', 'watch']);
