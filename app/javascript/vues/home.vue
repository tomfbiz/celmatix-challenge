<template>
  <div class="wrapper">
    <div class="tab-container">
      <a href="#" class="tab first" 
        v-bind:class="{selected: showing_products}"
        @click="showing_products=true">Shop</a>
      <a href="#" class="tab second" 
      v-bind:class="{selected: !showing_products}" 
      @click="showing_products=false">Cart</a>
    </div>
    <div class="container">
      <products v-if="showing_products"></products>
      <cart v-else></cart>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import products from './products.vue'
import cart from './cart.vue'

export default {
  components: {
    cart,
    products
  },
  data: function () {
    return {
      showing_products: true
    }
  },
  methods: {
    showDetails(product) {
      this.modalProduct = product;
      this.showModal = true;
    }
  }
}
</script>

<style>
div.wrapper {
  width: 1000px;
}
div.container {
  margin: auto;
  border: solid #ccc 1px;
}
a.tab {
  border: solid #ccc 1px;
  width: 130px;
  height: 20px;
  display: block;
  text-align: center;
  padding: 5px 5px 0 5px;

  &.first {
    padding-right:30px;
    float: left;
  }

&.second {
    float: right;
  }
}
.tab.selected {
    background-color: #eee;
  }

div.tab-container {
  width: 320px;
  height: 26px;
  margin: 50px auto 0;
}
</style>
