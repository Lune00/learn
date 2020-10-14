<template>
  <div id="app" class="container-fluid">
    <NavBar></NavBar>
    <MainPage></MainPage>
  </div>
</template>

<script>
import MainPage from "@/views/Home";
import NavBar from "@/components/NavBar";

export default {
  name: "App",
  components: { MainPage, NavBar },
};
</script>

<style>
</style>
