import Vue from 'vue/dist/vue.esm'
import Products from '../vues/cart.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Cart) 
  }).$mount('#cart');

})
