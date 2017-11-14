<template>
    <div class="modal-mask"  @click="close">
      <div class="modal-wrapper">
        <div class="modal-container">
          <button class="modal-close-button" @click="close">x </button>
            <h2>{{ product.name }}</h2>
            brand: {{product.brand}}<br>
            model: {{product.model}}<br>
            ${{product.price}}
            <p>{{product.description}}</p>
        </div>
      </div>
    </div>
</template>

<script>

export default {
    props: {
      product:  {
      type: Object,
      default: () => ({
        id: null,
        name: "",
        brand: "", 
        model: "", 
        sku: "", 
        price: 0.00, 
        desc: ""})
    }
  },
  data: () => ({
    test: 123
  }),
  methods: {
    close() {
      this.$emit('close');
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
  font-family: Helvetica, Arial, sans-serif;
}


.modal-close-button {
    float: right;
    border: none;
    font-weight: bold;
    font-size: 1.3em
}
</style>
