'use strict'

const gulp   = require ('gulp');
const concat = require ('gulp-concat');
const rename = require ('gulp-rename');
const del    = require ('del');


// Задача: удаляем не актуальный файл "ac.ahk"

gulp.task('del-ac', function() {
  return del.sync('./build/ac.ahk');
});

// Задача: собираем все автозамены в один файл "ac.ahk"
gulp.task('concat-ac', ['del-ac'], function() {
  return gulp.src(['./**/autocorrect/*-header.ahk', './**/autocorrect/*-invar-*.ahk'])
  .pipe(concat('ac.ahk'))
  .pipe(gulp.dest('./build/'));
});