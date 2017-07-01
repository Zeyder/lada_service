import $ from 'jquery';
import Vue from 'vue';
import SearchForm from './SearchForm';

window.$ = $;
window.jQuery = $;

require('./owl.carousel.min.js');

$(document).ready(function(e){
    $('.carousel.owl-carousel').owlCarousel({
        mouseDrag: false,
        nav: false,
        items: 1,
        smartSpeed: 500,
    });
});

new Vue({
    el: '#search-app',
    components: {SearchForm}
})