<script>
import { Line } from "vue-chartjs";

export default {
  extends: Line,
  name: "MyChart",
  data() {
    return {};
  },
  props: {
    brandData: {
      type: Array, //TODO : change to an object directly processable by vue-chartjs
      default() {
        return [];
      },
    },
    options: {
      type: Object,
      required: true,
      default: null,
    },
  },
  mounted() {
    console.log("here");
    this.renderChart(this.dataChart, this.options);
  },
  computed: {
    dataChart() {
      const dataChart = {
        labels: this.brandData.map((el) => el.date),
        datasets: [
          {
            label: "Mes données",
            backgroundColor: "#f87979",
            pointBackGroundColor: "white",
            borderWidth: 2,
            data: this.brandData.map((el) => el.score),
          },
        ],
      };
      console.log(dataChart);
      return dataChart;
    },
  },
};
</script>

<style lang="scss" scoped>
</style>