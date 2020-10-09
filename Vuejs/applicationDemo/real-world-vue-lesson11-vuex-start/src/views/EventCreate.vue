<template>
<div id="">
  <h1>Create event, {{user}}</h1>
  <div v-for="(cat,index) in categories" :key="index">
    <div class="">
      <div v-if="index % 2 === 1" class="">
        {{cat}} {{index}}
      </div>
    </div>
  </div>
  <div class="">
    {{categories}}, number : {{catLength}}
  </div>
  <input type="number" name="" v-model.number="incrementBy">
  <button type="button" name="button" @click="incrementCount">Increment</button>
</div>
</template>

<script>

import { mapState } from 'vuex'
export default {
  name: '',
  data: () => ({
    incrementBy: 3
  }),
  // computed: mapState({
  //   userName: state => state.user.name,
  //   categories: state => state.categories,
  //   categoriesRef: 'categories',
  //   user: 'user',
  // }),
  computed: {
    ...mapState(['user', 'categories']),

    catLength() {
      return this.$store.getters.catLength
    },
  },
  methods: {
    incrementCount(){
      console.log(this)
      this.$store.commit('INCREMENT_COUNT', this.incrementBy)
    }
  }
}
</script>
<style lang="css" scoped>
</style>
