<template>
  <div>
    <div class="error-message" v-html="message"></div>
    <div id="cart">
        <cart-item 
        v-for="product in products"
        :product="product" 
        v-on:delete-product="delete_product(product)">
        </cart-item>
    </div>
    <button v-if="products.length  > 0" @click="make_order" class="order-button">Order these items</button>
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
      products: [],
      message: ""
    }
  },
  methods: {
    delete_product(product) {
      this.products.splice(this.products.indexOf(product), 1)
    },
    make_order() {
      axios.post("/api/orders").then(response => {
        debugger;
        this.message = response.data.message;
        this.products=[]})
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
}

div.error-message {
  padding: 10px 0;
  font-weight: bold;
  min-height: 1em;
}
button.order-button {
  margin-top: 20px;
  font-size: 1em;
  border-radius: 2px;
}
</style>
