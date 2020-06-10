<!-- Documentation sur modal : https://github.com/epicmaxco/vuestic-admin/wiki/Modals -->
<!-- documentation officielle Vue sur slots: https://fr.vuejs.org/v2/guide/components-slots.html -->
<template>
<div id="">
  <h2>Ma page pour tester 2 l'UI</h2>
  <ButtonModalCustom></ButtonModalCustom>
  <BaseSelect></BaseSelect>
</div>

</template>
<script>

import ButtonModalCustom from './ButtonModalCustom.vue';
import BaseSelect from './BaseSelect.vue';

export default {
  name: "MyPage",
  components: {
    ButtonModalCustom, BaseSelect
  },
  data: () => ({
  }),
};
</script>
<style lang="scss" scoped></style>
