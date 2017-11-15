<template>
  <div class="grid-item">
    <h2>{{ product.name }}</h2>
    brand: {{product.brand}}<br>
    model: {{product.model}}<br>
    ${{product.price}}<br><br>
    <button @click="request_modal">details</button>
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
        price: 0.00,
        desc: ""})
    }
  },
  data: () => ({
  }),
  methods: {
    request_modal() {
      this.$emit("show-details",this.product)
    }
  }
}
</script>

<style scoped>
.grid-item {
  background-color: #eee;
  border-radius: 5px;
  padding: 20px;

}
  h2 {
    font-size: 1em;
  }
</style>
