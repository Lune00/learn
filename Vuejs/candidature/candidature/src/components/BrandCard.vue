<template>
  <div>
    <h2>{{ title }}</h2>
    <div>{{ roundedAveragedScore }}</div>
  </div>
</template>

<script>
export default {
  name: "BrandCard",
  data() {
    return {};
  },
  props: {
    title: {
      type: String,
      required: true,
    },
    score: {
      type: Number,
      required: true,
    },
  },
  computed: {
    roundedAveragedScore() {
      return Math.round(this.score * 10) / 10;
    },
  },
};
</script>

<style lang="css" scoped>
</style>