<template>
  <div class="cart-item">
    <div class="name">{{ product.name }}</div>
    <div class="price">${{product.price}}</div>
    <button @click="delete_product">Remove from cart</button>
    <div class="error-message" v-html="message"></div>

  </div>
</template>

<script>
import axios from 'axios';

export default {
    props: {
      product:  {
      type: Object,
      default: () => ({
        cart_product_id: null,
        name: "",
        brand: "",
        model: "",
        price: 0.00,
        desc: ""})
    }
  },
  data: () => ({
    message: ""
  }),
  methods: {
    delete_product() {
      axios.delete('/api/cart-items/'+this.product.cart_product_id)
      .then(response =>
        this.$emit("delete-product",this.product))
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
}
</script>

<style scoped>
.cart-item {
  padding: 10px 5px 5px 5px;
  border-bottom: 3px solid #ccc;
}
div.name {
  float: left;
  font-size: 1em;
  font-weight: bold;
}
div.price {
  margin: auto;
  width: 20px;
}
button {
  float: right;
  margin-top: -2em;
  }
  .error-message {
    min-height: 0.5em;
    padding: 5px 10px;
    font-size: 0.8em
  }
</style>
