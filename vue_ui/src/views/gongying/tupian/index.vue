<template>
  <div>
    <h2>文件上传</h2>
    <el-upload
      class="upload-demo"
      drag
      action=""
      :http-request="uploadFile"
      :on-change="handleChange"
      multiple>
      <i class="el-icon-upload"></i>
      <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
      <div class="el-upload__tip" slot="tip">只能上传jpg文件，且不超过500kb</div>
    </el-upload>
    <el-button type="primary" @click="addItemTyp">提交</el-button>
    <div>
      <img :src="fileSrc" width="100px">
    </div>
  </div>
</template>

<script>
import {uploadPicture,addTu} from '@/api/tu'
export default {
  data(){
    return{tableData: [{
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-04',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1519 弄'
      }, {
        date: '2016-05-03',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1516 弄'
      }],
      file:null,
      fileSrc:null,
      img:''
    }
  },
  methods:{
    //添加到数据库
    addItemTyp(){
      addTu({avatar:this.img}).then(res => {
        console.log("00",this.img)
        if (res.code == 20000) {
          this.$message({
            message: "提交成功",
            type: "success",
          });
        }
      })
    },
    handleChange(file){
      this.file = file.raw;
    },
    uploadFile(){
      const file = this.file;
      const formData = new FormData();
      formData.append("file", file); // 由后端接口决定,后端参数叫file
      uploadPicture(formData).then((res) => {
        this.img = res.data
        this.$message({
          message: "上传成功",
          type: "success",
        });
        this.fileSrc = res.data
        console.log("fileSrc",this.fileSrc)
      });
    }
  }
}
</script>

<style scoped>

</style>
