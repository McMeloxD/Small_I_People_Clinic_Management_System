<template>
  <div class="dashboard-container">
    <div class="dashboard-text">欢迎你回来: {{ name }}</div>
<!--    <img :src="'桶地址'+avatar" width="300px" height="300px">-->
    <br>
    <el-carousel :interval="4000" type="card" height="500px">
      <el-carousel-item v-for="item in imgs" :key="item">
        <el-image :src="item.url"></el-image>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  computed: {
    ...mapGetters([
      'name',
      'avatar'
    ])
  },
  data(){
    return{
      imgs:[
        {url:require('@/assets/lunbo/tp.jpg')},
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
}
</style>
