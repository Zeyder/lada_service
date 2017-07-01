import Vue from 'vue';
require('jquery-mask-plugin');

Vue.directive('mask', (el, binding) => $(el).mask(binding.value));