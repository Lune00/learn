<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <tabs></tabs>
    <Bouton @addEvent="interceptAddEvent"/>
  </div>
</template>

<script>

import Bouton from '@/components/Bouton.vue';
import Tabs from '@/components/Tabs.vue';

export default {
  name: 'App',
  components: {
    Bouton, Tabs
  },
  methods:{
    interceptAddEvent(){
      console.log('Event from Bouton has bubbled to Root');
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
