<template>
  <div>
    <div class="d-flex justify-content-between menu">
      <div>Évolution</div>
      <select v-model="selectedBrand" @change="onChangeBrandSelected()">
        <option
          v-for="brandName in brandNames"
          v-bind:value="brandName"
          :key="brandName"
        >
          {{ brandName }}
        </option>
      </select>
    </div>

    <MyChart
      v-bind:options="chartOptions"
      :chart-data="dataCollection"
    ></MyChart>

    <div class="row">
      <BrandCard
        v-for="item in averagedScoresByBrand"
        v-bind:title="item.name"
        v-bind:score="item.averagedScore"
        :key="item.name"
        class="col-4"
      ></BrandCard>
    </div>
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
      averagedScoresByBrand: null,
      chartOptions: null, //TODO : should be removed from this component
      dataCollection: null,
    };
  },
  created() {
    //Fetch and init data

    //List of all brand names
    this.brandNames = DataService.getBrandNames();

    //Current selected brand name
    this.selectedBrand = this.brandNames[0]; //TODO : refactor
    
    //Map each brand name to its averaged score
    this.averagedScoresByBrand = DataService.getAveragedScoreByBrand();

    this.chartOptions = ChartOptions.getChartDefaultOptions();
    this.updateSelectedBrandData();
  },

  methods: {
    updateSelectedBrandData() {
      //Time series of a brand score
      this.selectedBrandData = DataService.getBrandData(this.selectedBrand);
      //Map data to a collection to feed the chart
      this.dataCollection = this.mapBrandDataToCollection(
        this.selectedBrand,
        this.selectedBrandData
      );
    },
    onChangeBrandSelected() {
      this.updateSelectedBrandData();
    },
    mapBrandDataToCollection(selectedBrand, selectedBrandData) {
      const dataCollection = {
        labels: selectedBrandData.map((el) => el.date),
        datasets: [
          {
            label: selectedBrand,
            borderWidth: 3,
            fill: false,
            backgroundColor: ChartOptions.getBackgroundColor(),
            borderColor: ChartOptions.getBorderColor(),
            data: this.selectedBrandData.map((el) => el.score),
          },
        ],
      };
      return dataCollection;
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
.menu {
  margin-top: 1em;
}
</style>
