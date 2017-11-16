<template>
  <div class="form-wrapper">
    <div class="error-message" v-html="message"></div>
  <form id="new-product-form" action="#">
    <div>
      <label for="name">Product name</label>
      <input type=text id="name" v-model='product.name' required>
      <label for="brand">Brand</label>
      <input type=text id="brand" v-model='product.brand'>
      <label for="model">Model</label>
      <input type=text id="model" v-model='product.model'>
      <label for="price">Price</label>
      <input type="number" min="0" step="any" id="price" v-model='product.price' required>
      <label for="desc">Description</label>
      <textarea id="desc" v-model='product.desc'></textarea>
      <br>
      <button type="button" @click.prevent="saveProduct">Save</button>
      <input type="submit" style="display:none">
    </div>
  </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      product: {
        name: "",
        brand: "",
        model: "",
        price: null,
        desc: ""
      },
      message: ""

    }
  },
  methods: {
    saveProduct(product) {
      if (valid_form()) { 
        axios.post('/api/products',{product: this.product})
        .then(response =>
        this.message = response.data.message)
        .catch(error => {
          if (error.response.status == 401) {
            this.message = "please log in as Admin";
          } else if (error.response.data.errors){
            this.message = error.response.data.errors.join(" <br>")
          } else {
            this.message =  error.response.statusText;
          }
        })
      }
    }
  },
  created() {
    let token = document.getElementsByName('csrf-token')[0].getAttribute('content');
    axios.defaults.headers.common['X-CSRF-Token'] = token;
    axios.defaults.headers.common['Accept'] = 'application/json';
  }
}

function valid_form() {
  const form = document.querySelector("form#new-product-form");
  let is_valid = true;
  if (typeof form.checkValidity == "function") {
    is_valid = form.checkValidity();
    if (!is_valid) {
      document.querySelector("form#new-product-form input[type='submit']").click();
    }
  }
  return(is_valid);
}
</script>

<style>
div.form-wrapper {
  margin: auto;
  width: 450px;
}
div.error-message {
  padding: 10px 0;
  font-weight: bold;
  min-height: 1em;
}
label {
  display: block;
  padding: 10px 5px
}
input, textarea {
  width: 100%;
  margin-left: 10px;
  border: solid #ccc 1px;
}
textarea {
  height: 10em;
}
button {
  font-size: 1em;
  margin: 20px 0 0 0px;
  border-radius: 5px;
}
</style>
