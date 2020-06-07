<!-- Old version, do not use! -->
<template>
  <div id="">
    <va-button small @click="showModal"> Bouton Fenetre Modale</va-button>
    <va-modal
      v-model="show"
      size="large"
      cancelText="Fermer"
      title="Fenetre modale"
      message="Hello tout le monde"
      noEscDismiss
      noOutsideDismiss
    >
      <!-- On utilise le v-slot:default de la fenetre modale pour injecter notre contenu html personalisé -->
      <template v-slot:header>
        <p>Fenêtre modale</p>
      </template>
      <template v-slot:default>
        <p>Un paragraphe</p>
        <p>Un autre paragraphe</p>
        <ul>
          <li>element 1</li>
          <li>element 2</li>
          <li>element 3</li>
        </ul>
      </template>
    </va-modal>
  </div>
</template>
<script>
export default {
  name: "",
  data: () => ({
    show: false
  }),
  methods:{
    showModal(){
      this.show = true;
    }
  }
};
</script>
<style lang="scss" scoped></style>
