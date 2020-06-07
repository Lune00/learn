<!-- Peut etre abandonner ce composant et utiliser plutot directement comme composant BaseButtonModal -->
<!-- Sinon ca va faire bcp d'interfacage pour personaliser la modale (Sinon ) -->

<template>
  <ButtonModal :buttonProps="buttonProps">
    <template v-slot:buttonText>
      Cliquez ici 2 !
    </template>
    <template v-slot:modal-header>
      <p>Titre de la fenêtre</p>
    </template>
    <template v-slot:modal-content>
      <p>Contenu de la fenêtre modale</p>
    </template>
  </ButtonModal>
</template>
<script>
// Import composant ButonModal générique
import ButtonModal from "./BaseButtonModal.vue";

export default {
  name: "",
  components: { ButtonModal },
  data: () => ({
    buttonProps: {
      large: true,
      color: 'danger',
      outline: true
    }
  })
};
</script>
<style lang="scss" scoped></style>
