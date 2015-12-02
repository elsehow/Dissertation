var gulp = require('gulp')
  , exec = require('child_process').exec
  , path = require('path')
  , browserSync = require('browser-sync').create();

function pathTo (f) {
  return path.join(__dirname, f)
}

gulp.task('do-script', function () {
  exec('make html', browserSync.reload)
});

function setup () {

  // Serve files from dist
  browserSync.init({
    server: {
      baseDir: "./dist"
     }
  });

  gulp.watch('src/*.md', ['do-script'])
  // gulp.watch('dist/index.html').on('change', browserSync.reload)
}

// do an initial build
exec('make html', function (err, res) {
  // catch any errors
  if (err) 
   throw err
  // if it worked, get going
  else 
    setup()
})
