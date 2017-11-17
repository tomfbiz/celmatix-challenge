import Vue from 'vue/dist/vue.esm'
import admin from '../vues/admin.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(admin) 
  }).$mount('#admin');

})
