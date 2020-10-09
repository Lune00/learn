import Vue from 'vue'
import Vuex from 'vuex'

import * as notification from '@/modules/notifications.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: {
      id: 123,
      name: 'Paul Schuhmacher'
    },
    categories: ['chocolat', 'poireaux', 'bananes', 'artichaux'],
    count: 0
  },
  mutations: {
    INCREMENT_COUNT(state, increment){
      state.count += increment;
    }
  },
  actions: {},
  getters: {
    catLength: state => {
      return state.categories.length
    }
  }
})
