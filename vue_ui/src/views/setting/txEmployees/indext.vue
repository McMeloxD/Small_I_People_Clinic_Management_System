<template>
  <div>
    <!-- 1设置容器 -->
    <div id="chart" style="width: 600px; height: 400px;"></div>
  </div>
</template>

<script>
  import * as echarts from 'echarts'
  import { getSex4ECharts } from '@/api/tux'
  export default {
    name: '',
    mounted() {
      this.initChart()
    },
    methods: {
      // 2初始化图表
      initChart() {
        const chart = echarts.init(document.getElementById('chart'))
        getSex4ECharts().then(res=>{
          console.log("res",res)
          let retData = res.data.data;
          console.log("retData",res.data)
          const options = {
            title: {
              text: '员工性别比例图'
            },
            tooltip: {
              trigger: 'axis'
            },
            legend: {
              data: ['性别']
           },
            xAxis: {
              type: 'category',
              data: res.data.sex
              // 从后端获得x轴展示内容
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                name: '性别',
                type: 'bar',
                data: res.data.num// 从后端获得x轴展示数据
              }
            ]
          }
          // 使用图表配置
          chart.setOption(options)
        })
      }
    }
  }
</script>

<style scoped>

</style>
