import Vue from 'vue/dist/vue.esm'
import Products from '../vues/products.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Products) 
  }).$mount('#products');

})
