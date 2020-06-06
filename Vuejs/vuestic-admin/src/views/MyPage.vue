<!-- Documentation sur modal : https://github.com/epicmaxco/vuestic-admin/wiki/Modals -->
<!-- documentation officielle Vue sur slots: https://fr.vuejs.org/v2/guide/components-slots.html -->

<template>
<div id="">
  <h2>Ma page pour tester 2 l'UI</h2>
  <va-button small @click="show"> Un small bouton</va-button>

  <va-modal v-model="showModal" size="large">
    <!-- On utilise le v-slot:default de la fenetre modale pour injecter notre contenu html personalisé -->
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
  name: "MyPage",
  data: () => ({
    showModal: false
  }),
  methods: {
    show() {
      console.log(this.showModal);
      this.showModal = true;
      console.log("click");
    }
  }
};
</script>
<style lang="scss" scoped></style>
