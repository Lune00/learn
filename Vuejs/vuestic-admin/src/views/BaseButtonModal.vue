<!-- Composant générique, a mettre dans '@/components/modals' -->
<!-- Ou pas, construire plutot ce composant a chaque fois que necesaire car trop de personalisation possibles entre le bouton et la modale -->
<template>
  <div>
    <!-- v-bind="buttonProps" decompose l'objet pour le passer comme un ensemble de props v-bind:buttonProps.clef=valeur -->
    <va-button v-bind="buttonProps" @click="showModal">
      <slot name="buttonText"></slot>
    </va-button>
    <va-modal v-model="show" size="large">
      <!-- On utilise le v-slot:header de la fenetre modale pour injecter notre header personalisé-->
      <template v-slot:header>
        <slot name="modal-header"></slot>
      </template>
      <!-- On utilise le v-slot:default de la fenetre modale pour injecter notre contenu html personalisé -->
      <template v-slot:default>
        <slot name="modal-content"></slot>
      </template>
    </va-modal>
  </div>
</template>
<script>
export default {
  name: "",
  props: {
    buttonProps: {
      type: Object,
      default: function() {
        return {};
      }
    }
  },
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
