<template>
  <div class="card">
    <div class="card-body">
      <h3>{{ roundedAveragedScore }}</h3>
      <div>{{ title }}</div>
    </div>
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