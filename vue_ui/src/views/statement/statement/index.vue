<template>
  <div>
    <div id="chart" style="width: 600px; height: 400px;float: left;margin-left: 10px"></div>

    <div id="chart2" style="width: 600px; height: 400px;float: left;margin-left: 10px">
    </div>
    <div id="chart3" style="width: 600px; height: 400px;float: left;margin-left: 10px"></div>
    <div style="width: 600px; height: 400px;float: right;">
      <h2>文件上传</h2>
      <el-upload
        class="upload-demo"
        drag
        action="http://localhost:9999/details/uploadTu"
        :http-request="uploadFile"
        :on-change="handleChange"
        multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传jpg文件，且不超过500kb</div>
      </el-upload>
      <div>
        <img :src="fileSrc" width="100px">
      </div>
      <el-button type="primary" @click="addPicture" size="small" icon="el-icon-sel">添加图片</el-button>
    </div>

  </div>
</template>

<script>
import * as echarts from 'echarts'
import {getSex4ECharts,getBingkeECharts,getDrug4ECharts, uploadTu, addPicture} from '@/api/statement'

export default {
  name: 'index',
  mounted() {
    this.initChart()
    this.initChart2()
    this.initChart3()

  },
  methods: {

    initChart2() {
      const chart2 = echarts.init(document.getElementById('chart2'))
      getBingkeECharts().then(res =>{
        let list = res.data
        for (var i = 0;i < list.length;i++){
          if (list[i].departments == '全科'){
            var qk = list[i].num
          }else  if(list[i].departments == '外科'){
            var wk = list[i].num
          }else  if(list[i].departments == '儿科'){
            var ek = list[i].num
          }else  if(list[i].departments == '眼科'){
            var yk = list[i].num
          }else  if(list[i].departments == '妇科'){
            var fk = list[i].num
          }else  if(list[i].departments == '内科'){
            var nk = list[i].num
          }
        }
        const option = {
          title: {
            text: '患者病科分布图',
            left: 'center',
            top: 'center'
          },
          series: [
            {
              type: 'pie',
              data: [
                {
                  value: qk,
                  name: '全科\n'+ qk +'人'
                },
                {
                  value: ek,
                  name: '儿科\n' +ek + '人'
                },
                {
                  value: nk,
                  name: '内科\n' + nk + '人'
                },
                {
                  value: wk,
                  name: '外科\n' + wk + '人'
                },
                {
                  value: fk,
                  name: '妇科\n' + fk + '人'
                },
                {
                  value: yk,
                  name: '眼科\n' + yk + '人'
                }
              ],
              radius: ['40%', '70%']
            }
          ]
        };
        // 使用图表配置
        chart2.setOption(option)
      })
    },


    initChart() {
      const chart = echarts.init(document.getElementById('chart'))
      getSex4ECharts().then(res=>{
        // console.log("res",res)
        let retData = res.data.data;
        const options = {
          title: {
            text: '患者性别比例图'
          },
          tooltip: {
            trigger: 'axis'
          },
          legend: {
            data: ['性别']
          },
          xAxis: {
            type: 'category',
            data: res.data.categories
            // 从后端获得x轴展示内容
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: '性别',
              type: 'bar',
              data: res.data.values // 从后端获得x轴展示数据
            }
          ]
        }
        // 使用图表配置
        chart.setOption(options)
      })
    },
    addPicture(){
      addPicture({avatar:this.img}).then(res=>{
        if (res.code == 20000){
          this.$message({
            type:'success',
            message:'保存图片成功',
            duration:1000
          })
        }
      })
    },
    handleChange(file) {
      this.file = file.raw;
    },
    uploadFile() {
      const file = this.file;
      const formData = new FormData();
      formData.append("file", file); // 由后端接口决定,后端参数叫file
      uploadTu(formData).then((res) => {
        this.img = res.data;
        this.$message({
          message: "上传成功",
          type: "success",
        });
        this.fileSrc = res.data
        console.log("fileSrc", this.fileSrc)
      });
    },
    initChart3() {
      const chart3 = echarts.init(document.getElementById('chart3'))
      getDrug4ECharts().then(res=>{

        let retData = res.data.data;
        const options = {
          title: {
            text: '药品出售数量比例图'
          },
          tooltip: {
            trigger: 'axis'
          },
          legend: {
            data: ['药品出售数量']
          },
          xAxis: {
            type: 'category',
            data: res.data.categories
            // 从后端获得x轴展示内容
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: '药品出售数量',
              type: 'line',
              data: res.data.values // 从后端获得x轴展示数据
            }
          ]
        }
        // 使用图表配置
        chart3.setOption(options)
      })

    },
  }
}
</script>

<style scoped>

</style>
