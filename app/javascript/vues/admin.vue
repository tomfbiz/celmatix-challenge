<template>
  <div>
    <header class="page-header">
      <h2>Admin</h2>
    </header>
    <div class="tab-container">
      <a href="#" class="tab users" 
        v-bind:class="{selected: showing_users}"
        @click="showing_users=true">Users</a>
      <a href="#" class="tab new-product" 
      v-bind:class="{selected: !showing_users}" 
      @click="showing_users=false">New Product</a>
    </div>
    <div class="container">
      <users v-if="showing_users"></users>
      <new-product v-else></new-product>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import newProduct from './new_product.vue'
import users from './users.vue'

export default {
  components: {
    newProduct,
    users
  },
  data: function () {
    return {
      showing_users: true
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
div.container {
  width: 626px;
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

  &.users {
    padding-right:30px;
    float: left;
  }

&.new-product {
    float: right;
  }
}
.tab.selected {
    background-color: #eee;
  }

div.tab-container {
  width: 320px;
  height: 26px;
  margin: auto;
}
</style>
