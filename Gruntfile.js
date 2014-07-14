module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src: ['javascripts/src/jquery.js', 'javascripts/src/*.js'],
        dest: 'javascripts/application.js'
      }
    },

    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: ['*.js', '!*.min.js'],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    sass: {
      dist: {
        files: [{
          expand: true,
          cwd: 'stylesheets/sass',
          src: ['*.scss'],
          dest: 'stylesheets',
          ext: '.css'
        }]
      }
    },

    cssmin: {
      minify: {
        expand: true,
        cwd: 'stylesheets/',
        src: ['*.css', '!*.min.css'],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    watch: {
      concat: {
        files: ['javascripts/src/*.js'],
        tasks: "concat"
      },

      uglify: {
        files: ['javascripts/application.js', 'javascripts/application.min.js'],
        tasks: ['uglify']
      },

      sass: {
        files: ['stylesheets/sass/*.scss', '!stylesheets/*.css'],
        tasks: ['sass']
      },

      cssmin: {
        files: ['stylesheets/*.css', '!stylesheets/*.min.css'],
        tasks: ['cssmin']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['concat', 'uglify', 'sass', 'cssmin']);
};
