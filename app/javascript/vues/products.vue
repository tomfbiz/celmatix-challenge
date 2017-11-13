<template>
  <div id="app"  class="product-list">
    <div v-for="product in products">
      <product-grid-item :product="product"></product-grid-item>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import productGridItem from './product_grid_item.vue'

export default {
  components: {
    productGridItem
  },
  data: function () {
    return {
      products: {}
    }
  },
    created() {
      let token = document.getElementsByName('csrf-token')[0].getAttribute('content');
      axios.defaults.headers.common['X-CSRF-Token'] = token;
      axios.defaults.headers.common['Accept'] = 'application/json';
      axios.get('/api/products')
        .then(response =>
        this.products = response.data.products)
  }
}
</script>

<style scoped>
.product-list {
  display: grid;
  grid-template-columns: 300px 300px 300px;
  grid-gap: 10px;
}
</style>
