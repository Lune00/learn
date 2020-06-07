<template>
<div id="">
  <va-button small @click="showModal"> {{butonText}}</va-button>
  <va-modal v-model="show" size="large">
    <!-- On utilise le v-slot:header de la fenetre modale pour injecter notre header personalisé-->
    <template v-slot:header>
      <slot name="header"></slot>
    </template>
    <!-- On utilise le v-slot:default de la fenetre modale pour injecter notre contenu html personalisé -->
    <template v-slot:default>
      <slot name="content"></slot>
    </template>
  </va-modal>
</div>
</template>
<script>
export default {
  name: "",
  props: ['butonText'],
  data: () => ({
    show: false
  }),
  methods: {
    showModal() {
      this.show = true;
    }
  }
};
</script>
<style lang="scss" scoped></style>
