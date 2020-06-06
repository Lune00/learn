<template>
<div>
  <input type="text" name="" v-model="text">
  <button type="button" name="button" @click="add" >{{text}} : {{count}}</button>
  <!-- Props allows to send data to child, v-on:event allows child to send data to parent (ecouter à la surface du composant
  enfant dans le composant parent) -->
  <bouton-interne :text="text +' is a prop'" v-on:addEvent="addFromEvent"/>
</div>
</template>
<script>
import BoutonInterne from '@/components/BoutonInterne.vue'
export default {
  name: "Bouton",
  components: {
    BoutonInterne
  },
  data: () => {
    return {
      count: 0,
      text: 'toto'
    }
  },
  methods: {
    add() {
      this.count++;
    },
    addFromEvent(inc) {
      this.count += inc;
      console.log('Event from BoutonInterne has bubbled to Bouton')
      this.$emit('addEvent');
    },
  }
}
</script>
<style lang="scss" scoped>
</style>
