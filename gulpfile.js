'use strict'

const gulp   = require ('gulp');
const concat = require ('gulp-concat');
const rename = require ('gulp-rename');
const del    = require ('del');


// Задача: удаляем не актуальный файл "ac.ahk"

gulp.task('del_ac', function() {
  return del.sync('autocorrect/ac.ahk');
});

// Задача: собираем все автозамены в один файл "ac.ahk"
gulp.task('concat', ['del_ac'], function() {
  return gulp.src('./autocorrect/**/*.ahk')
  .pipe(concat('ac.ahk'))
  .pipe(gulp.dest('./autocorrect/'));
});