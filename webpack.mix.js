const { mix } = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/admin/app.js', 'public/js/admin')
    .stylus('resources/assets/styl/admin/styles.styl', 'public/css/admin')
    .js('resources/assets/js/client/app.js', 'public/js/client')
    .stylus('resources/assets/styl/client/styles.styl', 'public/css/client')
   .version();


if (mix.inProduction()) {
    mix.version();
}
