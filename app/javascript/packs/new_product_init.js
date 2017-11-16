import Vue from 'vue/dist/vue.esm'
//import NewProduct from '../vues/new_product.vue'
import Users from '../vues/users.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Users) 
  }).$mount('#new-product');

})
