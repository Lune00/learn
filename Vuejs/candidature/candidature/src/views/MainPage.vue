<template>
  <div id="container">
    <h1>Notes par plateforme</h1>

    <select v-model="selectedBrand" @change="onChangeBrandSelected()">
      <option
        v-for="brandName in brandNames"
        v-bind:value="brandName"
        :key="brandName"
      >
        {{ brandName }}
      </option>
    </select>

    <MyChart
      v-bind:brandData="selectedBrandData"
      v-bind:options="chartOptions"
    ></MyChart>

    <BrandCard
      v-for="item in averagedScoreByBrandDesc"
      v-bind:title="item.name"
      v-bind:score="item.averagedScore"
      :key="item.name"
    ></BrandCard>
  </div>
</template>

<script>
import DataService from "@/services/DataService.js";
import BrandCard from "@/components/BrandCard";
import MyChart from "@/components/Chart";
import ChartOptions from "@/services/ChartOptions.js";

export default {
  name: "MainPage",
  components: { BrandCard, MyChart },
  data() {
    return {
      selectedBrand: null,
      selectedBrandData: null,
      brandNames: null,
      averagedScoreByBrand: null,
      chartOptions: null, // TODO : should be removed (passe directement le retour d'une fonction en prop?)
    };
  },
  created() {
    //Fetch and init data
    this.brandNames = DataService.getBrandNames();
    this.averagedScoreByBrand = DataService.getAveragedScoreByBrand();
    this.selectedBrand = this.brandNames[0];
    this.selectedBrandData = DataService.getBrandData(this.selectedBrand);
    this.chartOptions = ChartOptions.getChartDefaultOptions();
  },

  methods: {
    onChangeBrandSelected() {
      this.selectedBrandData = DataService.getBrandData(this.selectedBrand);
    },
  },
  computed: {
    averagedScoreByBrandDesc() {
      const tmp = [...this.averagedScoreByBrand];
      return tmp.sort((a, b) => b.averagedScore - a.averagedScore);
    },
  },
};
</script>

<style scoped>
</style>
