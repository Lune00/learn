<template>
<div id="">
  <button type="button" name="button" @click="clicked">{{text}}</button>
</div>
</template>
<script>
export default {
  name: "BoutonInterne",
  props: {
    text: {
      type: String,
      required: true,
      default: "Hi"
    }
  },
  data: () => ({
    myText: ''
  }),
  methods: {
    clicked() {
      //Will be passed as first argument to the methods called on the eventListener
      this.$emit('addEvent', 5);
    }
  }
}
</script>
<style lang="scss" scoped>
</style>
