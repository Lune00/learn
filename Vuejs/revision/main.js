let compteur = {
  props: {
    startingValue: {
      type: Number,
      default: 0
    }
  },

  template: `<button @click="increment">{{startingValue + compteur}} </button>`,

  data() {
    return {
      compteur: 10
    }
  },
  methods: {
    increment() {
      console.log('increment');
      this.compteur++;
    },
  }
};


let vm = new Vue({
  el: '#app',
  components: {compteur},
  data: {
    compteur: 13,
    message: 'Un message'
  },
  methods: {
    otherfunction() {
      console.log('otherfunction')
    }
  }
});
