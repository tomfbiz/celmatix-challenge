<template>
  <div>
    <div class="error-message">{{message}} </div>
    <div id="cart">
        <cart-item 
        v-for="product in products"
        :product="product" 
        v-on:delete-product="deleteProduct(product)">
        </cart-item>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import cartItem from './cart_item.vue'

export default {
  components: {
    cartItem
  },
  data: function () {
    return {
      products: {},
      message: ""
    }
  },
  methods: {
    deleteProduct(product) {
      this.products.splice(this.products.indexOf(product), 1)
    }
  },
  created() {
    let token = document.getElementsByName('csrf-token')[0].getAttribute('content');
    axios.defaults.headers.common['X-CSRF-Token'] = token;
    axios.defaults.headers.common['Accept'] = 'application/json';
    axios.get('/api/cart-items')
      .then(response =>
      this.products = response.data.products)
      .catch(error => {
        if (error.response.status == 401) {
          this.message = "please log in";
        } else {
          this.message = error.response.data.errors[0] || error.response.statusText;
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
}

div.error-message {
  padding: 10px 0;
  font-weight: bold;
  min-height: 1em;
}
</style>
