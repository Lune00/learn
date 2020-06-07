<template>
  <ButonModal butonText="Cliquez moi!">
    <template v-slot:header>
      <p>Titre de la fenêtre</p>
    </template>
    <template v-slot:content>
      <p>Contenu de la fenêtre modale</p>
    </template>
  </ButonModal>
</template>
<script>

// Import composant ButonModal générique
import ButonModal from './BaseButonModal.vue';

export default {
  name: "",
  components: {ButonModal},
  data: () => ({

  })
}
</script>
<style lang="scss" scoped>
</style>
