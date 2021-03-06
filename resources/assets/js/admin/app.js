import $ from 'jquery';
window.$ = $;
window.jQuery = $;
window.moment = require('moment');
require("babel-polyfill");
require('../../vendor/datetimepicker/jquery.datetimepicker.full.js');
require('../../vendor/datetimepicker/jquery.datetimepicker.min.css');
require('../../vendor/stickytableheader');
$.datetimepicker.setLocale('ru');
import Vue from 'vue';
import store from './store';
import axios from 'axios';
import App from './components/App';

axios.defaults.baseURL = `${window.location.origin}/api/v1`;

new Vue({
    el: '#app',
    store,
    render: h => h(App)
});