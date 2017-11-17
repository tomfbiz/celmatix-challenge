import Vue from 'vue/dist/vue.esm'
import Home from '../vues/home.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Home) 
  }).$mount('#home');

})
