<template>
  <h1>Notes par plateforme</h1>
</template>

<script>
import DataService from "@/service/DataService.js";

export default {
  name: "MainPage",
  data() {
    return {
      data: null,
    };
  },
  created() {
    this.data = DataService.getBrandList();
    console.log(this.data);
  },
};
</script>

<style scoped>
</style>
