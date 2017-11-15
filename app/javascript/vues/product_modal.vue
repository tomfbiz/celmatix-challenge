<template>
    <div class="modal-mask"  @click="close">
      <div class="modal-wrapper">
        <div class="modal-container" @click.stop>
          <button class="modal-close-button" @click="close">x </button>
            <h2>{{ product.name }}</h2>
            brand: {{product.brand}}<br>
            model: {{product.model}}<br>
            ${{product.price}}
            <p>{{product.description}}</p>
            <button class="submit" @click="add_to_cart">Add to cart</button>
            <div class="error-message">{{message}}</div>
        </div>
      </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    props: {
      product:  {
      type: Object,
      default: () => ({
        id: null,
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
    close() {
      this.$emit('close');
    },
    add_to_cart() {
      axios.post('/api/cart-items',{product: this.product.id})
        .then(response =>
          this.message = response.data.message)
        .catch(error => {
          if (error.response.status == 401) {
            this.message = "please sign in";
          } else {
            this.message = this.get_error_message(error);
          }
        })
    }
  }
}
</script>

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 300px;
  min-height: 100px;
  margin: 0px auto;
  padding: 1px 1px 10px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
}


.modal-close-button {
    float: right;
    border: none;
    font-weight: bold;
    font-size: 1.3em
}
button.submit {
  background-color: #eee;
}
</style>
