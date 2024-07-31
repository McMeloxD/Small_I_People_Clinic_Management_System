<template>
  <div>
    <div id="chart" style="width: 600px; height: 600px;;margin-left: 100px;font-size: 20px"></div>
  </div>

</template>

<script>
import {getYuan} from "@/api/user";
import * as echarts from 'echarts';

export default {
  name: '',
  mounted() {
    this.initChart()
  },
  methods: {
    initChart() {
      const chart = echarts.init(document.getElementById('chart'))
      getYuan().then(res => {
        const seriesData = res.data.values.map((value, index) => ({
          value,
          name: res.data.categories[0][index]
        }));
        chart.setOption({
          series: [
            {
              type: 'pie',
              data: seriesData
            }
          ]
        });
      })
    }
  }
}
</script>

<style scoped lang="scss">

</style>
