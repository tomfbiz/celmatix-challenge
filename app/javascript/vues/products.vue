<template>
  <div>
    <div class="error-message" v-html="message"></div>
    <div class="product-list">
      <product-modal v-if="showModal" :product="modalProduct" @close="showModal = false"></product-modal>
      <div v-for="product in products">
        <product-grid-item :product="product" v-on:show-details="showDetails"></product-grid-item>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import productGridItem from './product_grid_item.vue'
import productModal from './product_modal.vue'

export default {
  components: {
    productGridItem,
    productModal
  },
  data: function () {
    return {
      products: {},
      modalProduct: {},
      showModal: false,
      message: ""

    }
  },
  methods: {
    showDetails(product) {
      this.modalProduct = product;
      this.showModal = true;
    }
  },
  created() {
    axios.defaults.headers.common['Accept'] = 'application/json';
    axios.get('/api/products')
      .then(response =>
      this.products = response.data.products)
      .catch(error => {
        if (error.response.status == 401) {
          this.message = "please log in";
        } else if (error.response.data.errors){
          this.message = error.response.data.errors.join(" <br>")
        } else {
          this.message =  error.response.statusText;
        }
      })
  }
}
</script>

<style>
.product-list {
  display: grid;
  grid-template-columns: 300px 300px 300px;
  grid-gap: 10px;
  justify-content: center;
}

div.error-message {
  padding: 10px 0;
  font-weight: bold;
  min-height: 1em;
}
</style>
