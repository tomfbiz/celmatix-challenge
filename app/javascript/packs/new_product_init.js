import Vue from 'vue/dist/vue.esm'
import NewProduct from '../vues/new_product.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(NewProduct) 
  }).$mount('#new-product');

})
