module.exports = function(grunt) {

  var globalConfig = {
    themeDir: 'themes/bijou'
  };

  // Project configuration.
  grunt.initConfig({
    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      dist: {
        files: {
          '<%=globalConfig.themeDir %>/css/app.css' : '<%=globalConfig.themeDir %>/scss/app.scss',
          '<%=globalConfig.themeDir %>/css/editor.css' : '<%=globalConfig.themeDir %>/scss/editor.scss'
        },                  // Target
        options: {              // Target options
          style: 'compressed',
          loadPath: [
          'cfo-project/bower_components/foundation/scss'
          ]
        }
      }
    },
    //concat all the files into the build folder

    concat: {
      js:{
        src: [
          'cfo-project/build/build.src.js',
          '<%=globalConfig.themeDir %>/javascript/*.js'
        ],
        dest: '<%=globalConfig.themeDir %>/build/build.src.js'
      }
    },

    //minify those concated files
    //toggle mangle to leave variable names intact

    uglify: {
      my_target:{
        files:{
        '<%=globalConfig.themeDir %>/build/build.js': ['<%=globalConfig.themeDir %>/build/build.src.js'],
        }
      }
    },

    watch: {
      scripts: {
        files: ['<%=globalConfig.themeDir %>/js/*.js', '<%=globalConfig.themeDir %>/js/**/*.js', 'cfo-project/build/build.src.js'],
        tasks: ['concat', 'uglify'],
        options: {
          spawn: true,
          livereload: true
        }
      },
      css: {
        files: ['<%=globalConfig.themeDir %>/scss/*.scss',
                '<%=globalConfig.themeDir %>/scss/**/*.scss',
                '<%=globalConfig.themeDir %>/scss/**/**/*.scss',
                'cfo-project/scss/*.scss',
                'cfo-project/scss/**/*.scss',
                'cfo-project/scss/**/**/*.scss'
                //'cfo-project/css/app.css'

                ],
        tasks: ['sass'],
        options: {
          spawn: true,
          livereload: true
        }
      }
    },

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  //grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['sass', 'concat', 'uglify', 'watch']);

};