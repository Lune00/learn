<script>
import { Line, mixins } from "vue-chartjs";
const {reactiveProp} = mixins
export default  {
  extends: Line,
  mixins: [reactiveProp],
  name: "MyChart",
  data() {
    return {};
  },
  props: {
    options: {
      type: Object,
      required: true,
      default: null,
    },
  },
  mounted() {
    this.renderChart(this.chartData, this.options);
  },
  computed: {
 
  },
};
</script>

<style lang="scss" scoped>
</style>