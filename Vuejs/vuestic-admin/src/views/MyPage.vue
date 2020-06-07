<!-- Documentation sur modal : https://github.com/epicmaxco/vuestic-admin/wiki/Modals -->
<!-- documentation officielle Vue sur slots: https://fr.vuejs.org/v2/guide/components-slots.html -->
<template>
<div id="">
  <h2>Ma page pour tester 2 l'UI</h2>
  <ButonModalCustom></ButonModalCustom>
</div>
</template>
<script>

import ButonModalCustom from './ButonModalCustom.vue';

export default {
  name: "MyPage",
  components: {
    ButonModalCustom
  },
  data: () => ({
  }),
};
</script>
<style lang="scss" scoped></style>
